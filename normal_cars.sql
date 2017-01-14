\c jay;

DROP DATABASE IF EXISTS normal_cars;

DROP USER IF EXISTS normal_user;

CREATE USER normal_user;

CREATE DATABASE normal_cars OWNER normal_user;

\c normal_cars;
\i scripts/denormal_data.sql

CREATE TABLE make_table (
  id SERIAL PRIMARY KEY,
  make_code varchar,
  make_title varchar
);


CREATE TABLE model_table (
  id SERIAL PRIMARY KEY,
  model_code varchar,
  model_title varchar,
  year integer,
  make_id integer REFERENCES make_table (id)
);


INSERT INTO make_table (make_code, make_title)
  SELECT DISTINCT make_code, make_title
  FROM car_models;

-- SELECT id, model_title
--   FROM car_models
--   INNER JOIN make_table
--   ON







INSERT INTO model_table (model_code, model_title, year, make_id)
  SELECT DISTINCT model_title, model_code, year, id AS make_id
  FROM car_models
  INNER JOIN make_table ON car_models.make_title = make_table.make_title;
