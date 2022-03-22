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