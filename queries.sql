/*Queries that provide answers to the questions from all projects.*/

Select *
from animals
where name like '%mon';

Select *
from animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';

Select *
from animals
WHERE escape_attempts < 3
    AND neutered = true;

Select *
from animals
WHERE name in ('Agumon', 'Pikachu');

Select name,
    escape_attempts
from animals
WHERE weight_kg > 10.5;

Select *
from animals
WHERE neutered = true;

Select *
from animals
WHERE name != 'Gabumon';

Select *
from animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * from animals;
ROLLBACK;
SELECT * from animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;
SELECT *
FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT *
FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SV1;
UPDATE animals SET weight_kg = animals.weight_kg*-1;
ROLLBACK TO SV1;
UPDATE animals SET weight_kg = animals.weight_kg*-1 WHERE weight_kg < 0;
COMMIT;
SELECT *
FROM animals;

SELECT COUNT(*)
FROM animals;

SELECT COUNT(*)
FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg)
FROM animals;

SELECT neutered,
    SUM(escape_attempts) as escape_times
FROM animals
GROUP BY neutered;

SELECT species,
    MIN(weight_kg),
    MAX(weight_kg)
FROM animals
GROUP BY species;

SELECT species,
    AVG(escape_attempts)
FROM animals
WHERE EXTRACT (year FROM date_of_birth) BETWEEN 1990 AND 2000
GROUP BY species;