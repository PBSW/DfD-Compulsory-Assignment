--Initial Schema, V1.0__

USE [master]
GO


CREATE DATABASE DFD_Compulsory_Assignment
GO

USE DFD_Compulsory_Assignment
GO

--Table
CREATE TABLE Products (
	ProductId INT IDENTITY(1,1) PRIMARY KEY,
	ProductName NVARCHAR(90) NOT NULL,
	Price MONEY NOT NULL,
	Description NVARCHAR(90),
);
GO

--Seed data
INSERT INTO Products (ProductName, Price, Description)
VALUES
    ('Laptop', 999.99, 'Thin and powerful laptop with high-resolution display'),
    ('Smartphone', 699.99, 'Latest smartphone with advanced camera features'),
    ('Headphones', 149.99, 'Wireless headphones with noise-cancellation technology'),
    ('Tablet', 499.99, 'Portable tablet with long battery life and touchscreen display'),
    ('Smartwatch', 299.99, 'Smartwatch with fitness tracking and heart rate monitoring features');
GO

CREATE TABLE Migrations (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    MigrationName NVARCHAR(255) NOT NULL,
    AppliedDateTime DATETIME NOT NULL DEFAULT GETDATE(),
    Version DECIMAL(5,1) -- Allows for one decimal place
);
GO

CREATE PROCEDURE AddMigration
    @MigrationName NVARCHAR(255),
    @Version DECIMAL(5,1)
AS
BEGIN
    INSERT INTO Migrations (MigrationName, Version)
    VALUES (@MigrationName, @Version);
END;
GO

CREATE PROCEDURE GetCurrentMigration
AS
BEGIN
    SELECT TOP 1 MigrationName, Version
    FROM Migrations
    ORDER BY AppliedDateTime DESC;
END;
GO

EXEC AddMigration @MigrationName = 'InitialSchema', @Version = 1.0;
GO
