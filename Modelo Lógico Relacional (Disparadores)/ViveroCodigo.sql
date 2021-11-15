-- -- -----------------------------------------------------
-- -- Data for table VIVERO
-- -- -----------------------------------------------------
START TRANSACTION;
  INSERT INTO VIVERO (NOMBRE, LOCALIDAD, LATITUD, LONGITUD) VALUES ('Vivero1', 'La Laguna', 167, 83);
  INSERT INTO VIVERO (NOMBRE, LOCALIDAD, LATITUD, LONGITUD) VALUES ('Vivero2', 'Adeje', 98, 293);
  INSERT INTO VIVERO (NOMBRE, LOCALIDAD, LATITUD, LONGITUD) VALUES ('Vivero3', 'Santa Ursula', 172, 628);
COMMIT;


-- -- -----------------------------------------------------
-- -- Data for table ZONA
-- -- -----------------------------------------------------
START TRANSACTION;
  INSERT INTO ZONA (NOMBRE, VIVERO_NOMBRE) VALUES ('Zona1', 'Vivero1');
  INSERT INTO ZONA (NOMBRE, VIVERO_NOMBRE) VALUES ('Zona2', 'Vivero2');
COMMIT;


-- -----------------------------------------------------
-- Data for table PRODUCTO
-- -----------------------------------------------------
START TRANSACTION;
  INSERT INTO PRODUCTO (CODIGOPRODUCTO, NOMBRE, STOCK, PRECIO) VALUES ('1234', 'Margarita', 200, 1.80);
  INSERT INTO PRODUCTO (CODIGOPRODUCTO, NOMBRE, STOCK, PRECIO) VALUES ('5678', 'Rosa', 156, 3.50);
  INSERT INTO PRODUCTO (CODIGOPRODUCTO, NOMBRE, STOCK, PRECIO) VALUES ('3938', 'Clavel', 370, 2.25);
  INSERT INTO PRODUCTO (CODIGOPRODUCTO, NOMBRE, STOCK, PRECIO) VALUES ('2829', 'Tulipan', 90, 4.65);
COMMIT;


-- -----------------------------------------------------
-- Data for table CLIENTE
-- -----------------------------------------------------
START TRANSACTION;
  INSERT INTO CLIENTE (DNI,NOMBRE, APELLIDOS, BONIFICACION, TOTAL_MENSUAL, EMAIL, MUNICIPIO, VIVIENDAS) VALUES ('54678023J', 'Diego', 'Rodriguez', 3, 53, 'diegorodriguez@ull.edu.es','catastro',1);
  INSERT INTO CLIENTE (DNI,NOMBRE, APELLIDOS, BONIFICACION, TOTAL_MENSUAL, EMAIL, MUNICIPIO, VIVIENDAS) VALUES ('57879200P', 'Sergio', 'Pitti', 12, 200, 'sergiopitti@ull.edu.es', 'la laguna',4);
  INSERT INTO CLIENTE (DNI,NOMBRE, APELLIDOS, BONIFICACION, TOTAL_MENSUAL, EMAIL, MUNICIPIO, VIVIENDAS) VALUES ('64639161I', 'Teresa', 'Bonet', 7, 129,NULL,'catastro',1);
  INSERT INTO CLIENTE (DNI,NOMBRE, APELLIDOS, BONIFICACION, TOTAL_MENSUAL, EMAIL, MUNICIPIO, VIVIENDAS) VALUES ('51340198F', 'Antonella', 'Garcia', 10, 165, NULL,'santa cruz',2);
COMMIT;


-- -- -----------------------------------------------------
-- -- Data for table EMPLEADO
-- -- -----------------------------------------------------
START TRANSACTION;
  INSERT INTO EMPLEADO (DNI, CSS, SUELDO, ANTIGUEDAD, FECHA_INI, FECHA_FIN, VENTAS, ZONA_NOMBRE) VALUES ('59327551K', '198729300174', 1200, 1, '2020-11-01 08:00:00', NULL, 203, 'Zona1');
  INSERT INTO EMPLEADO (DNI, CSS, SUELDO, ANTIGUEDAD, FECHA_INI, FECHA_FIN, VENTAS, ZONA_NOMBRE) VALUES ('42123905L', '630264825283', 1800, 2, '2019-07-01 08:00:00', NULL, 502, 'Zona2');
COMMIT;


-- -- -----------------------------------------------------
-- -- Data for table PRODUCTO_ZONA
-- -- -----------------------------------------------------
START TRANSACTION;
  INSERT INTO PRODUCTO_ZONA (ZONA_CODIGOPRODUCTO, ZONA_NOMBRE) VALUES ('1234', 'Zona1');
  INSERT INTO PRODUCTO_ZONA (ZONA_CODIGOPRODUCTO, ZONA_NOMBRE) VALUES ('3938', 'Zona1');
  INSERT INTO PRODUCTO_ZONA (ZONA_CODIGOPRODUCTO, ZONA_NOMBRE) VALUES ('5678', 'Zona2');
  INSERT INTO PRODUCTO_ZONA (ZONA_CODIGOPRODUCTO, ZONA_NOMBRE) VALUES ('2829', 'Zona2');
COMMIT;


-- -- -----------------------------------------------------
-- -- Data for table COMPRA
-- -- -----------------------------------------------------
START TRANSACTION;
  INSERT INTO COMPRA (ZONA_CODIGOPRODUCTO, CLIENTE_DNI, FECHA, CANTIDAD, EMPLEADO_DNI) VALUES ('1234', '54678023J', '2021-05-17 19:02:21', 14, '59327551K');
  INSERT INTO COMPRA (ZONA_CODIGOPRODUCTO, CLIENTE_DNI, FECHA, CANTIDAD, EMPLEADO_DNI) VALUES ('3938', '54678023J', '2021-05-21 15:42:54', 7, '42123905L');
  INSERT INTO COMPRA (ZONA_CODIGOPRODUCTO, CLIENTE_DNI, FECHA, CANTIDAD, EMPLEADO_DNI) VALUES ('5678', '57879200P', '2021-05-23 11:42:26', 9, '42123905L');
  INSERT INTO COMPRA (ZONA_CODIGOPRODUCTO, CLIENTE_DNI, FECHA, CANTIDAD, EMPLEADO_DNI) VALUES ('2829', '57879200P', '2021-05-23 12:17:40', 25, '59327551K');
COMMIT;