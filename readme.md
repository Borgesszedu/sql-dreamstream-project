# SQL Project: DreamStream - Database Schema Creation

**Author:** [Eduardo Borges da Silva]
**Date:** May 17, 2025
**Location:** Brazil
**DBMS:** MySQL

## 1. Project Overview

This project aims to create a robust and well-structured database schema for a movie and series streaming platform called "DreamStream." The goal is to demonstrate skills in relational data modeling, constraint definition, and referential integrity considerations.

## 2. File: `schema.sql`

This file contains the SQL script for creating the `dreamstream` database and all its tables.

### 2.1. Database Creation

```sql
CREATE DATABASE IF NOT EXISTS dreamstream;
USE dreamstream;

Objective: Create the dreamstream database if it does not exist and then select it for use.
Logic: The command CREATE DATABASE IF NOT EXISTS dreamstream; checks if a database with the name dreamstream already exists. If it doesn't, it creates it. The command USE dreamstream; instructs MySQL to use the dreamstream database for subsequent operations.



2.2. users Table Creation

```sql
-- users table creation
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name1 VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    regist_date DATE DEFAULT (CURRENT_DATE())
);

Objective: Store information about the platform's users. 
Attributes: 
id (INT): Unique identifier for each user. It is defined as AUTO_INCREMENT to automatically generate a new value for each insertion and PRIMARY KEY to ensure uniqueness and serve as the table's primary key.
name1 (VARCHAR(255)): Full name of the user. It is defined as NOT NULL, indicating that this field is mandatory.
email (VARCHAR(255)): User's email address. It is defined as UNIQUE NOT NULL, ensuring that each user has a unique email and that this field is mandatory.
Regist_date (DATE): Date when the user registered on the platform. It has a default value (DEFAULT (CURRENT_DATE())) that automatically sets the current date at the time of insertion if no value is specified.
Primary Key: id


2.3. movies Table Creation


-- movies table creation
CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    sinopsis TEXT
);

Objective: Store information about the movies available on the platform. 
Attributes: 
id (INT): Unique identifier for each movie. It is defined as AUTO_INCREMENT PRIMARY KEY.
title (VARCHAR(255)): Title of the movie. It is defined as NOT NULL.
release_year (INT): Release year of the movie.
sinopsis (TEXT): A brief description or synopsis of the movie. The TEXT type allows storing long texts.
Primary Key: id


2.4. series Table Creation


-- series table creation
CREATE TABLE series (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    sinopsis TEXT
);

Objective: Store information about the series available on the platform. 
Attributes: 
id (INT): Unique identifier for each series. It is defined as AUTO_INCREMENT PRIMARY KEY.
title (VARCHAR(255)): Title of the series. It is defined as NOT NULL.
release_year (INT): Release year of the first season of the series.
sinopsis (TEXT): A brief description or synopsis of the series.
Primary Key: id


2.5. episodes Table Creation


-- episodes table creation
CREATE TABLE episodes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    serie_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    season_number INT NOT NULL,
    episode_number INT NOT NULL,
    sinopsis TEXT,
    UNIQUE KEY (serie_id, season_number, episode_number),
    FOREIGN KEY (serie_id) REFERENCES series(id) ON DELETE CASCADE
);

Objective: Store information about the episodes of each series. 
Attributes: 
id (INT): Unique identifier for each episode. It is defined as AUTO_INCREMENT PRIMARY KEY.
serie_id (INT): Foreign key referencing the series table, indicating which series the episode belongs to. It is defined as NOT NULL.
title (VARCHAR(255)): Title of the episode. It is defined as NOT NULL.
season_number (INT): Season number of the episode. It is defined as NOT NULL.
episode_number (INT): Episode number within the season. It is defined as NOT NULL.
sinopsis (TEXT): A brief description or synopsis of the episode.
Primary Key: id 
Foreign Key: serie_id referencing series(id) with the ON DELETE CASCADE clause. This means that if a series is deleted, all its episodes will also be automatically deleted. 
UNIQUE Constraint: UNIQUE KEY (serie_id, season_number, episode_number) ensures that there are no duplicate episodes within the same season of a series.


2.6. genders Table Creation


-- genders table creation
CREATE TABLE genders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name1 VARCHAR(255) UNIQUE NOT NULL
);

Objective: Store the genres of movies and series (e.g., Action, Comedy, Drama). 
Attributes: 
id (INT): Unique identifier for each genre. It is defined as AUTO_INCREMENT PRIMARY KEY.
name1 (VARCHAR(255)): Name of the genre. It is defined as UNIQUE NOT NULL to ensure that each genre is unique and the field is mandatory.
Primary Key: id 
UNIQUE Constraint: UNIQUE KEY (name1) ensures that there are no genres with the same name.


