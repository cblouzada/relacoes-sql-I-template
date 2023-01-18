-- Active: 1674045898434@@127.0.0.1@3306


-- Práticas

-- EXERCICIO 1,2 .

CREATE TABLE users (

    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL

);

DROP TABLE users;

DROP TABLE phones;

CREATE TABLE phones(
    
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    users_id TEXT NOT NULL,
    FOREIGN KEY (users_id) REFERENCES users (id)

);

INSERT INTO users (id, name, email, password)
VALUES
    ("berg01", "bergson", "bergsondev@email.com", "berg123"),
    ("dani02", "daniele", "dannidev@email.com", "dani123"),
    ("luc03", "lucky", "luckycao@email.com", "lucky123"),
    ("selm03", "selma", "selma@email.com", "selm123");

INSERT INTO phones (id, phone_number, users_id)
VALUES
    ('bergson01', '5548991360545', 'berg01'),
    ("daniele02", '554890000000', "dani02"),
    ("lucky03", "5548901010101", "luc03"),
    ("selma04", "5548902020202", "selm03");


SELECT * FROM users -- TABELA A
INNER JOIN phones -- TABELA B
ON phones.users_id = users.id;    

-- EXERCICIO 3

CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses (id)
);

INSERT INTO licenses (id, register_number, category)
VALUES 
    ("l001", "11111111111", "A"),
    ("l002", "22222222222", "AB");

INSERT INTO drivers (id, name, email, password, license_id)
VALUES
    ("d001", "Carlos Bergson", "carlosb@email.com", "carlosbbb", "l001"),
    ("d002", "Tais Zimerer", "zimerertais@email.com", "tais00", "l002");

SELECT * FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;
