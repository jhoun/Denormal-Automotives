-- DROP USER IF EXISTS denormal_user;

-- CREATE USER denormal_user;

-- DROP DATABASE IF EXISTS denormal_cars;

-- CREATE DATABASE denormal_cars OWNER denormal_user;

-- \c denormal_cars denormal_user;

SELECT COUNT(DISTINCT make_title)
  FROM car_models;

SELECT COUNT(DISTINCT model_title)
  FROM car_models
  WHERE make_code = 'VOLKS';

SELECT COUNT(*)
  FROM car_models
  WHERE make_code = 'LAM';

SELECT COUNT(*)
  FROM car_models
  WHERE year >= 2010
  AND year <= 2015;