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

--milestone 4
SELECT
    animals.name AS animal,
    visits.date_of_visit
FROM
    visits
    JOIN animals ON animals.id = visits.animals_id
    JOIN vets ON vets.id = visits.vets_id
WHERE
    vets.name = 'William Tatcher'
ORDER BY
    date_of_visit DESC
LIMIT 1;

SELECT
    count(new.*) AS "Different animals seen by Stephanie Mendez"
FROM (
    SELECT
        animals.name
    FROM
        visits
        JOIN vets ON visits.vets_id = vets.id
        JOIN animals ON animals.id = visits.animals_id
    WHERE
        vets.name = 'Stephanie Mendez'
    GROUP BY
        animals.name) AS new;

SELECT
    vets.name AS vet,
    species.name AS specialties
FROM
    specializations AS s
    RIGHT JOIN vets ON vets.id = s.vets_id
    LEFT JOIN species ON species.id = s.species_id;

SELECT
    vets.name AS vet,
    animals.name AS animals,
    visits.date_of_visit
FROM
    visits
    JOIN vets ON vets.id = visits.vets_id
    JOIN animals ON animals.id = visits.animals_id
WHERE
    visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30'
    AND vets.name = 'Stephanie Mendez';

SELECT
    animals.name AS Animal,
    count(visits.date_of_visit) AS "Number of visits"
FROM
    visits
    JOIN animals ON animals.id = visits.animals_id
GROUP BY
    animals.name
ORDER BY
    count(visits.date_of_visit) DESC
LIMIT 1;

SELECT
    vets.name AS vets,
    animals.name AS animal,
    visits.date_of_visit
FROM
    visits
    JOIN animals ON animals.id = visits.animals_id
    JOIN vets ON vets.id = visits.vets_id
WHERE
    vets.name = 'Maisy Smith'
ORDER BY
    visits.date_of_visit
LIMIT 1;

SELECT
    animals.name AS animal,
    animals.date_of_birth,
    animals.neutered,
    animals.escape_attempts,
    animals.weight_kg,
    vets.name AS vet,
    vets.age,
    vets.date_of_graduation,
    visits.date_of_visit
FROM
    animals
    JOIN visits ON animals.id = visits.animals_id
    JOIN vets ON vets.id = visits.vets_id
ORDER BY
    visits.date_of_visit DESC
LIMIT 1;

SELECT
    count(new.*) AS "Visits to vet not specialized in that animal's species"
FROM (
    SELECT
        vets.name AS vet,
        s.species_id AS specialization,
        animals.species_id
    FROM
        specializations AS s
        JOIN vets ON vets.id = s.vets_id
        JOIN visits ON visits.vets_id = vets.id
        JOIN animals ON animals.id = visits.animals_id
    WHERE
        vets.name <> 'Stephanie Mendez') AS new
WHERE
    new.specialization <> new.species_id;

SELECT
    count(species.*),
    species.name AS specie
FROM
    visits
    JOIN vets ON visits.vets_id = vets.id
    JOIN animals ON animals.id = visits.animals_id
    JOIN species ON species.id = animals.species_id
WHERE
    vets.name = 'Maisy Smith'
GROUP BY
    species.name
ORDER BY
    count DESC
LIMIT 1;

