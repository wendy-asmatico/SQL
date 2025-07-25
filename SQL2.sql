-- Active: 1753278632562@@127.0.0.1@3306@planning

-- SQL 7 Exercice 1
CREATE DATABASE planning;

USE planning; 

CREATE TABLE departement (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE employe (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prenom VARCHAR (255) NOT NULL,
    nom VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL,
    departement_id INT NOT NULL,
    FOREIGN KEY (departement_id) REFERENCES departement(id)
)

CREATE TABLE projet (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255),
    budget INT
)

CREATE TABLE assignation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    projet_id INT,
    employe_id INT,
    FOREIGN KEY (projet_id) REFERENCES projet(id),
    FOREIGN KEY (employe_id) REFERENCES employe(id)
)

-- Exercice 2

CREATE DATABASE concessionnaire;

USE concessionnaire;

CREATE TABLE vehicule(
    id INT PRIMARY KEY AUTO_INCREMENT,
    modele VARCHAR(255),
    marque VARCHAR(255),
    carburant VARCHAR(255),
    puissance INT,
    prix INT,
)

CREATE TABLE client(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255),
)

CREATE TABLE stock(
    numeros_serie VARCHAR(255) UNIQUE,
    vehicule_id INT,
    date_arriver DATE,
    etat VARCHAR(255),
    FOREIGN KEY (vehicule_id) REFERENCES vehicule(id)
);

CREATE TABLE commande (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE DEFAULT CURRENT_TIMESTAMP,
    montant INT,
    vehicule_id INT,
    client_id INT,
    FOREIGN KEY (vehicule_id) REFERENCES vehicule(id),
    FOREIGN KEY (client_id) REFERENCES client(id)
)

