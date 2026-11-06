-- =====================================================================
--  Jeu de données CINEMA — PostgreSQL (rejouable / idempotent)
--  Cours SQL S1 — BTS SIO 1re année
--  Porté depuis le script MySQL "Modèle de données Cinéma.sql".
--  Conventions : identifiants en snake_case, montants en entiers ($).
--  Chargement :
--    docker cp cinema.sql sql_cours_db:/tmp/cinema.sql
--    docker exec sql_cours_db psql -U prof_sio -d sql_cours -f /tmp/cinema.sql
-- =====================================================================

-- Chaque jeu de données vit dans son propre schéma pour éviter toute
-- collision de noms (les jeux Cinéma, Football et Pays utilisent tous
-- des tables "pays"). Pour interroger ce jeu : SET search_path TO cinema;
CREATE SCHEMA IF NOT EXISTS cinema;
SET search_path TO cinema, public;

-- ---------- Suppression (ordre inverse des dépendances) --------------
DROP TABLE IF EXISTS tournage        CASCADE;
DROP TABLE IF EXISTS revue           CASCADE;
DROP TABLE IF EXISTS critique        CASCADE;
DROP TABLE IF EXISTS realisateurfilm CASCADE;
DROP TABLE IF EXISTS realisateur     CASCADE;
DROP TABLE IF EXISTS filmgenre       CASCADE;
DROP TABLE IF EXISTS genre           CASCADE;
DROP TABLE IF EXISTS casting         CASCADE;
DROP TABLE IF EXISTS film            CASCADE;
DROP TABLE IF EXISTS acteur          CASCADE;
DROP TABLE IF EXISTS pays            CASCADE;

-- ---------- 1. PAYS --------------------------------------------------
CREATE TABLE pays (
    id_pays INT NOT NULL PRIMARY KEY,
    nom     VARCHAR(50)
);

INSERT INTO pays (id_pays, nom) VALUES
(1, 'USA'),
(2, 'France'),
(3, 'Royaume-Uni'),
(4, 'Italie'),
(5, 'Chine'),
(6, 'Turquie'),
(7, 'Japon'),
(8, 'Canada');

-- ---------- 2. ACTEUR -----------------------------------------------
CREATE TABLE acteur (
    id_acteur      INT NOT NULL PRIMARY KEY,
    fk_id_pays     INT DEFAULT 1,
    nom            VARCHAR(40),
    prenom         VARCHAR(40),
    genre          CHAR(1),
    date_naissance DATE,
    FOREIGN KEY (fk_id_pays) REFERENCES pays (id_pays)
);

