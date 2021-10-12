/*
*   USER AND ROLE TABLES        
*/
DROP DATABASE IF EXISTS naat_users;
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
    vacation_start TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    vacation_ending TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    user_enabled BIT(1) DEFAULT 1,
    creation_date TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    modification_date TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    role_id VARCHAR(20) NOT NULL,
    CONSTRAINT pk_users_user_id PRIMARY KEY(user_id),
    CONSTRAINT fk_users_role_id FOREIGN KEY(role_id) REFERENCES roles(role_id),
    CONSTRAINT uq_users_email UNIQUE(email),
    CONSTRAINT ck_user_user_enabled CHECK(user_enabled=0 OR user_enabled=1)
) ENGINE=InnoDB;
CREATE USER 'activity_user'@'%' IDENTIFIED BY 'Password';
GRANT CREATE, SELECT, INSERT, UPDATE, DELETE ON  naat_users. * TO 'activity_user'@'%';
FLUSH PRIVILEGES;


/*
*    CLIENTS DATABASE
*/
DROP DATABASE IF EXISTS naat_clients;
CREATE DATABASE naat_clients;
USE naat_clients;

CREATE TABLE Clients (
    client_id BINARY(16) DEFAULT (UUID_TO_BIN(UUID())),
    client_key VARCHAR(20) NOT NULL,
    client_name VARCHAR(30) NOT NULL,
    description VARCHAR(100) NOT NULL,
    creation_date TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    modification_date TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    client_enabled BIT(1) DEFAULT 1 NOT NULL,
    author_id BINARY(16) NOT NULL,
    CONSTRAINT pk_clients_client PRIMARY KEY(client_id),
    CONSTRAINT uq_clients__key UNIQUE(client_key),
    CONSTRAINT uq_clients_client_name UNIQUE(client_name),
    CONSTRAINT uq_clients_description UNIQUE(description),
    CONSTRAINT ck_clients_client_enabled CHECK(client_enabled=0 OR client_enabled=1)
) ENGINE=InnoDB;

CREATE USER 'activity_client'@'%' IDENTIFIED BY 'Password';
GRANT CREATE, SELECT, INSERT, UPDATE,  DELETE ON  naat_clients. * TO 'activity_client'@'%';
FLUSH PRIVILEGES;


/*
*    NEWS DATABASE
*/
DROP DATABASE IF EXISTS naat_news;
CREATE DATABASE naat_news;
USE naat_news;

CREATE TABLE News(
    news_id BINARY(16) DEFAULT (UUID_TO_BIN(UUID())),
    headline VARCHAR(200) NOT NULL,
    summary TEXT NOT NULL,
    news_body TEXT NOT NULL,
    image VARCHAR(100),
    creation_date TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    modification_date TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    news_enabled BIT(1) DEFAULT 1 NOT NULL,
    author_id BINARY(16) NOT NULL,
    CONSTRAINT pk_news_news_id PRIMARY KEY (news_id),
    CONSTRAINT uq_news_headline UNIQUE(headline),
    CONSTRAINT uq_news_summary UNIQUE(summary(500)),
    CONSTRAINT uq_news_body UNIQUE(news_body(500)),
    CONSTRAINT ck_news_news_enabled CHECK(news_enabled=0 OR news_enabled=1)
)ENGINE=InnoDB;



CREATE USER 'activity_news'@'%' IDENTIFIED BY 'Password';
GRANT CREATE, SELECT, INSERT, UPDATE,  DELETE ON  naat_news. * TO 'activity_news'@'%';
FLUSH PRIVILEGES;

/*
*  ACTIVITY PROJECTS DATABASE
*/

DROP DATABASE IF EXISTS activity_records;
CREATE DATABASE activity_records;
USE activity_records;

/* AS AR_ACTIVITYRECORDS*/
CREATE TABLE Projects(
    project_id BINARY(16) DEFAULT (UUID_TO_BIN(UUID())),
    project_key VARCHAR(50) NOT NULL,
    project_name VARCHAR(80) NOT NULL,
    description VARCHAR(150) NOT NULL,
    creation_date TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    modification_date TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    project_enabled BIT(1) DEFAULT 1 NOT NULL,
    client_id BINARY(16) NOT NULL,
    author_id BINARY(16) NOT NULL,
    CONSTRAINT pk_projects_project_id PRIMARY KEY (project_id),
    CONSTRAINT uq_projects_key UNIQUE(project_key),
    CONSTRAINT uq_projects_project_name UNIQUE(project_name),
    CONSTRAINT uq_projects_description UNIQUE(description),
    CONSTRAINT ck_projects_project_enabled CHECK(project_enabled=0 OR project_enabled=1)
)ENGINE=InnoDB;

CREATE TABLE Activities(
    activity_id BINARY(16) DEFAULT (UUID_TO_BIN(UUID())),
    activity_key VARCHAR(50) NOT NULL,
    activity_name VARCHAR(80) NOT NULL,
    description VARCHAR(150) NOT NULL,
    creation_date TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    modification_date TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    activity_enabled BIT(1) DEFAULT 1 NOT NULL,
    author_id BINARY(16) NOT NULL,
    CONSTRAINT activity_pk PRIMARY KEY (activity_id),
    CONSTRAINT uq_activities_key UNIQUE(activity_key),
    CONSTRAINT uq_activities_activity_name UNIQUE(activity_name),
    CONSTRAINT uq_activities_description UNIQUE(description),
    CONSTRAINT ck_activities_activity_enabled CHECK(activity_enabled=0 OR activity_enabled=1)
)ENGINE=InnoDB;




CREATE TABLE ActivityRecord(
    activity_record_id BINARY(16) DEFAULT (UUID_TO_BIN(UUID())),
    activity_duration TINYINT NOT NULL,
    activity_record_date DATE NOT NULL,
    creation_date TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    modification_date TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    activity_record_enabled BIT(1) DEFAULT 1 NOT NULL,
    project_id BINARY(16) NOT NULL,
    user_id BINARY(16) NOT NULL,
    activity_id BINARY(16) NOT NULL,
    CONSTRAINT pk_activity_record_activity_record_id PRIMARY KEY (activity_record_id),
    CONSTRAINT fk_project FOREIGN KEY (project_id) REFERENCES projects(project_id),
    CONSTRAINT fk_activity FOREIGN KEY (activity_id ) REFERENCES activities(activity_id),
    CONSTRAINT ck_activity_record_activity_record_enabled CHECK(activity_record_enabled=0 OR activity_record_enabled=1),
    CONSTRAINT ck_activity_record_duration CHECK (activity_duration>=0 and activity_duration <=24)
)ENGINE=InnoDB;

CREATE USER 'record_user'@'%' IDENTIFIED BY 'Password';
GRANT CREATE, SELECT, INSERT, UPDATE, DELETE ON  activity_records. * TO 'record_user'@'%';
FLUSH PRIVILEGES;