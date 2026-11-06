-- =====================================================================
--  Jeu de données FOOTBALL — PostgreSQL (rejouable / idempotent)
--  Cours SQL S1 — BTS SIO 1re année
--  Porté depuis "Script TP Football - V3Act.sql" (MySQL).
--  Portages : suppression de "ON DUPLICATE KEY UPDATE ... AS new",
--             AUTO_INCREMENT -> GENERATED ALWAYS AS IDENTITY,
--             clés étrangères explicitées, identifiants en snake_case.
--  Chargement :
--    docker cp football.sql sql_cours_db:/tmp/football.sql
--    docker exec sql_cours_db psql -U prof_sio -d sql_cours -f /tmp/football.sql
-- =====================================================================

-- Jeu isolé dans le schéma "football". Pour l'interroger : SET search_path TO football;
CREATE SCHEMA IF NOT EXISTS football;
SET search_path TO football, public;

DROP TABLE IF EXISTS matches    CASCADE;
DROP TABLE IF EXISTS entraineur CASCADE;
DROP TABLE IF EXISTS joueurs    CASCADE;
DROP TABLE IF EXISTS equipes    CASCADE;
DROP TABLE IF EXISTS pays       CASCADE;
DROP TABLE IF EXISTS continent  CASCADE;

-- ---------- CONTINENT ------------------------------------------------
CREATE TABLE continent (
    id_continent  INT NOT NULL PRIMARY KEY,
    nom_continent VARCHAR(30)
);

INSERT INTO continent (id_continent, nom_continent) VALUES
(1, 'Europe'), (2, 'Amérique du Sud'), (3, 'Afrique'), (4, 'Amérique du Nord'), (5, 'Asie');

-- ---------- PAYS -----------------------------------------------------
CREATE TABLE pays (
    id_pays         INT NOT NULL PRIMARY KEY,
    nom_pays        VARCHAR(30),
    fk_id_continent INT,
    FOREIGN KEY (fk_id_continent) REFERENCES continent (id_continent)
);

INSERT INTO pays (id_pays, nom_pays, fk_id_continent) VALUES
(1, 'Italie', 1), (2, 'Brésil', 2), (3, 'Argentine', 2), (4, 'France', 1),
(5, 'Espagne', 1), (6, 'Portugal', 1), (7, 'Allemagne', 1), (8, 'Belgique', 1),
(9, 'Croatie', 1), (10, 'Pays-Bas', 1), (11, 'Pologne', 1), (12, 'Canada', 4),
(13, 'Egypte', 3), (14, 'Angleterre', 1), (15, 'Norvège', 1), (16, 'Slovénie', 1),
(17, 'Turquie', 1), (18, 'Autriche', 1), (19, 'Arabie Saoudite', 5), (20, 'Qatar', 5),
(21, 'Nigeria', 3), (22, 'Géorgie', 1), (23, 'Écosse', 1);

-- ---------- EQUIPES --------------------------------------------------
CREATE TABLE equipes (
    id_equipe      INT NOT NULL PRIMARY KEY,
    fk_id_pays     INT,
    nom_equipe     VARCHAR(60),
    nom_stade      VARCHAR(60),
    capacite_stade INT,
    FOREIGN KEY (fk_id_pays) REFERENCES pays (id_pays)
);

INSERT INTO equipes (id_equipe, nom_equipe, fk_id_pays, nom_stade, capacite_stade) VALUES
(1, 'Paris Saint Germain', 4, 'Parc des Princes', 48000),
(2, 'FC Barcelone', 5, 'Estadi Olímpic Lluís Companys', 55000),
(3, 'Real Madrid', 5, 'Santiago Bernabéu', 81000),
(4, 'Atlético Madrid', 5, 'Riyadh Air Metropolitano', 68000),
(5, 'Liverpool', 14, 'Anfield', 54000),
(6, 'Bayern Munich', 7, 'Allianz Arena', 75000),
(7, 'Manchester City', 14, 'Etihad Stadium', 53000),
(8, 'Olympique de Marseille', 4, 'Stade Vélodrome', 67394),
(9, 'Atalanta', 1, 'Gewiss Stadium', 21300),
(10, 'Chelsea', 14, 'Stamford Bridge', 40343),
(11, 'Napoli', 1, 'Stadio Diego A. Maradona', 54726),
(12, 'Newcastle United', 14, 'St James'' Park', 52305),
(13, 'Eintracht Frankfurt', 7, 'Deutsche Bank Park', 51500),
(14, 'Galatasaray', 17, 'RAMS Park (Ali Sami Yen)', 52600),
(15, 'Al-Ittihad', 19, 'King Abdullah Sports City', 62345),
(16, 'Al Hilal', 19, 'King Fahd International', 68752),
(17, 'Al-Arabi SC', 20, 'Grand Hamad Stadium', 13000),
(18, 'AS Roma', 1, 'Stadio Olimpico', 70634),
(19, 'Manchester United', 14, 'Old Trafford', 74310);

