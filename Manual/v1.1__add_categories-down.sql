BEGIN TRANSACTION;

USE DFD_Compulsory_Assignemnt;

DECLARE @MigrationVersion DECIMAL(5,1);
DECLARE @CurrentVersion DECIMAL(5,1);
SET @MigrationVersion = 1.0;


-- Execute the GetCurrentMigration procedure to get the current migration
EXEC GetCurrentMigration;
-- Store the current version in the variable @CurrentVersion
SET @CurrentVersion = (SELECT TOP 1 Version FROM Migrations ORDER BY AppliedDateTime DESC);

IF @CurrentVersion <> 1.1
BEGIN
    -- Cancel the transaction
    ROLLBACK TRANSACTION;
    RAISERROR('The current version is not 1.1. Transaction cancelled.', 16, 1);
END
ELSE
BEGIN


-- Drop the foreign key constraint and remove the CategoryId column from the Products table
ALTER TABLE dbo.Products
DROP CONSTRAINT FK_Products_Categories

ALTER TABLE dbo.Products
DROP COLUMN CategoryId;

-- Delete the Categories table
DROP TABLE Categories;

-- Remove the migration entry for version 1.1
DELETE FROM Migrations WHERE MigrationName = 'Add Categories' AND Version = 1.1;
END

COMMIT TRANSACTION;