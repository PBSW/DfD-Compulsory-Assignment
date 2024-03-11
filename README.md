# DfD-Compulsory-Assignment
Compulsary Assignment in Database Migration, Database for Developers, Software Developer Bachelor at EASV, Feburary 2024.

# Steps (How-To)

## Manuel

the migrations is located in the Manuel folder as SQL scripts

1. update to newer versions
    
    1. find the current version the database 
    2. run the <b>next</b> script that end with <b>up</b>
    3. repeat until you are at the version you desire

3. rollback to a previous version

    1. find the current version the database 
    2. run the <b>previous</b> script that end with <b>down</b>
    3. repeat until you are at the version you desire

## EF Core

1. update the database to the latest migration

```console
dotnet ef database update -p Products/API/API.csproj
```

2. checkout the initial migration (rollback)
```console
dotnet ef database update ?????????????????????????????? -p Products/API/API.csproj
```
