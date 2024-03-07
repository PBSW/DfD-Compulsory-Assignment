BEGIN TRANSACTION;

USE DFD_Compulsory_Assignment
GO

DECLARE @CurrentVersion DECIMAL(5,1);

-- Store the current version in the variable @CurrentVersion
SET @CurrentVersion = (SELECT TOP 1 Version FROM Migrations ORDER BY AppliedDateTime DESC);

IF @CurrentVersion <> 1.0
BEGIN
    -- Cancel the transaction
    ROLLBACK TRANSACTION;
    RAISERROR('The current version is not 1.0. Transaction cancelled.', 16, 1);
END
ELSE
BEGIN

CREATE TABLE Categories (
	CategoryId INT IDENTITY(1,1) PRIMARY KEY,
	CategoryName NVARCHAR(100) NOT NULL,
)
END
BEGIN

--Seed categories
INSERT INTO Categories (CategoryName) VALUES ('Smart Devices');
INSERT INTO Categories (CategoryName) VALUES ('Audio');
INSERT INTO Categories (CategoryName) VALUES ('Computers');

END
BEGIN

ALTER TABLE Products
ADD CategoryId INT,
FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId);

END;
BEGIN

EXEC AddMigration @MigrationName = 'Add Categories', @Version = 1.1;

END

COMMIT TRANSACTION;