/*
*   USER AND ROLE TABLES        
*/
CREATE DATABASE naat_users;
USE naat_users;
CREATE TABLE Roles(
    role_id VARCHAR(20),
    description VARCHAR(60),
    CONSTRAINT pk_roles_role_id PRIMARY KEY(role_id)
);

CREATE TABLE Users(
    user_id BINARY(16) DEFAULT (UUID_TO_BIN(UUID())),
    user_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(70) NOT NULL,
    email VARCHAR(60) NOT NULL,
    vacation_start TIMESTAMP(3),
    vacation_ending TIMESTAMP(3),
    user_enabled BIT(1) DEFAULT 1,
    creation_date TIMESTAMP(3) ,
    modification_date TIMESTAMP(3),
    role_id VARCHAR(20) NOT NULL,
    CONSTRAINT pk_users_user_id PRIMARY KEY(user_id),
    CONSTRAINT fk_users_role_id FOREIGN KEY(role_id) REFERENCES roles(role_id),
    CONSTRAINT uq_users_email UNIQUE(email),
    CONSTRAINT ck_user_user_enabled CHECK(user_enabled=0 OR user_enabled=1)
) ENGINE=InnoDB;
CREATE USER 'activity_user'@'%' IDENTIFIED BY 'Password';
GRANT CREATE, SELECT, INSERT, DELETE ON  naat_users. * TO 'activity_user'@'%';
FLUSH PRIVILEGES;


/*
*    CLIENTS DATABASE
*/
CREATE DATABASE naat_clients;
USE naat_clients;

CREATE TABLE Clients (
    client_id BINARY(16) DEFAULT (UUID_TO_BIN(UUID())),
    client_key VARCHAR(20) NOT NULL,
    client_name VARCHAR(30) NOT NULL,
    description VARCHAR(100) NOT NULL,
    creation_date TIMESTAMP(3),
    modification_date TIMESTAMP(3),
    client_enabled BIT(1) DEFAULT 1 NOT NULL,
    author_id BINARY(16) NOT NULL,
    CONSTRAINT pk_clients_client PRIMARY KEY(client_id),
    CONSTRAINT uq_clients__key UNIQUE(client_key),
    CONSTRAINT uq_clients_client_name UNIQUE(client_name),
    CONSTRAINT uq_clients_description UNIQUE(description),
    CONSTRAINT ck_clients_client_enabled CHECK(client_enabled=0 OR client_enabled=1)
) ENGINE=InnoDB;

CREATE USER 'activity_client'@'%' IDENTIFIED BY 'Password';
GRANT CREATE, SELECT, INSERT, DELETE ON  naat_clients. * TO 'activity_client'@'%';
FLUSH PRIVILEGES;