DROP TABLE IF EXISTS property_tracker;

CREATE TABLE property_tracker (
  id SERIAL PRIMARY KEY,
  address VARCHAR,
  build_type VARCHAR,
  year_built INT,
  bedrooms INT,
  square_footage INT,
  buy_let_status VARCHAR,
  value INT
);
