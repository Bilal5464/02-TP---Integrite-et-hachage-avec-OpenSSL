-- =====================================================================
--  Jeu de données ÉLÈVES / NOTES — PostgreSQL (rejouable / idempotent)
--  Cours SQL S1 — BTS SIO 1re année
--  Porté depuis "Creation tables Eleves et Notes.sql" (MySQL).
--  Portages : AUTO_INCREMENT -> IDENTITY, FLOAT -> NUMERIC, LONGTEXT -> TEXT.
-- =====================================================================

-- Jeu isolé dans le schéma "ecole". Pour l'interroger : SET search_path TO ecole;
CREATE SCHEMA IF NOT EXISTS ecole;
SET search_path TO ecole, public;

DROP TABLE IF EXISTS notes  CASCADE;
DROP TABLE IF EXISTS eleves CASCADE;

CREATE TABLE eleves (
    id     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom    VARCHAR(100),
    prenom VARCHAR(100)
);

INSERT INTO eleves (nom, prenom) VALUES
('Abbas', 'Franck'),
('Barriaud', 'Noemie'),
('Bendjebbour', 'Ines'),
('Bangoura', 'Fode'),
('Lopes', 'Loretta'),
('Dupond', 'Paul');

CREATE TABLE notes (
    id           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    note         NUMERIC(4,2),
    coeff        NUMERIC(3,1),
    matiere      VARCHAR(30),
    appreciation TEXT,
    date_eval    DATE
);

INSERT INTO notes (note, coeff, matiere, appreciation, date_eval) VALUES
(12, 1, 'Maths', 'Ensemble un peu juste', '2022-09-14'),
(18, 2, 'Francais', 'Excellent !', '2022-10-12'),
(16, 1, 'Histoire Géo', 'Très bien, continuez', '2022-10-23'),
(14, 1, 'Maths', 'Assez satisfaisant', '2022-09-14'),
(11, 2, 'Francais', 'Trop de hors sujet', '2022-10-12'),
(14, 2, 'Histoire Géo', 'Bien, soignez l''orthographe', '2022-10-23');
