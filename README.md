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

1. Create Migration:

```console
dotnet ef migration add <Migration Name> -p Infrastructure -s API
```

2. Update Database to latest migration:
```console
dotnet ef database update -p Infrastructure -s API
```

3. Check applied migrations:
```console
dotnet ef migration list -p API
```

Rollback:
1. Rollback Dataebase state to non-faulty migration:
```console
dotnet ef database update <previous migration> -p Infrastructure -s API
```

2. Remove Migration:
```console
dotnet ef migration remove <Migration Name> -p Infrastructure -s API
```

