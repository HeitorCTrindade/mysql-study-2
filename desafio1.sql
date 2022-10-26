DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone ;

-- -----------------------------------------------------
-- Table SpotifyClone.subscription_plan
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.subscription_plan (
    subscription_plan_id INT NOT NULL AUTO_INCREMENT,
    type VARCHAR(15) NOT NULL,
    value FLOAT NOT NULL,
    PRIMARY KEY (subscription_plan_id)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table SpotifyClone.users
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.users (
  users_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  age INT NOT NULL,
  subscription_plan_id INT NOT NULL,
  subscription_start_at DATE NOT NULL,
  PRIMARY KEY (users_id),
  INDEX subscription_plan_id_idx (subscription_plan_id ASC) VISIBLE,
  
    FOREIGN KEY (subscription_plan_id)
    REFERENCES SpotifyClone.subscription_plan (subscription_plan_id)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table SpotifyClone.artists
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.artists (
    artists_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    PRIMARY KEY (artists_id)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table SpotifyClone.albums
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.albums (
  albums_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  release_year DATE NOT NULL,
  artists_id INT NOT NULL,
  PRIMARY KEY (albums_id),
  INDEX fk_albums_artists1_idx (artists_id ASC) VISIBLE,  
  FOREIGN KEY (artists_id)
    REFERENCES SpotifyClone.artists (artists_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table SpotifyClone.musics
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.musics (
  musics_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  artists_id INT NOT NULL,
  albums_id INT NOT NULL,
  duration INT NOT NULL,
  PRIMARY KEY (musics_id),
  INDEX album_id_idx (albums_id ASC) VISIBLE,
  INDEX artists_id_idx (artists_id ASC) VISIBLE,  
    FOREIGN KEY (albums_id)
    REFERENCES SpotifyClone.albums (albums_id),  
    FOREIGN KEY (artists_id)
    REFERENCES SpotifyClone.artists (artists_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table SpotifyClone.history
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.history (
  users_id INT NOT NULL,
  musics_id INT NOT NULL,
  reprodution_date DATE NOT NULL,
  PRIMARY KEY (users_id, musics_id),
  INDEX user_id_idx (users_id ASC) VISIBLE,
  INDEX musics_id_idx (musics_id ASC) VISIBLE,
  FOREIGN KEY (users_id)
    REFERENCES SpotifyClone.users (users_id),
  FOREIGN KEY (musics_id)
    REFERENCES SpotifyClone.musics (musics_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table SpotifyClone.folowers
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.folowers (
  users_id INT NOT NULL,
  artists_id INT NOT NULL,
  PRIMARY KEY (users_id, artists_id),
  INDEX users_id_idx (users_id ASC) VISIBLE,
  INDEX artists_id_idx (artists_id ASC) VISIBLE,
  FOREIGN KEY (users_id)
    REFERENCES SpotifyClone.users (users_id),
  FOREIGN KEY (artists_id)
    REFERENCES SpotifyClone.artists (artists_id))
ENGINE = InnoDB;

INSERT INTO SpotifyClone.subscription_plan (type, value)
  VALUES
    ('gratuito', 0.00),
    ('pessoal', 6.99),
    ('universitário', 5.99),
    ('familiar', 7.99);
    
INSERT INTO SpotifyClone.users (name, age, subscription_plan_id, subscription_start_at)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
	('Robert Cecil Martin', 58, 1, '2019-10-20'),
    ('Ada Lovelace', 37, 4, '2017-12-30'),
    ('Martin Fowler', 46, 4, '2017-01-17'),
	('Sandi Metz', 58, 4, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
	('Christopher Alexander', 85, 2, '2019-06-05'),
    ('Judith Butler', 45, 2, '2020-05-13'),
	('Jorge Amado', 58, 2, '2017-02-17');

INSERT INTO SpotifyClone.artists (name)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');
    
INSERT INTO SpotifyClone.albums (name, release_year, artists_id)
  VALUES
    ('Renaissance', '2022-01-01', 1),
    ('Jazz', '1978-01-01', 2),
    ('Hot Space', '1982-01-01', 2),
    ('Falso Brilhante', '1998-01-01', 3),
    ('Vento de Maio', '2001-01-01', 3),
    ('QVVJFA?', '2003-01-01', 4),
    ('Somewhere Far Beyond', '2007-01-01', 5),
    ('I Put A Spell On You', '2012-01-01', 6);
    
INSERT INTO SpotifyClone.musics (name, artists_id, albums_id, duration)
  VALUES
    ('BREAK MY SOUL', 1, 1, 279),
    ('VIRGO’S GROOVE', 1, 1, 369),
    ('ALIEN SUPERSTAR', 1, 1, 116),
    ('Don’t Stop Me Now', 2, 2, 203),
    ('Under Pressure', 2, 3, 152),
    ('Como Nossos Pais', 3, 4, 105),
    ('O Medo de Amar é o Medo de Ser Livre', 3, 5, 207),
    ('Samba em Paris', 4, 6, 267),
    ('The Bard’s Song', 5, 7, 244),
    ('Feeling Good', 6, 8, 100);
    
INSERT INTO SpotifyClone.history (users_id, musics_id, reprodution_date)
  VALUES
    (1,	7,	'2022-02-28 10:45:55'),
    (1,	2,	'2020-05-02 05:30:35'),
    (1,	10,	'2020-03-06 11:22:33'),
    (2,	10,	'2022-08-05 08:05:17'),
    (2,	7,	'2020-01-02 07:40:33'),
    (3,	10,	'2020-11-13 16:55:13'),
    (3,	2,	'2020-12-05 18:38:30'),
    (4,	8,	'2021-08-15 17:10:10'),
    (5,	8,	'2022-01-09 01:44:33'),
    (5,	5,	'2020-08-06 15:23:43'),
    (6,	7,	'2017-01-24 00:31:17'),
    (6,	1,	'2017-10-12 12:35:20'),
    (7,	4,	'2011-12-15 22:30:49'),
    (8, 4,	'2012-03-17 14:56:41'),
    (9,	9,	'2022-02-24 21:14:22'),
    (10, 2,	'2015-12-13 08:30:22');
    
INSERT INTO SpotifyClone.folowers (users_id, artists_id)
  VALUES
    (1,	1),
    (1,	2),
    (1,	3),
    (2,	1),
    (2,	3),
    (3,	2),
    (4,	4),
    (5,	5),
    (5,	6),
    (6,	6),
    (6,	1),
    (7,	6),
    (9,	3),
    (10,2);
