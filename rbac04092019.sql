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


INSERT INTO roles(role_name) VALUES ('admin');
insert into roles(role_name) VALUES ('supper admin');

SELECT * from roles;

INSERT INTO users(username, password, role_id) VALUES ('thuocnv', 'thuocnv', 1);
INSERT INTO users(username, password, role_id) VALUES ('yenth', 'yenth', 2);

SELECT * from users;

INSERT INTO resources(resource_name) VALUES ('post');

SELECT * FROM resources;

INSERT INTO permissions(resource_id, action) VALUES (1, 'read');
INSERT INTO permissions(resource_id, action) VALUES (1, 'create');
INSERT INTO permissions(resource_id, action) VALUES (1, 'update');
INSERT INTO permissions(resource_id, action) VALUES (1, 'delete');

select * from permissions;

insert into grants(role_id, permission_id) VALUES (1, 1);
insert into grants(role_id, permission_id) VALUES (1, 2);
insert into grants(role_id, permission_id) VALUES (1, 3);
insert into grants(role_id, permission_id) VALUES (1, 4);

select * from grants;


-- SELECT column_name(s)
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;

-- input will be role_id, resource_name, action
-- 
-- SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
-- FROM ((Orders
-- INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
-- INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);
-- 


-- input will be role_id, resource_name, action
-- role_id getting from users table
-- resource_name getting from url
-- action mean, http method 
select * from resources where resources.resource_name = 'post';

-- http://localhost:port/api/api_ver/resource/

select * from permissions as p inner join grants as g on g.role_id = 1
							   inner join resources as re on p.resource_id = re.id and re.resource_name = 'post'
				where p.id = g.permission_id and p.`action` = 'update';
