-- Active: 1753278632562@@127.0.0.1@3306@transport_aerien
-- SQL 2 Exercice 1
CREATE DATABASE my_first_bdd;

-- SQL 3 Exercice 1

CREATE TABLE my_first_table (
    id PRIMARY KEY AUTO_INCREMENT, 
    libelle VARCHAR(100),
    date_ajout TIMESTAMP CURRENT_TIMESTAMP,
);

-- Exercice 2

CREATE DATABASE librairie;
USE librairie;


CREATE TABLE auteurs (
    id PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(250) NOT NULL,
    email VARCHAR(250) UNIQUE,
);

CREATE TABLE categories (
    id PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
); 

CREATE TABLE livres (
    id PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(250) NOT NULL,
    date_publication DATE,
    auteur_id INT,
    categories_id INT,
    FOREIGN KEY (auteur_id) REFERENCES auteurs(id),
    FOREIGN KEY (categories_id) REFERENCES categories(id),
);

-- SQL 4 Exercice 1

INSERT INTO auteurs(nom, email)
VALUES ('George Sand','gsand@example.com'),
('Victor Hugo', 'vhugo@example.com'),
('Alexandre Dumas','adumas@example.com'),
('Gustave Flaubert','gflaubert@example.com'),
('Marcel Pagnol','mpagnol@example.com');

SELECT nom FROM auteurs;

INSERT INTO categories(nom)
VALUES ('Roman historique'),
('Poésie'),
('Théâtre'),
('Roman realiste'),
('Littérature jeunesse');

INSERT INTO livres (titre, date_publication, auteurs_id, categories_id)
VALUES 
('La Mare au Diable', '1846-02-10', (SELECT id FROM auteurs WHERE name = 'George Sand'), (SELECT id FROM categories WHERE nom = 'Roman realiste')),
('Indiana', '1832-01-01', (SELECT id FROM auteurs WHERE name = 'George Sand'), (SELECT id FROM categories WHERE nom = 'Roman realiste')),
('Les Misérables', '1862-01-01', (SELECT id FROM auteurs WHERE name = 'Victor Hugo'), (SELECT id FROM categories WHERE nom = 'Roman historique')),
('Les Contemplations', '1856-01-01', (SELECT id FROM auteurs WHERE name = 'Victor Hugo'), (SELECT id FROM categories WHERE nom = 'Poésie')),
('Le Comte de Monte-Cristo', '1845-01-01', (SELECT id FROM auteurs WHERE name = 'Alexandre Dumas'), (SELECT id FROM categories WHERE nom = 'Roman historique')),
('Les Trois Mousquetaires', '1844-01-01', (SELECT id FROM auteurs WHERE name = 'Alexandre Dumas'), (SELECT id FROM categories WHERE nom = 'Roman historique')),
('Madame Bovary', '1857-01-01', (SELECT id FROM auteurs WHERE name = 'Gustave Flaubert'), (SELECT id FROM categories WHERE nom = 'Roman realiste')),
('Salammbô', '1862-01-01', (SELECT id FROM auteurs WHERE name = 'Gustave Flaubert'), (SELECT id FROM categories WHERE nom = 'Roman historique')),
('La Gloire de mon père', '1957-01-01', (SELECT id FROM auteurs WHERE name = 'Marcel Pagnol'), (SELECT id FROM categories WHERE nom = 'Littérature jeunesse')),
('Marius', '1929-01-01', (SELECT id FROM auteurs WHERE name = 'Marcel Pagnol'), (SELECT id FROM categories WHERE nom = 'Théâtre'));


SELECT nom FROM categories;

SELECT titre, date_publication FROM livres;

-- SQL 5 Exercice 1

SELECT titre FROM livres
WHERE date_publication < 1900-01-01;

SELECT titre FROM livres
ORDER BY date_publication asc;

SELECT date_publication, COUNT(*) as nb_livre
FROM livres
GROUP BY date_publication;

-- Exercice 2

CREATE DATABASE transport_aerien;

CREATE TABLE avions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modele VARCHAR(100) NOT NULL,
    constructeur VARCHAR(100) NOT NULL,
    capacite INT NOT NULL,
    autonomie_km INT NOT NULL,
    en_service BOOLEAN NOT NULL
);

INSERT INTO avions (modele, constructeur, capacite, autonomie_km, en_service) VALUES
('A320', 'Airbus', 180, 6150, TRUE),
('A380', 'Airbus', 853, 15200, TRUE),
('737 MAX', 'Boeing', 210, 6570, TRUE),
('747-400', 'Boeing', 416, 13450, FALSE),
('CSeries 300', 'Bombardier', 160, 6112, TRUE),
('MD-11', 'McDonnell Douglas', 293, 12555, FALSE),
('Concorde', 'Aérospatiale/BAC', 92, 7250, FALSE),
('E190', 'Embraer', 114, 4260, TRUE),
('CRJ900', 'Bombardier', 90, 2956, TRUE),
('Il-96', 'Ilyushin', 262, 11000, FALSE);

-- LVL 1

SELECT * FROM avions;

SELECT modele, constructeur FROM avions;

-- LVL 2

SELECT modele, constructeur FROM avions
WHERE capacite > 300;

SELECT modele, constructeur FROM avions
WHERE autonomie_km < 7000;

SELECT modele, constructeur FROM avions
WHERE en_service = FALSE;

SELECT modele FROM avions
WHERE constructeur = 'Boeing';

SELECT modele FROM avions
WHERE  capacite <= 300 AND capacite > 100 ;

-- LVL 3 

SELECT DISTINCT constructeur FROM avions;

SELECT modele FROM avions
ORDER BY autonomie_km asc;

SELECT modele FROM avions
ORDER BY capacite DESC;

-- LVL 4

SELECT modele FROM avions
ORDER BY autonomie_km DESC
LIMIT 3;

SELECT modele FROM avions
ORDER BY capacite ASC
LIMIT 5;

SELECT modele FROM avions
WHERE autonomie_km > 6000 AND autonomie_km < 13000;
