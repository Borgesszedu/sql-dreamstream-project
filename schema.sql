-- Database schema creation
-- Files: schema.sql
-- DBMS: MySQL

CREATE DATABASE IF NOT EXISTS dreamstream;
USE dreamstream;

-- users table creation
CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name1 VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    regist_date DATE DEFAULT (CURRENT_DATE())
);

-- movies table creation
CREATE TABLE movies (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    sinopsis TEXT
);

-- series table creation
CREATE TABLE series (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    sinopsis TEXT
);

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

-- genders table creation
CREATE TABLE genders (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name1 VARCHAR(255) UNIQUE NOT NULL
);

-- actors table creation
CREATE TABLE actors (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name1 VARCHAR(255) NOT NULL
);

-- directors table creation
CREATE TABLE directors (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name1 VARCHAR(255) NOT NULL
);

-- MoviesGenders table creation
CREATE TABLE moviesgenders (
	id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    gender_id INT,
    UNIQUE KEY (movie_id, gender_id),
    FOREIGN KEY (movie_id) REFERENCES movies (id) ON DELETE CASCADE,
    FOREIGN KEY (gender_id) REFERENCES genders (id) ON DELETE CASCADE
);

-- SeriesGenders table creation
CREATE TABLE seriesgenders (
	id INT AUTO_INCREMENT PRIMARY KEY,
    serie_id INT,
    gender_id INT,
    UNIQUE KEY(serie_id, gender_id),
    FOREIGN KEY (serie_id) REFERENCES series (id) ON DELETE CASCADE,
    FOREIGN KEY (gender_id) REFERENCES genders (id) ON DELETE CASCADE
);

-- ActorsMovies table creation
CREATE TABLE actorsmovies (
	id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    actor_id INT,
    UNIQUE KEY(movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies (id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actors (id) ON DELETE CASCADE
);

-- ActorsSeries table creation
CREATE TABLE actorsseries (
	id INT AUTO_INCREMENT PRIMARY KEY,
    serie_id INT,
    actor_id INT,
    UNIQUE KEY (serie_id, actor_id),
    FOREIGN KEY (serie_id) REFERENCES series (id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actors (id) ON DELETE CASCADE
);

-- DirectorsMovies table creation
CREATE TABLE directorsmovies (
	id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    director_id INT,
    UNIQUE KEY (movie_id, director_id),
    FOREIGN KEY (movie_id) REFERENCES movies (id) ON DELETE CASCADE,
    FOREIGN KEY (director_id) REFERENCES directors (id) ON DELETE CASCADE
);

-- DirectorsSeries table creation
CREATE TABLE directorsseries (
	id INT AUTO_INCREMENT PRIMARY KEY,
    serie_id INT,
    director_id INT,
    UNIQUE KEY (serie_id, director_id),
    FOREIGN KEY (serie_id) REFERENCES series (id) ON DELETE CASCADE,
    FOREIGN KEY (director_id) REFERENCES directors (id) ON DELETE CASCADE
);

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

-- plans table creation
CREATE TABLE plans (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name1 VARCHAR(100) UNIQUE NOT NULL,
    price DECIMAL(5,2) NOT NULL,
    description1 TEXT
);

