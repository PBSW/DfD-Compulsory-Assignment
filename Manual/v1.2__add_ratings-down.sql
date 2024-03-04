

USE DFD_Compulsory_Assignment;

BEGIN TRANSACTION;

DECLARE @MigrationVersion DECIMAL(5,1);
DECLARE @CurrentVersion DECIMAL(5,1);
SET @MigrationVersion = 1.1;


-- Execute the GetCurrentMigration procedure to get the current migration
EXEC GetCurrentMigration;
-- Store the current version in the variable @CurrentVersion
SET @CurrentVersion = (SELECT TOP 1 Version FROM Migrations ORDER BY AppliedDateTime DESC);

IF @CurrentVersion <> 1.2
BEGIN
    -- Cancel the transaction
    ROLLBACK TRANSACTION;
    RAISERROR('The current version is not 1.2. Transaction cancelled.', 16, 1);
END
ELSE
BEGIN


-- Delete the ratings table
DROP TABLE ProductRating;

-- Add Migration entry
EXEC AddMigration @MigrationName = 'Remove ratings', @Version = 1.1;
END

COMMIT TRANSACTION;