INSERT INTO acteur (id_acteur, fk_id_pays, nom, prenom, genre, date_naissance) VALUES
(27, 1, 'Brando', 'Marlon', 'H', '1924-04-03'),
(51, 1, 'Pacino', 'Al', 'H', '1940-04-25'),
(53, 1, 'Caan', 'James', 'H', '1940-03-26'),
(56, 1, 'Duvall', 'Robert', 'H', '1931-01-05'),
(59, 1, 'Keaton', 'Diane', 'F', '1946-01-05'),
(60, 1, 'De Niro', 'Robert', 'H', '1943-08-17'),
(65, 1, 'Shire', 'Talia', 'F', '1946-04-25'),
(72, 1, 'Garcia', 'Andy', 'H', '1956-04-12'),
(75, 1, 'Coppola', 'Sofia', 'F', '1971-05-14'),
(80, 1, 'Kilmer', 'Val', 'H', '1959-12-31'),
(100, 1, 'Eastwood', 'Clint', 'H', '1930-05-31'),
(101, 1, 'Hackman', 'Gene', 'H', '1930-01-30'),
(102, 1, 'Freeman', 'Morgan', 'H', '1937-06-01'),
(103, 3, 'Harris', 'Richard', 'H', '1930-10-01'),
(105, 2, 'Robert', 'Timothée', 'H', '1971-06-15'),
(110, 1, 'Steinfeld', 'Hailee', 'F', '1996-12-11'),
(120, 1, 'Bridges', 'Jeff', 'H', '1949-12-04'),
(130, 1, 'Damon', 'Matt', 'H', '1970-10-08'),
(132, 1, 'Sheen', 'Martin', 'H', '1940-08-03'),
(135, 1, 'Nicholson', 'Jack', 'H', '1937-04-22'),
(140, 1, 'Ledger', 'Heath', 'H', '1979-04-04'),
(200, 1, 'DiCaprio', 'Leonardo', 'H', '1974-11-11'),
(201, 1, 'Hanks', 'Tom', 'H', '1956-07-09'),
(202, 1, 'Foster', 'Jodie', 'F', '1962-11-19'),
(203, 1, 'Pesci', 'Joe', 'H', '1943-02-09'),
(204, 1, 'Liotta', 'Ray', 'H', '1954-12-18'),
(205, 1, 'Osment', 'Haley Joel', 'H', '1988-04-10'),
(206, 3, 'Law', 'Jude', 'H', '1972-12-29'),
(207, 3, 'Neill', 'Sam', 'H', '1947-09-14'),
(208, 1, 'Dern', 'Laura', 'F', '1967-02-10'),
(209, 3, 'Neeson', 'Liam', 'H', '1952-06-07'),
(210, 3, 'Kingsley', 'Ben', 'H', '1943-12-31'),
(211, 1, 'Robbie', 'Margot', 'F', '1990-07-02'),
(212, 1, 'Hill', 'Jonah', 'H', '1983-12-20'),
(213, 1, 'Ruffalo', 'Mark', 'H', '1967-11-22'),
(214, 1, 'Keitel', 'Harvey', 'H', '1939-05-13'),
(220, 1, 'Gordon-Levitt', 'Joseph', 'H', '1981-02-17'),
(221, 1, 'Page', 'Elliot', 'H', '1987-02-21'),
(222, 3, 'Hardy', 'Tom', 'H', '1977-09-15'),
(223, 2, 'Cotillard', 'Marion', 'F', '1975-09-30'),
(224, 1, 'Duvall', 'Shelley', 'F', '1949-07-07'),
(225, 1, 'Lloyd', 'Danny', 'H', '1972-10-13'),
(226, 1, 'Palmer', 'Betsy', 'F', '1926-11-01'),
(230, 1, 'Curtis', 'Jamie Lee', 'F', '1958-11-22'),
(231, 1, 'Castle', 'Nick', 'H', '1947-09-21'),
(232, 1, 'Lehman', 'Ari', 'H', '1965-05-02'),
(240, 1, 'Englund', 'Robert', 'H', '1947-06-06'),
(241, 1, 'Depp', 'Johnny', 'H', '1963-06-09'),
(242, 1, 'Langenkamp', 'Heather', 'F', '1964-07-17'),
(250, 1, 'Cruise', 'Tom', 'H', '1962-07-03'),
(251, 1, 'Foxx', 'Jamie', 'H', '1967-12-13'),
(252, 3, 'Farrell', 'Colin', 'H', '1976-05-31'),
(253, 5, 'Li', 'Gong', 'F', '1965-12-31'),
(254, 3, 'Harris', 'Naomie', 'F', '1976-09-06'),
(255, 3, 'Hinds', 'Ciarán', 'H', '1953-02-09'),
(260, 1, 'Mortensen', 'Viggo', 'H', '1958-10-20'),
(261, 1, 'Harris', 'Ed', 'H', '1950-11-28'),
(262, 3, 'Watts', 'Naomi', 'F', '1968-09-28'),
(263, 2, 'Cassel', 'Vincent', 'H', '1966-11-23'),
(264, 3, 'Fassbender', 'Michael', 'H', '1977-04-02'),
(265, 3, 'Knightley', 'Keira', 'F', '1985-03-26'),
(270, 3, 'Craig', 'Daniel', 'H', '1968-03-02'),
(400, 2, 'Marceau', 'Sophie', 'F', '1966-11-17'),
(401, 1, 'Mara', 'Rooney', 'F', '1985-04-17'),
(402, 1, 'Madsen', 'Virginia', 'F', '1961-09-11'),
(403, 3, 'Margolyes', 'Miriam', 'F', '1941-05-18'),
(404, 1, 'MacDowell', 'Andie', 'F', '1958-04-21');

