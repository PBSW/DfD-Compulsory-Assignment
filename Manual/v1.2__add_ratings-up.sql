BEGIN TRANSACTION;

USE DFD_Compulsory_Assignment
GO

DECLARE @MigrationVersion DECIMAL(5,1);
DECLARE @CurrentVersion DECIMAL(5,1);
SET @MigrationVersion = 1.2;


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



CREATE TABLE ProductRating (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Review NVARCHAR(MAX),
    Score INT CHECK (Score >= 0 AND Score <= 10),
    ProductId INT,
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);
END
BEGIN

--Seed ratings
INSERT INTO ProductRating (Review, Score, ProductId)
VALUES
('Excellent laptop!', 9, (SELECT ProductId FROM Products WHERE ProductName = 'Laptop')),
('Great smartphone!', 8, (SELECT ProductId FROM Products WHERE ProductName = 'Smartphone')),
('Good headphones!', 7, (SELECT ProductId FROM Products WHERE ProductName = 'Headphones')),
('Nice tablet!', 8, (SELECT ProductId FROM Products WHERE ProductName = 'Tablet')),
('Awesome smartwatch!', 9, (SELECT ProductId FROM Products WHERE ProductName = 'Smartwatch'));


END
BEGIN

EXEC AddMigration @MigrationName = 'Add Ratings', @Version = 1.2;

END

COMMIT TRANSACTION;