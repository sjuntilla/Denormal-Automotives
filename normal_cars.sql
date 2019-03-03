DROP DATABASE IF EXISTS normal_cars;

DROP USER IF EXISTS normal_user;

CREATE USER normal_user;

CREATE DATABASE normal_cars OWNER normal_user;

\c normal_cars;
\i 'scripts/denormal_data.sql';
CREATE TABLE makes (
    id SERIAL PRIMARY KEY,
    make_code VARCHAR(25) NOT NULL,
    make_title VARCHAR(25) NOT NULL
);

INSERT INTO makes (make_code, make_title)
SELECT DISTINCT
    make_code,
    make_title
FROM
    car_models;

CREATE TABLE models (
    id SERIAL PRIMARY KEY,
    model_code VARCHAR(50) NOT NULL,
    model_title VARCHAR(50) NOT NULL,
    make_id INTEGER REFERENCES makes (id),
    year INTEGER NOT NULL
);

INSERT INTO models (model_code, model_title, year, make_id)
SELECT DISTINCT
    model_code,
    model_title,
    year,
    id AS make_id
FROM
    car_models
    INNER JOIN makes ON car_models.make_title = makes.make_title;

SELECT DISTINCT
    make_title
FROM
    car_models;

SELECT DISTINCT
    model_title
FROM
    car_models
WHERE
    make_code = 'VOLKS';

SELECT DISTINCT
    make_code,
    model_code,
    model_title,
    year
FROM
    car_models
WHERE
    make_code = 'LAM';

SELECT DISTINCT
    COUNT(*)
FROM
    car_models
WHERE
    year BETWEEN 2010 AND 2015;