-- ---------- 3. FILM --------------------------------------------------
CREATE TABLE film (
    id_film INT NOT NULL PRIMARY KEY,
    titre   VARCHAR(120),
    annee   INT,
    duree   INT,
    pays    VARCHAR(50),
    recette BIGINT
);

INSERT INTO film (id_film, titre, annee, duree, pays, recette) VALUES
(12, 'Le Parrain I', 1972, 175, 'USA', 246000000),
(13, 'Le Parrain II', 1974, 202, 'USA', 48000000),
(14, 'Le Parrain III', 1990, 162, 'USA', 136000000),
(20, 'Heat', 1995, 171, 'USA', 187000000),
(25, 'Impitoyable', 1992, 131, 'USA', 159000000),
(26, 'True Grit', 2010, 110, 'USA', 252000000),
(30, 'Apocalypse Now', 1979, 183, 'USA', 83000000),
(35, 'Batman', 1989, 126, 'USA', 411000000),
(40, 'The Dark Knight', 2008, 152, 'USA', 1006000000),
(50, 'A.I. Intelligence artificielle', 2001, 146, 'USA', 235000000),
(51, 'Jurassic Park', 1993, 127, 'USA', 1046000000),
(52, 'Il faut sauver le soldat Ryan', 1998, 169, 'USA', 482000000),
(53, 'La Liste de Schindler', 1993, 195, 'USA', 322000000),
(60, 'Taxi Driver', 1976, 114, 'USA', 28000000),
(61, 'Les Affranchis', 1990, 146, 'USA', 47000000),
(62, 'Le Loup de Wall Street', 2013, 180, 'USA', 392000000),
(63, 'Shutter Island', 2010, 138, 'USA', 294000000),
(70, 'Inception', 2010, 148, 'USA', 836000000),
(71, 'Shining', 1980, 146, 'USA', 47000000),
(72, 'Vendredi 13', 1980, 95, 'USA', 39000000),
(75, 'Halloween, la nuit des masques', 1978, 91, 'USA', 70000000),
(76, 'Les Griffes de la nuit', 1984, 91, 'USA', 57000000),
(77, 'Collateral', 2004, 120, 'USA', 220000000),
(78, 'Miami Vice : Deux Flics à Miami', 2006, 134, 'USA', 164000000),
(80, 'A History of Violence', 2005, 96, 'USA', 61000000),
(81, 'Les Promesses de l''ombre', 2007, 100, 'UK', 56000000),
(82, 'A Dangerous Method', 2011, 99, 'UK', 30000000),
(99, 'Skyfall', 2012, 143, 'UK', 1108000000);

-- ---------- 4. CASTING (id auto) ------------------------------------
CREATE TABLE casting (
    id_casting   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fk_id_film   INT NOT NULL,
    fk_id_acteur INT NOT NULL,
    fk_id_pays   INT DEFAULT 1,
    role         VARCHAR(100),
    salaire      BIGINT,
    FOREIGN KEY (fk_id_film)   REFERENCES film (id_film),
    FOREIGN KEY (fk_id_acteur) REFERENCES acteur (id_acteur),
    FOREIGN KEY (fk_id_pays)   REFERENCES pays (id_pays)
);