2.7. actors Table Creation

-- actors table creation
CREATE TABLE actors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name1 VARCHAR(255) NOT NULL
);

Objective: Store the names of the actors. 
Attributes: 
id (INT): Unique identifier for each actor. It is defined as AUTO_INCREMENT PRIMARY KEY.
name1 (VARCHAR(255)): Name of the actor. It is defined as NOT NULL.
Primary Key: id


2.8. directors Table Creation


-- directors table creation
CREATE TABLE directors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name1 VARCHAR(255) NOT NULL
);

Objective: Store the names of the directors. 
Attributes: 
id (INT): Unique identifier for each director. It is defined as AUTO_INCREMENT PRIMARY KEY.
name1 (VARCHAR(255)): Name of the director. It is defined as NOT NULL.
Primary Key: id


2.9. moviesgenders Table Creation


-- MoviesGenders table creation
CREATE TABLE moviesgenders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    gender_id INT,
    UNIQUE KEY (movie_id, gender_id),
    FOREIGN KEY (movie_id) REFERENCES movies (id) ON DELETE CASCADE,
    FOREIGN KEY (gender_id) REFERENCES genders (id) ON DELETE CASCADE
);

Objective: Establish the many-to-many relationship between movies and genres. 
Attributes: 
id (INT): Unique identifier for each association. It is defined as AUTO_INCREMENT PRIMARY KEY.
movie_id (INT): Foreign key referencing the movies table.
gender_id (INT): Foreign key referencing the genders table.
Primary Key: id 
Foreign Keys: 
movie_id referencing movies(id) with ON DELETE CASCADE.
gender_id referencing genders(id) with ON DELETE CASCADE.
UNIQUE Constraint: UNIQUE KEY (movie_id, gender_id) ensures that each movie is not associated with the same genre multiple times.


2.10. seriesgenders Table Creation


-- SeriesGenders table creation
CREATE TABLE seriesgenders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    serie_id INT,
    gender_id INT,
    UNIQUE KEY(serie_id, gender_id),
    FOREIGN KEY (serie_id) REFERENCES series (id) ON DELETE CASCADE,
    FOREIGN KEY (gender_id) REFERENCES genders (id) ON DELETE CASCADE
);

Objective: Establish the many-to-many relationship between series and genres. 
Attributes: 
id (INT): Unique identifier for each association. It is defined as AUTO_INCREMENT PRIMARY KEY.
serie_id (INT): Foreign key referencing the series table.
gender_id (INT): Foreign key referencing the genders table.
Primary Key: id 
Foreign Keys: 
serie_id referencing series(id) with ON DELETE CASCADE.
gender_id referencing genders(id) with ON DELETE CASCADE.
UNIQUE Constraint: UNIQUE KEY (serie_id, gender_id) ensures that each series is not associated with the same genre multiple times.


2.11. actorsmovies Table Creation


-- ActorsMovies table creation
CREATE TABLE actorsmovies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    actor_id INT,
    UNIQUE KEY(movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies (id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actors (id) ON DELETE CASCADE
);

Objective: Establish the many-to-many relationship between actors and movies. 
Attributes: 
id (INT): Unique identifier for each association. It is defined as AUTO_INCREMENT PRIMARY KEY.
movie_id (INT): Foreign key referencing the movies table.
actor_id (INT): Foreign key referencing the actors table.
Primary Key: id 
Foreign Keys: 
movie_id referencing movies(id) with ON DELETE CASCADE.
actor_id referencing actors(id) with ON DELETE CASCADE.
UNIQUE Constraint: UNIQUE KEY (movie_id, actor_id) ensures that each actor is not associated with the same movie multiple times.


2.12. actorsseries Table Creation


-- ActorsSeries table creation
CREATE TABLE actorsseries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    serie_id INT,
    actor_id INT,
    UNIQUE KEY (serie_id, actor_id),
    FOREIGN KEY (serie_id) REFERENCES series (id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actors (id) ON DELETE CASCADE
);

Objective: Establish the many-to-many relationship between actors and series. 
Attributes: 
id (INT): Unique identifier for each association. It is defined as AUTO_INCREMENT PRIMARY KEY.
serie_id (INT): Foreign key referencing the series table.
actor_id (INT): Foreign key referencing the actors table.
Primary Key: id 
Foreign Keys: 
serie_id referencing series(id) with ON DELETE CASCADE.
actor_id referencing actors(id) with ON DELETE CASCADE.
UNIQUE Constraint: UNIQUE KEY (serie_id, actor_id) ensures that each actor is not associated with the same series multiple times.


2.13. directorsmovies Table Creation


-- DirectorsMovies table creation
CREATE TABLE directorsmovies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    director_id INT,
    UNIQUE KEY (movie_id, director_id),
    FOREIGN KEY (movie_id) REFERENCES movies (id) ON DELETE CASCADE,
    FOREIGN KEY (director_id) REFERENCES directors (id) ON DELETE CASCADE
);

