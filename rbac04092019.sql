CREATE DATABASE IF NOT EXISTS AUTH;

USE AUTH;

CREATE TABLE IF NOT EXISTS roles (
id int PRIMARY KEY AUTO_INCREMENT,
role_name varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
id int PRIMARY KEY AUTO_INCREMENT,
username varchar(45) NOT NULL,
password varchar(255) NOT NULL,
role_id int NOT NULL,
FOREIGN KEY(role_id) REFERENCES roles(id)
);

CREATE TABLE IF NOT EXISTS resources (
id int PRIMARY KEY AUTO_INCREMENT,
resource_name varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS permissions (
id int PRIMARY KEY AUTO_INCREMENT,
resource_id int NOT NULL,
action varchar(100) NOT NULL,
FOREIGN KEY(resource_id) REFERENCES resources(id)
);

CREATE TABLE IF NOT EXISTS grants (
id int PRIMARY KEY AUTO_INCREMENT,
role_id int NOT NULL,
permission_id int NOT NULL,
FOREIGN KEY(role_id) REFERENCES roles(id),
FOREIGN KEY(permission_id) REFERENCES permissions(id)
);