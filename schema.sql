/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg DECIMAL,
    PRIMARY KEY (id)
);

ALTER TABLE animals
    ADD species varchar(100);

CREATE TABLE owners (
    id int GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100),
    age int,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    PRIMARY KEY (id)
);

ALTER TABLE animals
    DROP species;

ALTER TABLE animals
    ADD species_id INT REFERENCES species (id);

ALTER TABLE animals
    ADD owner_id INT REFERENCES owners (id);

-- Milestone 4
CREATE TABLE vets (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    age int,
    date_of_graduation date,
    PRIMARY KEY (id)
);

CREATE TABLE specializations (
    vets_id int,
    species_id int,
    FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (species_id, vets_id)
);

CREATE TABLE visits (
    id int GENERATED ALWAYS AS IDENTITY,
    animals_id int,
    vets_id int,
    date_of_visit date,
    FOREIGN KEY (animals_id) REFERENCES animals (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (id, animals_id, vets_id)
);

