--Initial Schema, V1.0__

USE MASTER
GO

CREATE DATABASE DFD_Compulsory_Assignemnt
GO

USE DFD_Compulsory_Assignemnt
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