INSERT INTO casting (fk_id_film, fk_id_acteur, fk_id_pays, role, salaire) VALUES
(12, 27, 1, 'Don Vito Corleone', 250000),
(12, 51, 1, 'Michael Corleone', 35000),
(12, 53, 1, 'Santino "Sonny" Corleone', 35000),
(12, 56, 1, 'Tom Hagen', 36000),
(12, 59, 1, 'Kay Adams', 35000),
(13, 60, 4, 'Vito Corleone', 500000),
(13, 51, 1, 'Michael Corleone', 500000),
(13, 59, 1, 'Kay Adams', 150000),
(13, 65, 1, 'Connie Corleone', 50000),
(13, 56, 1, 'Tom Hagen', 200000),
(14, 65, 1, 'Connie Corleone', 1500000),
(14, 72, 1, 'Vincent Mancini-Corleone', 1000000),
(14, 75, 1, 'Mary Corleone', 400000),
(14, 51, 1, 'Don Michael Corleone', 5000000),
(14, 59, 1, 'Kay Adams', 2000000),
(20, 60, 1, 'Neil Mac Cauley', 12000000),
(20, 51, 1, 'Lieutenant Vincent Hanna', 10000000),
(20, 80, 1, 'Chris Shiherlis', 6000000),
(25, 100, 1, 'William Munny', 15000000),
(25, 101, 1, 'Little Bill Daggett', 4000000),
(25, 102, 1, 'Ned Logan', 1000000),
(25, 103, 3, 'English Bob', 800000),
(26, 110, 1, 'Mattie Ross', 150000),
(26, 120, 1, 'Marshal Reuben J. "Rooster" Cogburn', 10000000),
(26, 130, 1, 'LaBoeuf, Texas Ranger', 5000000),
(30, 27, 1, 'Le colonel Walter E. Kurtz', 3500000),
(30, 56, 1, 'le lieutenant-colonel Bill Kilgore', 500000),
(30, 132, 1, 'le capitaine Benjamin L. Willard', 750000),
(35, 135, 1, 'Joker', 6000000),
(40, 140, 1, 'Joker', 3000000),
(50, 205, 1, 'David', 2000000),
(50, 206, 1, 'Gigolo Joe', 5000000),
(51, 207, 1, 'Pr. Alan Grant', 1000000),
(51, 208, 1, 'Pr. Ellie Sattler', 800000),
(51, 135, 1, 'Ian Malcolm', 1500000),
(52, 201, 1, 'Capitaine John H. Miller', 20000000),
(52, 130, 1, 'Soldat James Francis Ryan', 200000),
(53, 209, 2, 'Oskar Schindler', 1000000),
(53, 210, 2, 'Itzhak Stern', 700000),
(60, 60, 1, 'Travis Bickle', 35000),
(60, 202, 1, 'Iris Steensma', 15000),
(60, 214, 1, 'Matthew "Sport" Higgins', 25000),
(61, 204, 1, 'Henry Hill', 500000),
(61, 60, 1, 'James "Jimmy" Conway', 3000000),
(61, 203, 1, 'Tommy DeVito', 400000),
(62, 200, 1, 'Jordan Belfort', 25000000),
(62, 212, 1, 'Donnie Azoff', 60000),
(62, 211, 1, 'Naomi Lapaglia', 300000),
(63, 200, 1, 'Teddy Daniels', 20000000),
(63, 213, 1, 'Chuck Aule', 3000000),
(63, 210, 1, 'Dr. John Cawley', 1000000),
(70, 200, 1, 'Dom Cobb', 20000000),
(70, 220, 1, 'Arthur', 4000000),
(70, 221, 2, 'Ariane', 3000000),
(70, 222, 3, 'Eames', 3000000),
(70, 223, 2, 'Mal Cobb', 5000000),
(71, 135, 1, 'Jack Torrance', 1200000),
(71, 224, 1, 'Wendy Torrance', 200000),
(71, 225, 1, 'Danny Torrance', 10000),
(72, 226, 1, 'Pamela Voorhees', 50000),
(75, 230, 1, 'Laurie Strode', 8000),
(75, 231, 1, 'Michael Myers (The Shape)', 1000),
(76, 240, 1, 'Freddy Krueger', 20000),
(76, 241, 1, 'Glen Lantz', 5000),
(76, 242, 1, 'Nancy Thompson', 15000),
(72, 232, 1, 'Jason Voorhees (Enfant)', 1000),
(77, 250, 1, 'Vincent', 25000000),
(77, 251, 1, 'Max Durocher', 5000000),
(77, 213, 1, 'Fanning', 2000000),
(78, 252, 1, 'James "Sonny" Crockett', 10000000),
(78, 253, 5, 'Isabella', 2000000),
(78, 254, 1, 'Trudy Joplin', 500000),
(78, 255, 1, 'Agent du FBI Fujima', 300000),
(80, 260, 1, 'Tom Stall', 4000000),
(80, 261, 1, 'Carl Fogarty', 2000000),
(80, 262, 1, 'Maria Bello', 1500000),
(81, 260, 3, 'Nikolai Luzhin', 6000000),
(81, 262, 3, 'Anna Khitrova', 3000000),
(81, 263, 3, 'Kirill', 2000000),
(82, 264, 3, 'Carl Jung', 5000000),
(82, 260, 3, 'Sigmund Freud', 3000000),
(82, 265, 3, 'Sabina Spielrein', 4000000),
(82, 263, 3, 'Otto Gross', 1000000),
(99, 270, 3, 'James Bond', 15000000);

