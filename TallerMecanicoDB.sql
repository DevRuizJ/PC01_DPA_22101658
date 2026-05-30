-- 1. Creación de la Base de Datos
CREATE DATABASE TallerMecanicoDB;
GO

USE TallerMecanicoDB;
GO

-- 2. Tabla: TipoServicio
CREATE TABLE TipoServicio (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    PrecioBase DECIMAL(10, 2) NOT NULL
);

-- 3. Tabla: Cliente
CREATE TABLE Cliente (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Paterno VARCHAR(50) NOT NULL,
    Materno VARCHAR(50) NULL, -- Se permite nulo por si no tiene segundo apellido
    Nombres VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) UNIQUE NULL, -- Unique para evitar correos duplicados
    Telefono VARCHAR(20) NULL
);

-- 4. Tabla: Vehiculo
CREATE TABLE Vehiculo (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Placa VARCHAR(15) NOT NULL UNIQUE, -- Las placas son únicas por vehículo
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Anio INT NOT NULL,
    ClienteId INT NOT NULL,
    -- Relación: Un cliente tiene muchos vehículos
    CONSTRAINT FK_Vehiculo_Cliente FOREIGN KEY (ClienteId) 
        REFERENCES Cliente(Id) ON DELETE CASCADE
);

-- 5. Tabla: OrdenServicio
CREATE TABLE OrdenServicio (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FechaIngreso DATETIME DEFAULT GETDATE() NOT NULL, -- Autogenera la fecha actual si no se envía
    DescripcionProblema VARCHAR(MAX) NOT NULL,
    CostoEstimado DECIMAL(10,2) NOT NULL,
    Estado VARCHAR(30) DEFAULT 'Pendiente' NOT NULL, -- Ej: Pendiente, En Proceso, Terminado
    VehiculoId INT NOT NULL,
    TipoServicioId INT NOT NULL,
    -- Relaciones
    CONSTRAINT FK_Orden_Vehiculo FOREIGN KEY (VehiculoId) 
        REFERENCES Vehiculo(Id),
    CONSTRAINT FK_Orden_TipoServicio FOREIGN KEY (TipoServicioId) 
        REFERENCES TipoServicio(Id)
);
GO