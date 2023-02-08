CREATE TABLE animals (
 id BIGSERIAL NOT NULL PRIMARY KEY,
 name VARCHAR(255) NOT NULL,
 date_of_birth DATE NOT NULL,
 escape_attempts INT NOT NULL,
 neutered BOOLEAN NOT NULL,
 weight_kg DECIMAL(5,2) NOT NULL,
 species_id INTEGER NOT NULL,
 owner_id INTEGER NOT NULL

);


ALTER TABLE animals ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE owners (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
CREATE TABLE species (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255)
);
CREATE TABLE vets (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255),
  age INT,
  date_of_graduation DATE
);
CREATE TABLE specializations (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  species_id INTEGER,
  vet_id INTEGER,
  FOREIGN KEY (species_id) REFERENCES species(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id)
);
CREATE TABLE visits (
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date DATE,
  PRIMARY KEY (animal_id, vet_id)
);
