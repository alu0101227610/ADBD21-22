

--Disparador para comprobar el email
CREATE OR REPLACE FUNCTION crearEmail() returns Trigger AS $email$
    BEGIN
        IF NEW.email IS NULL THEN
            NEW.email := CONCAT(NEW.Nombre, NEW.Apellidos, '@', TG_ARGV[0]);
        ELSIF (NEW.email not like '%@ull.edu.es') THEN
            RAISE EXCEPTION 'El formato del correo no es valido';
        END IF;
    RETURN NEW;
    END
    $email$
    LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS cemail_trigger ON  cliente;
CREATE  TRIGGER email_trigger BEFORE INSERT ON cliente
FOR EACH ROW EXECUTE PROCEDURE crearEmail('ull.edu.es');

--Disparador para comprobar el numero de viviendas
CREATE OR REPLACE FUNCTION comprobar_vivienda() returns Trigger AS   $vivienda$
    BEGIN
 IF NEW.viviendas > 1 THEN
  IF NEW.municipio ='catastro' THEN 
     RAISE 'ERROR!! No puede vivir en el municipio Catastro y tener mas de 1 vivienda';
   END IF;
 END IF;
     RETURN NEW;
    END;
    $vivienda$
    LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS comprobar_vivienda_trigger ON  cliente;
CREATE TRIGGER comprobar_vivienda_trigger BEFORE INSERT ON cliente
FOR EACH ROW EXECUTE PROCEDURE comprobar_vivienda();

--Disparador para actualizar el stock
CREATE OR REPLACE FUNCTION actualizarStock() returns Trigger AS
    $stock$
    BEGIN     
        UPDATE producto
            SET stock = stock-NEW.cantidad
        WHERE codigoproducto=NEW.zona_codigoproducto;
    RETURN NEW;
    END;
    $stock$
    LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS compraupdate_trigger ON  compra;
CREATE TRIGGER compraupdate_trigger AFTER INSERT ON compra
FOR EACH ROW EXECUTE PROCEDURE actualizarStock();

