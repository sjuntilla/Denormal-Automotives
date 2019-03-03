DROP USER IF EXISTS denormal_user;

CREATE USER denormal_user;

DROP DATABASE IF EXISTS denormal_cars;

CREATE DATABASE denormal_cars OWNER denormal_user;

\c denormal_cars;
\i 'scripts/denormal_data.sql';
\dS car_models;
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
    COUNT(model_title)
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

