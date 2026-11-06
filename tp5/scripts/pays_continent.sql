-- =====================================================================
--  Jeu de données PAYS / CONTINENT — PostgreSQL (rejouable / idempotent)
--  Cours SQL S1 — BTS SIO 1re année
--  Exemple simple à deux tables pour illustrer une jointure de base.
--  Porté depuis "Exemple jointures Pays & Continent.sql" (MySQL).
--  ATTENTION : ce jeu est indépendant du jeu Football (mêmes noms de
--  tables volontairement) ; il ne faut charger qu'un seul jeu à la fois
--  dans un même schéma, ou utiliser une base/schema séparé.
-- =====================================================================

-- Jeu isolé dans le schéma "geo". Pour l'interroger : SET search_path TO geo;
CREATE SCHEMA IF NOT EXISTS geo;
SET search_path TO geo, public;

DROP TABLE IF EXISTS pays      CASCADE;
DROP TABLE IF EXISTS continent CASCADE;

CREATE TABLE continent (
    id_continent  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_continent VARCHAR(100) NOT NULL
);

-- 1 Afrique, 2 Europe, 3 Asie
INSERT INTO continent (nom_continent) VALUES ('Afrique'), ('Europe'), ('Asie');

CREATE TABLE pays (
    id_pays      INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_pays     VARCHAR(100) NOT NULL,
    population   INT,
    superficie   NUMERIC(12,2),
    id_continent INT,
    FOREIGN KEY (id_continent) REFERENCES continent (id_continent)
);

INSERT INTO pays (nom_pays, population, superficie, id_continent) VALUES
('France', 67000000, 551695, 2),
('Nigeria', 206000000, 923768, 1),
('Japon', 125800000, 377975, 3),
('Allemagne', 83445000, 357592, 2);
