--Initial Schema, V1.0__

USE MASTER
GO


--Kill connections
DECLARE @DatabaseName nvarchar(50)
SET @DatabaseName = N'DFD_Compulsory_Assignment'
--SET @DatabaseName = DB_NAME()

DECLARE @SQL varchar(max)
SET @SQL = ''

SELECT @SQL = @SQL + 'Kill ' + Convert(varchar, SPId) + ';'
FROM MASTER..SysProcesses
WHERE DBId = DB_ID(@DatabaseName) AND SPId <> @@SPId

-- SELECT @SQL
EXEC(@SQL)


--Drop DB
DROP DATABASE DFD_Compulsory_Assignment
GO
