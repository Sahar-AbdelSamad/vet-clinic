/*Queries that provide answers to the questions from all projects.*/
SELECT
    *
FROM
    animals
WHERE
    name LIKE '%mon';

SELECT
    *
FROM
    animals
WHERE
    date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';

SELECT
    *
FROM
    animals
WHERE
    escape_attempts < 3
    AND neutered = TRUE;

SELECT
    *
FROM
    animals
WHERE
    name IN ('Agumon', 'Pikachu');

SELECT
    name,
    escape_attempts
FROM
    animals
WHERE
    weight_kg > 10.5;

SELECT
    *
FROM
    animals
WHERE
    neutered = TRUE;

SELECT
    *
FROM
    animals
WHERE
    name != 'Gabumon';

SELECT
    *
FROM
    animals
WHERE
    weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE
    animals
SET
    species = 'unspecified';
SELECT
    *
FROM
    animals;
ROLLBACK;

SELECT
    *
FROM
    animals;

BEGIN;
UPDATE
    animals
SET
    species = 'digimon'
WHERE
    name LIKE '%mon';
UPDATE
    animals
SET
    species = 'pokemon'
WHERE
    species IS NULL;
COMMIT;

SELECT
    *
FROM
    animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;

SELECT
    *
FROM
    animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SV1;
UPDATE
    animals
SET
    weight_kg = animals.weight_kg * -1;
ROLLBACK TO SV1;

UPDATE
    animals
SET
    weight_kg = animals.weight_kg * -1
WHERE
    weight_kg < 0;

COMMIT;

SELECT
    *
FROM
    animals;

SELECT
    COUNT(*)
FROM
    animals;

SELECT
    COUNT(*)
FROM
    animals
WHERE
    escape_attempts = 0;

SELECT
    AVG(weight_kg)
FROM
    animals;

SELECT
    neutered,
    SUM(escape_attempts) AS escape_times
FROM
    animals
GROUP BY
    neutered;

SELECT
    species,
    MIN(weight_kg),
    MAX(weight_kg)
FROM
    animals
GROUP BY
    species;

SELECT
    species,
    AVG(escape_attempts)
FROM
    animals
WHERE
    EXTRACT(year FROM date_of_birth) BETWEEN 1990 AND 2000
GROUP BY
    species;

-- Milestone 3

SELECT
    owners.full_name AS owner,
    animals.name
FROM
    animals
    JOIN owners ON animals.owner_id = owners.id
WHERE
    owners.full_name = 'Melody Pond';

SELECT
    animals.name,
    species.name AS type
FROM
    animals
    JOIN species ON animals.species_id = species.id
WHERE
    species.name = 'Pokemon';

SELECT
    owners.full_name AS owners,
    animals.name AS animal_name
FROM
    owners
    LEFT JOIN animals ON animals.owner_id = owners.id;

SELECT
    species.name AS type,
    count(animals.*)
FROM
    animals
    JOIN species ON animals.species_id = species.id
GROUP BY
    species.name;

SELECT
    owners.full_name AS owner,
    animals.name,
    species.name AS type
FROM
    animals
    JOIN species ON animals.species_id = species.id
    JOIN owners ON animals.owner_id = owners.id
WHERE
    species.name = 'Digimon'
    AND owners.full_name = 'Jennifer Orwell';

SELECT
    owners.full_name AS owner,
    animals.name,
    animals.escape_attempts
FROM
    animals
    JOIN owners ON animals.owner_id = owners.id
WHERE
    owners.full_name = 'Dean Winchester'
    AND animals.escape_attempts = 0;

SELECT
    owners.full_name AS owns_most_animals,
    count(animals.*)
FROM
    animals
    JOIN owners ON animals.owner_id = owners.id
GROUP BY
    owners.full_name
ORDER BY
    count(animals.*) DESC
LIMIT 1;