-- ---------- 5. GENRE -------------------------------------------------
CREATE TABLE genre (
    id_genre INT NOT NULL PRIMARY KEY,
    titre    VARCHAR(120)
);

INSERT INTO genre (id_genre, titre) VALUES
(5, 'Drame'), (10, 'Action'), (15, 'Policier'), (20, 'Comédie'), (25, 'Western'),
(30, 'Histoire'), (35, 'Romance'), (40, 'Fantastique'), (45, 'SF'), (50, 'Dessin animé'),
(55, 'Thriller'), (60, 'Guerre'), (65, 'Biographie'), (70, 'Horreur');

-- ---------- 6. FILMGENRE (clé primaire composée) --------------------
CREATE TABLE filmgenre (
    fk_id_film  INT NOT NULL,
    fk_id_genre INT NOT NULL,
    PRIMARY KEY (fk_id_film, fk_id_genre),
    FOREIGN KEY (fk_id_film)  REFERENCES film (id_film),
    FOREIGN KEY (fk_id_genre) REFERENCES genre (id_genre)
);

INSERT INTO filmgenre (fk_id_film, fk_id_genre) VALUES
(12, 5), (13, 5), (14, 5), (12, 10), (13, 10), (14, 10), (20, 10), (12, 15), (13, 15), (14, 15), (20, 15),
(26, 25), (26, 5), (30, 5), (30, 10), (30, 30), (35, 40), (35, 10), (40, 40), (40, 10),
(50, 45), (50, 5), (51, 45), (51, 10), (52, 60), (52, 5), (53, 65), (53, 30),
(60, 5), (60, 15), (61, 15), (61, 65), (62, 65), (62, 20), (63, 55), (63, 40),
(70, 45), (70, 55), (71, 70), (71, 5), (72, 70), (75, 70), (76, 70),
(77, 55), (77, 15), (78, 15), (78, 10), (78, 55),
(80, 55), (80, 5), (80, 10), (81, 55), (81, 15), (81, 5), (82, 5), (82, 65),
(99, 10), (99, 55);

-- ---------- 7. REALISATEUR ------------------------------------------
CREATE TABLE realisateur (
    id_realisateur INT NOT NULL PRIMARY KEY,
    fk_id_pays     INT DEFAULT 1,
    nom            VARCHAR(40),
    prenom         VARCHAR(40),
    FOREIGN KEY (fk_id_pays) REFERENCES pays (id_pays)
);

