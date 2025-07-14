CREATE DATABASE AgroLand;
USE AgroLand;


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);


CREATE TABLE parcels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    area DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);


CREATE TABLE costs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    parcel_id INT NOT NULL,
    cost_type VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (parcel_id) REFERENCES parcels(id) ON DELETE CASCADE
);


CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    parcel_id INT NOT NULL,
    quantity DECIMAL(10,2) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (parcel_id) REFERENCES parcels(id) ON DELETE CASCADE
);


CREATE TABLE crops (
    id INT AUTO_INCREMENT PRIMARY KEY,
    parcel_id INT NOT NULL,
    crop_name VARCHAR(100) NOT NULL,
    sow_date DATE NOT NULL,
    FOREIGN KEY (parcel_id) REFERENCES parcels(id) ON DELETE CASCADE
);