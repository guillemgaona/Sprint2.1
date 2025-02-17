DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica CHARACTER SET utf8mb4;

CREATE TABLE Proveidors (
    id_proveidor INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    carrer VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    pis VARCHAR(10),
    porta VARCHAR(10),
    ciutat VARCHAR(50) NOT NULL,
    codi_postal VARCHAR(10) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    telefon VARCHAR(15) NOT NULL,
    fax VARCHAR(15),
    nif VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Marques (
    id_marca INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom_marca VARCHAR(100) NOT NULL,
    id_proveidor INT UNSIGNED,
    FOREIGN KEY (id_proveidor) REFERENCES Proveidors(id_proveidor)
);

CREATE TABLE Ulleres (
    id_ullera INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_marca INT UNSIGNED NOT NULL,
    graduacio_vidre_dret DECIMAL(5, 2),
    graduacio_vidre_esquerre DECIMAL(5, 2),
    tipus_muntura ENUM('flotant', 'pasta', 'metàl·lica') NOT NULL,
    color_muntura VARCHAR(50) NOT NULL,
    color_vidres VARCHAR(50) NOT NULL,
    preu DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES Marques(id_marca)
);

CREATE TABLE Clients (
    id_client INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    adreca_postal VARCHAR(255),
    telefon VARCHAR(15) NOT NULL,
    correu_electronic VARCHAR(100) NOT NULL,
    data_registre DATE,
    id_client_recomanat INT UNSIGNED,
    FOREIGN KEY (id_client_recomanat) REFERENCES Clients(id_client)
);

CREATE TABLE Empleats (
    id_empleat INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    telefon VARCHAR(20),
    correu_electronic VARCHAR(100)
);

CREATE TABLE Vendes (
    id_venda INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_ullera INT UNSIGNED NOT NULL,
    id_client INT UNSIGNED NOT NULL,
    id_empleat INT UNSIGNED NOT NULL,
    data_venda DATE NOT NULL,
    FOREIGN KEY (id_ullera) REFERENCES Ulleres(id_ullera),
    FOREIGN KEY (id_client) REFERENCES Clients(id_client),
    FOREIGN KEY (id_empleat) REFERENCES Empleats(id_empleat)
);
