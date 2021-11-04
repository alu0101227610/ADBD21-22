CREATE OR REPLACE FUNCTION crear_email() RETURNS TRIGGER AS $email$
BEGIN
    IF NEW.Email IS NULL THEN
      NEW.Email := NEW.Nombre || '@' || TG_ARGV[0];
    END IF;
    RETURN NEW;
END;
$email$
LANGUAGE 'plpgsql';

CREATE TRIGGER email_trigger
  BEFORE INSERT
  ON CLIENTE
  FOR EACH ROW
  EXECUTE PROCEDURE crear_email('ull.edu.es');

INSERT INTO Cliente (DNI, Bonificación, GastoMensual, Nombre) VALUES (38388782, 17.82, 26.70, 'Sara Lopez');