create database empresa;
use empresa;
-- Crear la tabla de empleados
CREATE TABLE empleados (
    EmpID INT AUTO_INCREMENT PRIMARY KEY, -- ID único para cada empleado
    Nombre VARCHAR(100) NOT NULL,         -- Nombre del empleado
    Departamento VARCHAR(50) NOT NULL,   -- Departamento en el que trabaja
    Salario DECIMAL(10, 2) NOT NULL      -- Salario del empleado
);

-- Crear la tabla de auditoría
CREATE TABLE auditoria (
    AudID INT AUTO_INCREMENT PRIMARY KEY, 
    Accion ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL, 
    EmpID INT,                            
    Nombre VARCHAR(100),                  
    Departamento VARCHAR(50),             
    Salario DECIMAL(10, 2),               
    Fecha date,
    CONSTRAINT FK_Empleado FOREIGN KEY (EmpID) REFERENCES empleados(EmpID) 
);

DELIMITER $$

-- Trigger para INSERT
CREATE TRIGGER trg_auditoria_empleados_insert
AFTER INSERT ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('INSERT', NEW.EmpID, NEW.Nombre, NEW.Departamento, NEW.Salario, NOW());
END$$

-- Trigger para UPDATE
CREATE TRIGGER trg_auditoria_empleados_update
AFTER UPDATE ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('UPDATE', NEW.EmpID, NEW.Nombre, NEW.Departamento, NEW.Salario, NOW());
END$$

-- Trigger para DELETE
CREATE TRIGGER trg_auditoria_empleados_delete
AFTER DELETE ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('DELETE', OLD.EmpID, OLD.Nombre, OLD.Departamento, OLD.Salario, NOW());
END$$

DELIMITER ;

-- Insertar un nuevo empleado
INSERT INTO empleados (Nombre, Departamento, Salario) VALUES
('Eddy Morales', 'Ventas', 3000.00),
('karen ascanta', 'Marqueting', 3000.00),
('alexandra gonzales', 'Ventas', 3000.00);

-- Actualizar un empleado existente
UPDATE empleados 
SET Salario = 3500.00 
WHERE EmpID = 1;
-- Eliminar un empleado existente
DELETE FROM empleados 
WHERE EmpID = 1;

SELECT * FROM auditoria;