INSERT INTO realisateur (id_realisateur, fk_id_pays, nom, prenom) VALUES
(10, 1, 'Eastwood', 'Clint'),
(12, 1, 'Coppola', 'Francis Ford'),
(15, 1, 'Mann', 'Michael'),
(20, 1, 'Coen', 'Joel'),
(21, 1, 'Coen', 'Ethan'),
(50, 2, 'Robert', 'Timothée'),
(60, 1, 'Burton', 'Tim'),
(61, 3, 'Nolan', 'Christopher'),
(70, 1, 'Spielberg', 'Steven'),
(71, 1, 'Scorsese', 'Martin'),
(80, 3, 'Kubrick', 'Stanley'),
(81, 1, 'Cunningham', 'Sean S.'),
(82, 1, 'Carpenter', 'John'),
(83, 1, 'Craven', 'Wes'),
(85, 8, 'Cronenberg', 'David');

-- ---------- 8. REALISATEURFILM (id auto) ----------------------------
CREATE TABLE realisateurfilm (
    id_realfilm       INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fk_id_film        INT NOT NULL,
    fk_id_realisateur INT NOT NULL,
    FOREIGN KEY (fk_id_film)        REFERENCES film (id_film),
    FOREIGN KEY (fk_id_realisateur) REFERENCES realisateur (id_realisateur)
);

INSERT INTO realisateurfilm (fk_id_film, fk_id_realisateur) VALUES
(12, 12), (13, 12), (14, 12), (20, 15), (25, 10), (26, 20), (26, 21), (30, 12), (35, 60), (40, 61),
(50, 70), (51, 70), (52, 70), (53, 70), (60, 71), (61, 71), (62, 71), (63, 71),
(70, 61), (71, 80), (72, 81), (75, 82), (76, 83), (77, 15), (78, 15),
(80, 85), (81, 85), (82, 85),
(99, 15);

-- ---------- 9. CRITIQUE (id auto) -----------------------------------
CREATE TABLE critique (
    id_critique INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom         VARCHAR(40)
);

INSERT INTO critique (nom) VALUES ('Robert');

-- ---------- 10. REVUE ------------------------------------------------
CREATE TABLE revue (
    fk_id_critique INT NOT NULL,
    fk_id_film     INT NOT NULL,
    note           INT,
    FOREIGN KEY (fk_id_critique) REFERENCES critique (id_critique),
    FOREIGN KEY (fk_id_film)     REFERENCES film (id_film)
);

INSERT INTO revue (fk_id_film, fk_id_critique, note) VALUES
(12, 1, 9), (13, 1, 10), (14, 1, 10), (20, 1, 9), (25, 1, 9), (26, 1, 7), (30, 1, 10), (35, 1, 6), (40, 1, 9),
(50, 1, 8), (51, 1, 9), (60, 1, 10), (61, 1, 10), (63, 1, 8),
(70, 1, 9), (71, 1, 10), (75, 1, 9), (76, 1, 8), (77, 1, 8), (78, 1, 7), (80, 1, 8), (81, 1, 9), (82, 1, 7);

-- ---------- 11. TOURNAGE (id auto) ----------------------------------
CREATE TABLE tournage (
    id_tournage INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fk_id_film  INT NOT NULL,
    fk_id_pays  INT NOT NULL,
    region      VARCHAR(100),
    FOREIGN KEY (fk_id_film) REFERENCES film (id_film),
    FOREIGN KEY (fk_id_pays) REFERENCES pays (id_pays)
);

INSERT INTO tournage (fk_id_film, fk_id_pays, region) VALUES
(99, 6, 'Istanbul'),
(99, 5, 'Shangai'),
(99, 5, 'Pékin'),
(99, 3, 'Highlands'),
(12, 1, 'New York'),
(12, 4, 'Sicile'),
(70, 2, 'Paris'),
(70, 7, 'Tokyo');

-- ---------- Contrôles rapides ---------------------------------------
-- SELECT 'pays' t, COUNT(*) FROM pays UNION ALL SELECT 'acteur', COUNT(*) FROM acteur
-- UNION ALL SELECT 'film', COUNT(*) FROM film UNION ALL SELECT 'casting', COUNT(*) FROM casting;