Objective: Establish the many-to-many relationship between directors and movies. 
Attributes: 
id (INT): Unique identifier for each association. It is defined as AUTO_INCREMENT PRIMARY KEY.
movie_id (INT): Foreign key referencing the movies table.
director_id (INT): Foreign key referencing the directors table.
Primary Key: id 
Foreign Keys: 
movie_id referencing movies(id) with ON DELETE CASCADE.
director_id referencing directors(id) with ON DELETE CASCADE.
UNIQUE Constraint: UNIQUE KEY (movie_id, director_id) ensures that each director is not associated with the same movie multiple times.


2.14. directorsseries Table Creation

-- DirectorsSeries table creation
CREATE TABLE directorsseries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    serie_id INT,
    director_id INT,
    UNIQUE KEY (serie_id, director_id),
    FOREIGN KEY (serie_id) REFERENCES series (id) ON DELETE CASCADE,
    FOREIGN KEY (director_id) REFERENCES directors (id) ON DELETE CASCADE
);

Objective: Establish the many-to-many relationship between directors and series. 
Attributes: 
id (INT): Unique identifier for each association. It is defined as AUTO_INCREMENT PRIMARY KEY.
serie_id (INT): Foreign key referencing the series table.
director_id (INT): Foreign key referencing the directors table.
Primary Key: id 
Foreign Keys: 
serie_id referencing series(id) with ON DELETE CASCADE.
director_id referencing directors(id) with ON DELETE CASCADE.
UNIQUE Constraint: UNIQUE KEY (serie_id, director_id) ensures that each director is not associated with the same series multiple times.


2.15. viewhistory Table Creation

-- ViewHistory table creation
CREATE TABLE viewhistory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    content_id INT NOT NULL,
    content_type VARCHAR(10) NOT NULL CHECK (content_type IN ('Movie', 'Serie')),
    view_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY (user_id, content_id, content_type),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

Objective: Record the viewing history of users. 
Attributes: 
id (INT): Unique identifier for each view record. It is defined as AUTO_INCREMENT PRIMARY KEY.
user_id (INT): Foreign key referencing the users table.
content_id (INT): Identifier of the content viewed (can be a movie or a series). It is defined as NOT NULL.
content_type (VARCHAR(10)): Type of content viewed ('Movie' or 'Serie'). It has a CHECK constraint to ensure only these values are allowed.
view_date (TIMESTAMP): Timestamp of when the content was viewed. It has a default value of the current timestamp (DEFAULT CURRENT_TIMESTAMP).
Primary Key: id 
Foreign Key: user_id referencing users(id) with ON DELETE CASCADE. 
UNIQUE Constraint: UNIQUE KEY (user_id, content_id, content_type) prevents a user from having duplicate view records for the same content.




2.16. reviews Table Creation


-- reviews table creation
CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    content_id INT NOT NULL,
    content_type VARCHAR(10) NOT NULL CHECK (content_type IN ('Movie', 'Serie')),
    score INT NOT NULL CHECK (score BETWEEN 1 AND 5),
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY (user_id, content_id, content_type),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

Objective: Store user reviews for movies and series.
Attributes:

id (INT): Unique identifier for each review. It is defined as AUTO_INCREMENT PRIMARY KEY.

user_id (INT): Foreign key referencing the users table.
content_id (INT): Identifier of the content being reviewed (can be a movie or a series). It is defined as NOT NULL.
content_type (VARCHAR(10)): Type of content being reviewed ('Movie' or 'Serie'). It has a CHECK constraint to ensure only these values are allowed.
score (INT): Score given by the user in the review. It is defined as NOT NULL and has a CHECK constraint to ensure the score is between 1 and 5 (inclusive).
review_date (TIMESTAMP): Timestamp of when the review was submitted. It has a default value of the current timestamp (`DEFAULT CURRENT_TIMESTAMP`).

Primary Key: id

Foreign Key: user_id referencing users(id) with ON DELETE CASCADE.
UNIQUE Constraint: UNIQUE KEY (user_id, content_id, content_type) prevents a user from submitting multiple reviews for the same content.

