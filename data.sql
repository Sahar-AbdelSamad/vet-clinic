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

