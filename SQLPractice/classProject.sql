CREATE TABLE users (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(50),
password VARCHAR(50),
created_on TIMESTAMP
);

CREATE TABLE profiles (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
userId INT(6) UNSIGNED NOT NULL UNIQUE REFERENCES users(id),
firstName TEXT NOT NULL,
lastName TEXT NOT NULL,
created_on TIMESTAMP
);

CREATE TABLE posts (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
profileId INT(6) UNSIGNED NOT NULL UNIQUE REFERENCES profiles(id),
title TEXT,
content TEXT
);




INSERT INTO users (email, password, created_on)
VALUES ('clifftest.com', 'tester', CURRENT_TIMESTAMP);
INSERT INTO users (email, password, created_on)
VALUES ('margie.com', 'hello world', CURRENT_TIMESTAMP);
INSERT INTO users (email, password, created_on)
VALUES ('gabe.com', 'poop', CURRENT_TIMESTAMP);

-- PROFILES

INSERT INTO profiles (userId, firstName, lastName, created_on)
VALUES (1, 'Cliff', 'Chon', CURRENT_TIMESTAMP);

INSERT INTO profiles (userId, firstName, lastName, created_on)
VALUES (1, 'Gabe', 'Sherman', CURRENT_TIMESTAMP);

INSERT INTO profiles (userId, firstName, lastName, created_on)
VALUES (1, 'Tom', 'Hodgkinson', CURRENT_TIMESTAMP);

INSERT INTO posts (`profileId`, `title`, `content`)
VALUES (1, 'SQL Syntax', 'Its not so bad');