2.17. plans Table Creation

-- plans table creation
CREATE TABLE plans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name1 VARCHAR(100) UNIQUE NOT NULL,
    price DECIMAL(5,2) NOT NULL,
    description1 TEXT
);

Objective: Store information about the subscription plans offered by the platform.

Attributes:
id (INT): Unique identifier for each plan. It is defined as AUTO_INCREMENT PRIMARY KEY.
name1 (VARCHAR(100)): Name of the subscription plan (e.g., 'Basic', 'Premium'). It is defined as UNIQUE NOT NULL to ensure plan names are unique and the field is mandatory.
price (DECIMAL(5,2)): Price of the subscription plan. The DECIMAL(5,2) type allows storing numbers with up to 5 digits in total, with 2 digits after the decimal point (e.g., 9.99). It is defined as NOT NULL.
description1 (TEXT): A brief description of the features or benefits of the plan.

Primary Key: id
UNIQUE Constraint: UNIQUE KEY (name1) ensures that plan names are unique.

## 3. Table Relationships (Data Model) The following diagram illustrates the relationships between the tables of the `dreamstream` database:
```mermaid
erDiagram
    users ||--o{ viewhistory : user_id
    users ||--o{ reviews : user_id
    movies ||--o{ moviesgenders : movie_id
    genders ||--o{ moviesgenders : gender_id
    series ||--o{ seriesgenders : serie_id
    genders ||--o{ seriesgenders : gender_id
    movies ||--o{ actorsmovies : movie_id
    actors ||--o{ actorsmovies : actor_id
    series ||--o{ actorsseries : serie_id
    actors ||--o{ actorsseries : actor_id
    movies ||--o{ directorsmovies : movie_id
    directors ||--o{ directorsmovies : director_id
    series ||--o{ directorsseries : serie_id
    directors ||--o{ directorsseries : director_id
    series ||--o{ episodes : serie_id
    movies ||--o{ reviews : content_id
    series ||--o{ reviews : content_id
    movies ||--o{ viewhistory : content_id
    series ||--o{ viewhistory : content_id

    users {
        INT id PK
        VARCHAR(255) name1
        VARCHAR(255) email UNIQUE
        DATE regist_date
    }

    movies {
        INT id PK
        VARCHAR(255) title
        INT release_year
        TEXT sinopsis
    }

    series {
        INT id PK
        VARCHAR(255) title
        INT release_year
        TEXT sinopsis
    }

    episodes {
        INT id PK
        INT serie_id FK
        VARCHAR(255) title
        INT season_number
        INT episode_number
        TEXT sinopsis
        UNIQUE (serie_id, season_number, episode_number)
    }

    genders {
        INT id PK
        VARCHAR(255) name1 UNIQUE
    }

    actors {
        INT id PK
        VARCHAR(255) name1
    }

    directors {
        INT id PK
        VARCHAR(255) name1
    }

    moviesgenders {
        INT id PK
        INT movie_id FK
        INT gender_id FK
        UNIQUE (movie_id, gender_id)
    }

    seriesgenders {
        INT id PK
        INT serie_id FK
        INT gender_id FK
        UNIQUE (serie_id, gender_id)
    }

    actorsmovies {
        INT id PK
        INT movie_id FK
        INT actor_id FK
        UNIQUE (movie_id, actor_id)
    }

    actorsseries {
        INT id PK
        INT serie_id FK
        INT actor_id FK
        UNIQUE (serie_id, actor_id)
    }

    directorsmovies {
        INT id PK
        INT movie_id FK
        INT director_id FK
        UNIQUE (movie_id, director_id)
    }

    directorsseries {
        INT id PK
        INT serie_id FK
        INT director_id FK
        UNIQUE (serie_id, director_id)
    }

    viewhistory {
        INT id PK
        INT user_id FK
        INT content_id
        VARCHAR(10) content_type
        TIMESTAMP view_date
        UNIQUE (user_id, content_id, content_type)
    }

    reviews {
        INT id PK
        INT user_id FK
        INT content_id
        VARCHAR(10) content_type
        INT score
        TIMESTAMP review_date
        UNIQUE (user_id, content_id, content_type)
    }

    plans {
        INT id PK
        VARCHAR(100) name1 UNIQUE
        DECIMAL(5,2) price
        TEXT description1
    }
```
This Entity-Relationship (ER) diagram visualizes how the tables are interconnected through primary and foreign keys, illustrating the referential integrity of the `dreamstream` database.
