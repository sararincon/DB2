DROP DATABASE peliculas;
CREATE DATABASE peliculas;

\c peliculas;

CREATE TABLE peliculas(
    id SERIAL PRIMARY KEY,
    Pelicula VARCHAR(255),
    Año_estreno INT,
    Director VARCHAR(255)
);

-- copy
\copy peliculas FROM 'peliculas.csv' csv header;

\! echo *************************************
\! echo -
\! echo Copiando data desde peliculas.csv a tabla peliculas
\! echo -
\! echo *************************************

CREATE TABLE reparto(
    id_reparto INT,
    actor VARCHAR(255),
    FOREIGN KEY (id_reparto)
    REFERENCES peliculas(id)
);

-- copy
\copy reparto FROM 'reparto.csv' csv;

\! echo *************************************
\! echo -
\! echo Copiando data desde reparto.csv a tabla reparto
\! echo -
\! echo *************************************

SELECT id FROM peliculas WHERE Pelicula='Titanic';

SELECT actor FROM reparto WHERE id_reparto=2;

SELECT COUNT(actor) FROM reparto WHERE actor='Harrison Ford';

SELECT Pelicula, Año_estreno FROM peliculas WHERE Año_estreno BETWEEN 1990 AND 1999
ORDER BY Año_estreno ASC;

SELECT Pelicula,LENGTH(Pelicula) AS "longitud_titulo" FROM peliculas;

--
-- SELECT Pelicula,LENGTH(Pelicula) AS "longitud_titulo" FROM peliculas ORDER BY "longitud_titulo" DESC LIMIT 1;
--

SELECT MAX(LENGTH(Pelicula)) AS "Titulo mas largo" FROM peliculas;

