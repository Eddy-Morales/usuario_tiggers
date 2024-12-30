-- Crear el usuario SuperAdministrador con permisos para crear y eliminar bases de datos.
CREATE USER 'SuperAdministrador'@'localhost' IDENTIFIED BY 'SecurePassword1!';
GRANT CREATE, DROP ON *.* TO 'SuperAdministrador'@'localhost' WITH GRANT OPTION;


-- Crear el usuario Administrador con permisos para gestionar usuarios y procesos.
CREATE USER 'Administrador'@'localhost' IDENTIFIED BY 'SecurePassword2!';
GRANT CREATE USER, PROCESS ON *.* TO 'Administrador'@'localhost' WITH GRANT OPTION;


-- Crear el usuario CRUD con permisos para insertar, actualizar y eliminar datos.
CREATE USER 'CRUD'@'localhost' IDENTIFIED BY 'SecurePassword3!';
GRANT INSERT, UPDATE, DELETE ON *.* TO 'CRUD'@'localhost';


-- Crear el usuario CRU con permisos para insertar y actualizar datos, pero no para eliminar.
CREATE USER 'CRU'@'localhost' IDENTIFIED BY 'SecurePassword4!';
GRANT INSERT, UPDATE ON *.* TO 'CRU'@'localhost';


-- Crear el usuario SoloLectura con permisos para consultar datos.
CREATE USER 'SoloLectura'@'localhost' IDENTIFIED BY 'SecurePassword5!';
GRANT SELECT ON *.* TO 'SoloLectura'@'localhost';


-- Copia y ejecuta estas líneas una por una para comprobar los permisos asignados:
SHOW GRANTS FOR 'SuperAdministrador'@'localhost';

SHOW GRANTS FOR 'Administrador'@'localhost';

SHOW GRANTS FOR 'CRUD'@'localhost';

SHOW GRANTS FOR 'CRU'@'localhost';

SHOW GRANTS FOR 'SoloLectura'@'localhost';