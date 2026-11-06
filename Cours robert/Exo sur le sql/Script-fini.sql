SET search_path TO cinema;

SELECT f.titre, f.duree
FROM film f
WHERE f.duree > 180
ORDER BY f.duree DESC;

SELECT f.titre, f.annee
FROM film f
WHERE f.annee BETWEEN 1990 AND 1999
ORDER BY f.annee, f.titre;

-- Q3
SELECT f.titre, f.annee
FROM film f
WHERE f.titre LIKE 'The %'
ORDER BY f.titre;

-- Q4
SELECT f.titre, f.recette, f.duree
FROM film f
WHERE f.recette BETWEEN 200000000 AND 500000000
  AND f.duree < 130
ORDER BY f.recette DESC;

-- Q5
SELECT f.titre, f.pays, f.annee
FROM film f
WHERE f.pays = 'UK' OR f.annee < 1980
ORDER BY f.pays, f.annee;

-- Q6
SELECT f.titre, f.annee
FROM film f
WHERE f.titre ILIKE '%parrain%'
ORDER BY f.annee;

-- Q7
SELECT f.titre, f.duree
FROM film f
ORDER BY f.duree ASC, f.titre ASC
LIMIT 3;