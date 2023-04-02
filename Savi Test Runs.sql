SELECT Title
FROM `whateverthefuck-346000.books.Books`
ORDER BY 1;

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Title='Marked';

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Title LIKE '%Vampire%';

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Author1='John Green'
OR Publisher='KT Books';

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Publisher="St. Martin's Griffin"
OR Author2 IS NULL;

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Release_Date >=2010
Order BY 5 DESC;

WITH CTE_TABLE AS (
SELECT a.Title, a.Author1, a.Author2, a.Publisher, a.Release_Date, b.name AS Series_Name
FROM `whateverthefuck-346000.books.Books` a
LEFT JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id)

SELECT CTE_TABLE.Series_Name,
COUNT(*) AS Count, 
MIN(Release_Date) AS First, 
MAX(Release_Date) AS Last
FROM CTE_TABLE
WHERE Series_Name IS NOT NULL
GROUP BY CTE_TABLE.Series_Name;

SELECT *
EXCEPT(Author2)
FROM `whateverthefuck-346000.books.Books`;

SELECT *
EXCEPT(Author2,Series_ID)
FROM `whateverthefuck-346000.books.Books`;

