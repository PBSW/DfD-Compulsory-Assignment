
USE DFD_Compulsory_Assignment;

BEGIN TRANSACTION;

DECLARE @CurrentVersion DECIMAL(5,1);

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

-- Delete the ratings table
DROP TABLE ProductRating;

Add Migration entry
EXEC AddMigration @MigrationName = 'Remove ratings', @Version = 1.0;
END

COMMIT TRANSACTION;