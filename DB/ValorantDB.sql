DROP DATABASE IF EXISTS bd;

CREATE DATABASE IF NOT EXISTS bd;

USE bd;

-- Done 
CREATE TABLE Characters (
    character_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50),
    description TEXT,
    url_image VARCHAR(255),
    portrait_image VARCHAR(255)
);

-- Done 
CREATE TABLE Abilities_Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

-- Done
CREATE TABLE Category_Store (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

-- Done
CREATE TABLE Abilities (
    ability_id INT AUTO_INCREMENT PRIMARY KEY,
    character_id INT,
    name VARCHAR(100),
    description TEXT,
    category INT,
    category_store_id INT,
    url_image VARCHAR(255),
    FOREIGN KEY (character_id) REFERENCES Characters(character_id),
    FOREIGN KEY (category) REFERENCES Abilities_Category(category_id),
    FOREIGN KEY (category_store_id) REFERENCES Category_Store(category_id)
);

-- Done
CREATE TABLE Abilities_Store (
    ability_id INT,
    category_store_id INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (ability_id, category_store_id),
    FOREIGN KEY (ability_id) REFERENCES Abilities(ability_id),
    FOREIGN KEY (category_store_id) REFERENCES Category_Store(category_id)
);

-- Done
CREATE TABLE Shields (
    shield_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    name VARCHAR(100),
    description TEXT,
    resistance INT,
    price DECIMAL(10, 2),
    url_image VARCHAR(255),
    FOREIGN KEY (category_id) REFERENCES Category_Store(category_id)
);

-- Done
CREATE TABLE Weapons_Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

-- Done
CREATE TABLE Weapons (
    weapon_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    weapon_category_id INT,
    name VARCHAR(100),
    description TEXT,
    url_image VARCHAR(255),
    fire_rate FLOAT,
    fire_mode VARCHAR(50),
    magazine INT,
    reload_time INT,
    equip_time INT,
    run_speed INT,
    reserve_ammo INT,
    wall_penetration VARCHAR(50),
    close_legs_damage INT,
    medium_legs_damage INT,
    far_legs_damage INT,
    close_body_damage INT,
    medium_body_damage INT,
    far_body_damage INT,
    close_head_damage INT,
    medium_head_damage INT,
    far_head_damage INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (category_id) REFERENCES Category_Store(category_id),
    FOREIGN KEY (weapon_category_id) REFERENCES Weapons_Category(category_id)
);

CREATE TABLE Items_Store (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    weapon_id INT,
    shield_id INT,
    ability_id INT,
    category_store_id INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (weapon_id) REFERENCES Weapons(weapon_id),
    FOREIGN KEY (shield_id) REFERENCES Shields(shield_id),
    FOREIGN KEY (ability_id) REFERENCES Abilities(ability_id),
    FOREIGN KEY (category_store_id) REFERENCES Category_Store(category_id)
);

-- SOURCE insert.sql;
