DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  number_of_songs INT,
  artist_id INT REFERENCES artists(id)
);