-- ---------- JOUEURS (id auto) ---------------------------------------
CREATE TABLE joueurs (
    id_joueur      INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fk_id_pays     INT,
    fk_id_equipe   INT,
    nom_joueur     VARCHAR(40),
    prenom_joueur  VARCHAR(40),
    date_naissance DATE,
    salaire        INT,
    FOREIGN KEY (fk_id_pays)   REFERENCES pays (id_pays),
    FOREIGN KEY (fk_id_equipe) REFERENCES equipes (id_equipe)
);

INSERT INTO joueurs (nom_joueur, prenom_joueur, date_naissance, salaire, fk_id_equipe, fk_id_pays) VALUES
('DONNARUMMA', 'Gianluigi', '1999-02-25', 700, 1, 1),
('MARQUINHOS', '', '1994-05-14', 800, 1, 2),
('DEMBELE', 'Ousmane', '1997-05-15', 900, 1, 4),
('DE JONG', 'Frenkie', '1997-05-12', 2000, 2, 10),
('LEWANDOWSKI', 'Robert', '1988-08-21', 2200, 2, 11),
('MODRIC', 'Luka', '1985-09-09', 1500, 3, 9),
('MBAPPE', 'Kylian', '1998-12-20', 6500, 3, 4),
('GRIEZMANN', 'Antoine', '1991-03-21', 1200, 4, 4),
('OBLAK', 'Jan', '1993-01-07', 900, 4, 16),
('ALISSON', 'Becker', '1992-10-02', 800, 5, 2),
('SALAH', 'Mohamed', '1992-06-15', 2500, 5, 13),
('NEUER', 'Manuel', '1986-03-27', 1000, 6, 7),
('KANE', 'Harry', '1993-07-28', 3000, 6, 14),
('HAALAND', 'Erling', '2000-07-21', 3000, 7, 15),
('KANTE', 'N''Golo', '1991-03-29', 3000, 15, 4),
('VERRATTI', 'Marco', '1992-11-05', 2500, 17, 1),
('NEYMAR', 'Junior', '1992-02-05', 12000, 16, 2),
('VINICIUS', 'Junior', '2000-07-12', 5000, 3, 2),
('PAREDES', 'Leandro', '1994-06-29', 1500, 18, 3),
('TORRES', 'Ferran', '2000-02-29', 1800, 2, 5),
('GAVI', 'Pablo', '2004-08-05', 2100, 2, 5),
('PEDRI', 'Gonzalez', '2002-11-25', 2800, 2, 5),
('ALABA', 'David', '1992-06-24', 5000, 3, 18),
('RUDIGER', 'Antonio', '1993-03-03', 3500, 3, 7),
('GREALISH', 'Jack', '1995-09-10', 4000, 7, 14),
('WALKER', 'Kyle', '1990-05-28', 3000, 7, 14),
('BENZEMA', 'Karim', '1987-12-19', 10000, 15, 4),
('LUKAKU', 'Romelu', '1993-05-13', 3000, 18, 8),
('AZPILICUETA', 'César', '1989-08-28', 2500, 4, 5),
('FERNANDES', 'Bruno', '1994-02-08', 5500, 19, 6),
('SANCHO', 'Jadon', '2000-03-25', 3200, 19, 14),
('VAN DIJK', 'Virgil', '1991-07-08', 4200, 5, 10),
('KIMMICH', 'Joshua', '1995-02-08', 4500, 6, 7),
('BERNARDO', 'Silva', '1994-08-10', 4800, 7, 6),
('MARTINEZ', 'Lautaro', '1997-08-22', 3600, 9, 3),
('OSIMHEN', 'Victor', '1998-12-29', 4200, 11, 21),
('BELLINGHAM', 'Jude', '2003-06-29', 5000, 3, 14),
('RODRI', '', '1996-06-22', 4800, 7, 5),
('ROBERTSON', 'Andy', '1994-03-11', 3000, 5, 23),
('FODEN', 'Phil', '2000-05-28', 3500, 7, 14),
('MUSIALA', 'Jamal', '2003-02-26', 3800, 6, 7),
('DE LIGT', 'Matthijs', '1999-08-12', 3800, 6, 10),
('KVARATSKHELIA', 'Khvicha', '2001-02-12', 3600, 11, 22),
('REUS', 'Marco', '1989-05-31', 2800, 13, 7);

