--Total adjusted box office by year--
--Deep dive into 2009--

SELECT year,
ROUND(SUM(adjusted)/1000000000,2) AS gross
FROM `savis-final-project.Final_Project_Movie_Data.Top Ten Movies 1975-2014`
GROUP BY year
ORDER BY gross DESC;

SELECT title, adjusted/1000000
FROM `savis-final-project.Final_Project_Movie_Data.Top Ten Movies 1975-2014`
WHERE year = 2009
ORDER BY adjusted DESC;

--Total box office by studio--
--Clean up studio by order of precedence--

SELECT
CASE WHEN studio LIKE '%LucasFilm%' THEN 'LucasFilm'
     WHEN studio LIKE '%Marvel%' THEN 'Marvel'
     WHEN studio LIKE '%MGM%' OR studio LIKE '%Metro-%' THEN 'MGM'
     WHEN studio LIKE '%Disney%' OR studio LIKE '%Buena Vista%' THEN 'Disney'
     WHEN studio LIKE '%Universal%' THEN 'Universal'
     WHEN studio LIKE '%Warner%' THEN 'Warner Bros'
     WHEN studio LIKE '%DreamWorks%' THEN 'DreamWorks'
     WHEN studio LIKE '%Paramount%' THEN 'Paramount'
     WHEN studio LIKE '%Columbia%' THEN 'Columbia'
     WHEN studio LIKE '%20th Century%' OR studio LIKE '%Fox%' THEN '20th Century Fox'     
     WHEN studio LIKE '%Touchstone%' THEN 'Touchstone'
     WHEN studio LIKE '%TriStar%' THEN 'TriStar'
     WHEN studio LIKE '%Lionsgate%' THEN 'Lionsgate'
     WHEN studio LIKE '%Summit%' THEN 'Summit'
     WHEN studio LIKE '%United Artists%' THEN 'United Artists'
     ELSE studio
END AS studio_clean,
ROUND(SUM(adjusted)/1000000000,2) AS gross
FROM `savis-final-project.Final_Project_Movie_Data.Top Ten Movies 1975-2014`
GROUP BY studio_clean
ORDER BY gross DESC;

--Gap between audience score and critic score by genre--

SELECT title, imdb_rating, rt_score, rt_audience_score, rank_in_year, genre_1
FROM `savis-final-project.Final_Project_Movie_Data.Top Ten Movies 1975-2014`
ORDER BY imdb_rating DESC, rank_in_year;

--Compare Top 3 and Bottom 3 by Year--

SELECT title, imdb_rating, adjusted/1000000, rank_in_year, year
FROM `savis-final-project.Final_Project_Movie_Data.Top Ten Movies 1975-2014`
WHERE rank_in_year <= 3 OR rank_in_year >= 8
ORDER BY rank_in_year, year;
