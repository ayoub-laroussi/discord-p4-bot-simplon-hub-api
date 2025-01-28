-- Création des tables
CREATE TABLE IF NOT EXISTS classes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    vigor INT,
    mind INT,
    endurance INT,
    strength INT,
    dexterity INT,
    intelligence INT,
    faith INT,
    arcane INT
);

CREATE TABLE IF NOT EXISTS weapons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    damage_type VARCHAR(50),
    weight DECIMAL(5,2),
    required_strength INT,
    required_dexterity INT,
    required_intelligence INT,
    required_faith INT
);

CREATE TABLE IF NOT EXISTS bosses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    type VARCHAR(50),
    difficulty INT CHECK (difficulty BETWEEN 1 AND 10),
    is_mandatory BOOLEAN DEFAULT false
);

-- Insertion des données de base
INSERT INTO classes (name, description, vigor, mind, endurance, strength, dexterity, intelligence, faith, arcane) VALUES
('Vagabond', 'A knight exiled from their homeland.', 15, 10, 11, 14, 13, 9, 9, 7),
('Warrior', 'A nomadic warrior who fights wielding two blades at once.', 11, 12, 11, 10, 16, 10, 8, 9),
('Hero', 'A stalwart hero, at home with a battleaxe.', 14, 9, 12, 16, 9, 7, 8, 11),
('Bandit', 'A dangerous bandit who strikes for weak points.', 10, 11, 10, 9, 13, 9, 8, 14),
('Astrologer', 'A scholar who reads fate in the stars.', 9, 15, 9, 8, 12, 16, 7, 9);

INSERT INTO weapons (name, type, damage_type, weight, required_strength, required_dexterity, required_intelligence, required_faith) VALUES
('Uchigatana', 'Katana', 'Slash', 5.5, 11, 15, 0, 0),
('Moonveil', 'Katana', 'Slash/Magic', 6.5, 12, 18, 23, 0),
('Rivers of Blood', 'Katana', 'Slash/Fire', 6.5, 12, 18, 0, 0),
('Sword of Night and Flame', 'Straight Sword', 'Standard/Magic/Fire', 4.0, 12, 12, 24, 24),
('Blasphemous Blade', 'Greatsword', 'Standard/Fire', 13.5, 22, 15, 0, 21);

INSERT INTO bosses (name, location, type, difficulty, is_mandatory) VALUES
('Margit, the Fell Omen', 'Stormveil Castle', 'Demigod', 7, true),
('Godrick the Grafted', 'Stormveil Castle', 'Demigod', 6, true),
('Malenia, Blade of Miquella', 'Miquella''s Haligtree', 'Demigod', 10, false),
('Starscourge Radahn', 'Caelid', 'Demigod', 8, true),
('Mohg, Lord of Blood', 'Mohgwyn Palace', 'Demigod', 9, false); 