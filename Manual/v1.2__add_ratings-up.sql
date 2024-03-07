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

-- Create the product table
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

EXEC AddMigration @MigrationName = 'Add Ratings', @Version = 1.1;

END

COMMIT TRANSACTION;