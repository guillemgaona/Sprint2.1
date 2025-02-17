DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;

CREATE TABLE Clients (
    id_client INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    adreca VARCHAR(255) NOT NULL,
    codi_postal VARCHAR(10) NOT NULL,
    localitat VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL,
    telefon VARCHAR(15) NOT NULL
);

CREATE TABLE Botigues (
    id_botiga INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    adreca VARCHAR(255) NOT NULL,
    codi_postal VARCHAR(10) NOT NULL,
    localitat VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL
);

CREATE TABLE Empleats (
    id_empleat INT  UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    nif VARCHAR(15) UNIQUE NOT NULL,
    telefon VARCHAR(15) NOT NULL,
    tipus ENUM('cuiner', 'repartidor') NOT NULL,
    id_botiga INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_botiga) REFERENCES Botigues(id_botiga)
);

CREATE TABLE CategoriesPizzes (
    id_categoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE Productes (
    id_producte INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    descripcio TEXT,
    imatge VARCHAR(255),
    preu DECIMAL(10, 2) NOT NULL,
    tipus ENUM('pizza', 'hamburguesa', 'beguda') NOT NULL,
    id_categoria INT UNSIGNED,
    FOREIGN KEY (id_categoria) REFERENCES CategoriesPizzes(id_categoria)
);

CREATE TABLE Comandes (
    id_comanda INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT UNSIGNED,
    data_hora DATETIME NOT NULL,
    tipus ENUM('domicili', 'botiga') NOT NULL,
    preu_total DECIMAL(10, 2) NOT NULL,
    id_botiga INT UNSIGNED,
    id_repartidor INT UNSIGNED,
    data_hora_lliurament DATETIME,
    FOREIGN KEY (id_client) REFERENCES Clients(id_client),
    FOREIGN KEY (id_botiga) REFERENCES Botigues(id_botiga),
    FOREIGN KEY (id_repartidor) REFERENCES Empleats(id_empleat)
);

CREATE TABLE DetallsComanda (
    id_detall INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_comanda INT,
    id_producte INT UNSIGNED,
    quantitat INT NOT NULL,
    FOREIGN KEY (id_comanda) REFERENCES Comandes(id_comanda),
    FOREIGN KEY (id_producte) REFERENCES Productes(id_producte)
);