/* Populate database with sample data. */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
    VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23);

INSERT INTO animals
    VALUES (DEFAULT, 'Gabumon', '2018-11-15', 2, TRUE, 8);

INSERT INTO animals
    VALUES (DEFAULT, 'Pikachu', '2021-01-07', 1, FALSE, 15.04);

INSERT INTO animals
    VALUES (DEFAULT, 'Devimon', '2017-05-12', 5, TRUE, 11);

INSERT INTO animals
    VALUES (DEFAULT, 'Charmander', '2020-02-08', 0, FALSE, -11);

INSERT INTO animals
    VALUES (DEFAULT, 'Plantmon', '2021-11-15', 2, TRUE, -5.7);

INSERT INTO animals
    VALUES (DEFAULT, 'Squirtle', '1993-04-02', 3, FALSE, -12.13);

INSERT INTO animals
    VALUES (DEFAULT, 'Angemon', '2005-06-12', 1, TRUE, -45);

INSERT INTO animals
    VALUES (DEFAULT, 'Boarmon', '2005-06-07', 7, TRUE, 20.4);

INSERT INTO animals
    VALUES (DEFAULT, 'Blossom', '1998-10-13', 3, TRUE, 17);

INSERT INTO animals
    VALUES (DEFAULT, 'Ditto', '2022-05-14', 4, TRUE, 22);

INSERT INTO owners
    VALUES (DEFAULT, 'Sam Smith', 34);

INSERT INTO owners
    VALUES (DEFAULT, 'Jennifer Orwell', 19);

INSERT INTO owners
    VALUES (DEFAULT, 'Bob', 45);

INSERT INTO owners
    VALUES (DEFAULT, 'Melody Pond', 77);

INSERT INTO owners
    VALUES (DEFAULT, 'Dean Winchester', 14);

INSERT INTO owners
    VALUES (DEFAULT, 'Jodie Whittaker', 38);

INSERT INTO species
    VALUES (DEFAULT, 'Pokemon');

INSERT INTO species
    VALUES (DEFAULT, 'Digimon');

BEGIN;
UPDATE
    animals
SET
    species_id = (
        SELECT
            (id)
        FROM
            species
        WHERE
            name = 'Digimon')
WHERE
    name LIKE '%mon';
SELECT
    *
FROM
    animals;
UPDATE
    animals
SET
    species_id = (
        SELECT
            (id)
        FROM
            species
        WHERE
            name = 'Pokemon')
WHERE
    species_id IS NULL;
SELECT
    *
FROM
    animals;
COMMIT;

BEGIN;
UPDATE
    animals
SET
    owner_id = (
        SELECT
            (id)
        FROM
            owners
        WHERE
            full_name = 'Sam Smith')
WHERE
    name = 'Agumon';
UPDATE
    animals
SET
    owner_id = (
        SELECT
            (id)
        FROM
            owners
        WHERE
            full_name = 'Jennifer Orwell')
WHERE
    name IN ('Gabumon', 'Pikachu');
UPDATE
    animals
SET
    owner_id = (
        SELECT
            (id)
        FROM
            owners
        WHERE
            full_name = 'Bob')
WHERE
    name IN ('Devimon', 'Plantmon');
UPDATE
    animals
SET
    owner_id = (
        SELECT
            (id)
        FROM
            owners
        WHERE
            full_name = 'Melody Pond')
WHERE
    name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE
    animals
SET
    owner_id = (
        SELECT
            (id)
        FROM
            owners
        WHERE
            full_name = 'Dean Winchester')
WHERE
    name IN ('Angemon', 'Boarmon');
SELECT
    *
FROM
    animals;
COMMIT;

-- Milestone 4
INSERT INTO vets
    VALUES (DEFAULT, 'William Tatcher', 45, '2000-04-23');

INSERT INTO vets
    VALUES (DEFAULT, 'Maisy Smith', 26, '2019-01-17');

INSERT INTO vets
    VALUES (DEFAULT, 'Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets
    VALUES (DEFAULT, 'Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations
    VALUES (1, 1);

INSERT INTO specializations
    VALUES (3, 1);

INSERT INTO specializations
    VALUES (3, 2);

INSERT INTO specializations
    VALUES (4, 2);

INSERT INTO visits
    VALUES (DEFAULT, 1, 1, '2020-05-24');

INSERT INTO visits
    VALUES (DEFAULT, 1, 3, '2020-07-22');

INSERT INTO visits
    VALUES (DEFAULT, 2, 4, '2021-02-02');

INSERT INTO visits
    VALUES (DEFAULT, 3, 2, '2020-01-05');

INSERT INTO visits
    VALUES (DEFAULT, 3, 2, '2020-03-08');

INSERT INTO visits
    VALUES (DEFAULT, 3, 2, '2020-05-14');

INSERT INTO visits
    VALUES (DEFAULT, 4, 3, '2021-05-04');

INSERT INTO visits
    VALUES (DEFAULT, 5, 4, '2021-02-24');

INSERT INTO visits
    VALUES (DEFAULT, 6, 2, '2019-12-21');

INSERT INTO visits
    VALUES (DEFAULT, 6, 1, '2020-08-10');

INSERT INTO visits
    VALUES (DEFAULT, 6, 2, '2021-04-07');

INSERT INTO visits
    VALUES (DEFAULT, 7, 3, '2019-09-29');

INSERT INTO visits
    VALUES (DEFAULT, 8, 4, '2020-10-03');

INSERT INTO visits
    VALUES (DEFAULT, 8, 4, '2020-11-04');

INSERT INTO visits
    VALUES (DEFAULT, 9, 2, '2019-01-24');

INSERT INTO visits
    VALUES (DEFAULT, 9, 2, '2019-05-15');

INSERT INTO visits
    VALUES (DEFAULT, 9, 2, '2020-02-27');

INSERT INTO visits
    VALUES (DEFAULT, 9, 2, '2020-08-03');

INSERT INTO visits
    VALUES (DEFAULT, 10, 3, '2020-05-24');

INSERT INTO visits
    VALUES (DEFAULT, 10, 1, '2021-01-11');