-- ---------- ENTRAINEUR (id auto) ------------------------------------
CREATE TABLE entraineur (
    id_entraineur     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fk_id_pays        INT,
    fk_id_equipe      INT,
    nom_entraineur    VARCHAR(40),
    prenom_entraineur VARCHAR(40),
    FOREIGN KEY (fk_id_pays)   REFERENCES pays (id_pays),
    FOREIGN KEY (fk_id_equipe) REFERENCES equipes (id_equipe)
);

INSERT INTO entraineur (fk_id_pays, fk_id_equipe, nom_entraineur, prenom_entraineur) VALUES
(5, 1, 'Enrique', 'Luis'),
(7, 2, 'Flick', 'Hansi'),
(5, 3, 'Alonso', 'Xabi'),
(3, 4, 'Simeone', 'Diego'),
(10, 5, 'Slot', 'Arne'),
(8, 6, 'Kompany', 'Vincent'),
(5, 7, 'Guardiola', 'Pep'),
(4, 8, '—', ''),
(1, 9, 'Gasperini', 'Gian Piero'),
(14, 10, 'Maresca', 'Enzo'),
(1, 11, '—', ''),
(14, 12, 'Howe', 'Eddie'),
(7, 13, '—', ''),
(17, 14, 'Okan', 'Buruk'),
(19, 15, '—', ''),
(19, 16, '—', ''),
(20, 17, '—', ''),
(1, 18, 'De Rossi', 'Daniele'),
(14, 19, 'Ten Hag', 'Erik');

-- ---------- MATCHES (id auto) ---------------------------------------
CREATE TABLE matches (
    id_match             INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fk_id_equipe_local   INT,
    fk_id_equipe_visite  INT,
    date_match           DATE,
    score_equipe_local   INT,
    score_equipe_visite  INT,
    FOREIGN KEY (fk_id_equipe_local)  REFERENCES equipes (id_equipe),
    FOREIGN KEY (fk_id_equipe_visite) REFERENCES equipes (id_equipe)
);

INSERT INTO matches (fk_id_equipe_local, fk_id_equipe_visite, date_match, score_equipe_local, score_equipe_visite) VALUES
(3, 8, '2025-09-16', 2, 1),
(1, 9, '2025-09-17', 4, 0),
(6, 10, '2025-09-17', 3, 1),
(5, 4, '2025-09-17', 3, 2),
(7, 11, '2025-09-18', 2, 0),
(12, 2, '2025-09-18', 1, 2),
(4, 13, '2025-09-30', 5, 1),
(14, 5, '2025-09-30', 1, 0),
(6, 1, '2025-09-20', 2, 1),
(7, 9, '2025-09-21', 4, 0),
(11, 6, '2025-09-27', 1, 1),
(1, 8, '2025-10-01', 2, 1),
(16, 15, '2025-10-02', 2, 2),
(18, 11, '2025-10-03', 2, 0),
(19, 10, '2025-10-04', 1, 1),
(15, 10, '2025-09-22', 2, 2),
(6, 3, '2025-09-23', 3, 0),
(17, 5, '2025-09-24', 1, 2),
(3, 4, '2025-09-25', 4, 0),
(2, 1, '2025-09-26', 2, 1),
(14, 10, '2025-09-28', 2, 0),
(17, 3, '2025-09-29', 2, 3),
(3, 10, '2025-10-05', 2, 0),
(5, 12, '2025-10-06', 2, 2),
(2, 14, '2025-10-07', 3, 1),
(7, 6, '2025-10-08', 1, 1),
(11, 1, '2025-10-09', 0, 1),
(4, 2, '2025-10-10', 2, 2),
(13, 5, '2025-10-11', 1, 1),
(8, 1, '2025-10-12', 0, 2),
(18, 3, '2025-10-13', 1, 2),
(15, 16, '2025-10-14', 1, 3);
