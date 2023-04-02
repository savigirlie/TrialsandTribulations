-- ''Everywhere and Every Time--
SELECT *
FROM `whateverthefuck-346000.books.Books`;
--Small database look up--
--(;) to be used at the end of every query--

SELECT  Distinct Author1
FROM `whateverthefuck-346000.books.Books`;
--Only first author once aka no copies in the same columns--

SELECT  Distinct Author1
FROM `whateverthefuck-346000.books.Books`
ORDER BY Author1;
--Alphabetical order by first name on author1--
--WE WILL LEARN HOW TO LAST NAME LATER--

SELECT  Distinct Author1
FROM `whateverthefuck-346000.books.Books`
ORDER BY 1;
--Used when there are multiple columns--
--Actually useful later--
--1 is referring to collum--
--ORDER BY can be added to with commas--

SELECT  Distinct Author1
FROM `whateverthefuck-346000.books.Books`
ORDER BY 1 DESC;
--Backwards alphabetic order--

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Author1='P.C. Cast'; 
--Finding specifics in a column--

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Author1='P.C. Cast'
AND Author2 IS NULL;
--AND is used for other shit in the WHERE making shit more specific--
--AND can go across columns--
--AND is second liner
--IS NULL can include or exludle fields with no data--
--Blank and Null are two different things--
-- Null=Null Null does NOT equal Blank--
--Does not equal !=--

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Title LIKE '%Blood%';
--LIKE is used to find one kinda like the other--
--% is a wildcard so it will include things before and after the main word--
--LIKE is used as =--

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Title LIKE '%Blood';
--% are IMPORTANTE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--
--dependong on where the % is it tells you when things can come before or after--
--% before means anything can come before--
--% after means anything can come after--
--NO % before means NOTHING can come before--
--NO % after means NOTHING can come after--

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Publisher='Penguin'
OR Publisher='Hyperion';
--OR is s second liner and uses =--
--OR can go across coumns--

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Author2 IS NOT NULL;
--IS NOT NULL brings everything in column that is not Null--

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Title NOT LIKE '%Vampire%'
AND Title NOT LIKE '%Blood%';
--when someone says no Blah or Blah use AND--

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Publisher IN ('Penguin','Hyperion');
--IN () is used when you need multiple things from one field--

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Publisher NOT IN ('Penguin','Hyperion');
--NOT IN() is used to exclude multiple things from one field--

SELECT *
FROM `whateverthefuck-346000.books.Books`
WHERE Release_Date >=2010;
--Integer (numbers) use < > = != or any combination thereof--
--Integers can use IN, NOT IN, OR, AND--
--Integers can NOT use LIKE--

SELECT *
FROM `whateverthefuck-346000.books.Books` a
INNER JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id;
--Give table nickname by placing a letter(s) next to it--
--Can also use numbers but cant start with numbers--
--Join is looking at multiple tables at once--
--ON has to be used with Join--
--ON refers to the key being used--
--Keys are fields you match on--
--Keys do NOT have to be ID fields--
--This is an example of an Inner Join--
--Inner Join only pools info matching both tables--
--This is an example of Many to One--

SELECT *
FROM `whateverthefuck-346000.books.Books` a
LEFT JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id;
--LEFT JOIN shows all of the table on the left and matching on the right--
--If something on the right table doesn't match it doesn't show--
--Many to One--

SELECT *
FROM `whateverthefuck-346000.books.Books` a
RIGHT JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id;
--RIGHT JOIN shows all of the table on the right and matching on the left--
--If something on the left table doesn't match it doesn't show--
--Still follows pattern from ON--
--This is an example of One to Many--

SELECT *
FROM `whateverthefuck-346000.books.Books` a
FULL OUTER JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id;
--FULL OUTER JOIN shows literally everything--
--Many to One--
--Very rarely used--

SELECT a.Title, a.Author1, a.Author2, a.Publisher, a.Release_Date, b.name AS Series_Name
FROM `whateverthefuck-346000.books.Books` a
LEFT JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id;
--a.and b. refer to nicknames of the tables--
--AS is used to change something about a field--
--Nicknames can NOT be used in WHERE, ORDER BY,GROUP BY--

SELECT a.* EXCEPT(Series_ID), b.name AS Series_Name
FROM `whateverthefuck-346000.books.Books` a
LEFT JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id;
--EXCEPT always goes after *--
--EXCEPT can have multiple columns--
--Can be used instead of listing all columns--
--Uusally a personal preference--

WITH CTE_TABLE AS (
SELECT a.Title, a.Author1, a.Author2, a.Publisher, a.Release_Date, b.name AS Series_Name
FROM `whateverthefuck-346000.books.Books` a
FULL OUTER JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id)

SELECT *
FROM CTE_TABLE;
--WITH before SELECT creates a temporary table=CTE--
--WITH(...) has to come before every new query using that table--
--SELECT * now refers to the CTE created--

WITH CTE_TABLE AS (
SELECT a.Title, a.Author1, a.Author2, a.Publisher, a.Release_Date, b.name AS Series_Name
FROM `whateverthefuck-346000.books.Books` a
LEFT JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id)

SELECT Series_Name,
COUNT(*) AS Count
FROM CTE_TABLE
GROUP BY Series_Name;
--COUNT counts the number of rows in a field--
--COUNT(*)counts everything--
--GROUP BY needs to match main SELECT statement--
--GROUP BY has to be used with COUNT MAX MIN SUM AVERAGE--
--GROUP BY takes COUNT MAX ect into one clean column--
--COUNT MAX ect can have column renamed using AS--

WITH CTE_TABLE AS (
SELECT a.Title, a.Author1, a.Author2, a.Publisher, a.Release_Date, b.name AS Series_Name
FROM `whateverthefuck-346000.books.Books` a
INNER JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id)

SELECT Series_Name,
COUNT(*) AS Count
FROM CTE_TABLE
GROUP BY Series_Name
HAVING COUNT (*)>=5;
--HAVING creates conditions for COUNT MAX ect--
--HAVING has to match at least one of the COUNT MAX ect--

WITH CTE_TABLE AS (
SELECT a.Title, a.Author1, a.Author2, a.Publisher, a.Release_Date, b.name AS Series_Name
FROM `whateverthefuck-346000.books.Books` a
LEFT JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id)

SELECT Series_Name,
COUNT(*)
FROM CTE_TABLE
GROUP BY Series_Name;
--GROUP BY is required if using math--
--GROUP BY ... has to match SELECT ...--
--Groups COUNT by specific field--
--There x amount of a.rows in b. rows--

WITH CTE_TABLE AS (
SELECT a.Title, a.Author1, a.Author2, a.Publisher, a.Release_Date, b.name AS Series_Name
FROM `whateverthefuck-346000.books.Books` a
LEFT JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id)

SELECT Series_Name,
COUNT(*), 
MIN(Release_Date), MAX(Release_Date)
FROM CTE_TABLE
WHERE Series_Name IS NOT NULL
GROUP BY CTE_TABLE.Series_Name;
--WHERE goes between FROM and GROUP BY--
--MIN field is the smallest for that field--
--MAX field is the largest for that field--

SELECT *
FROM (SELECT a.Title, a.Author1, a.Author2, a.Publisher, a.Release_Date, b.name AS Series_Name
FROM `whateverthefuck-346000.books.Books` a
LEFT JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id);
--Known as sub query--
--Uses FROM to create--
--Interchangable with CTE--
--Needlessly confusing--
--Works as standard FROM--
--Just don't use it--

SELECT a.Title, a.Author1, a.Author2, a.Publisher, a.Release_Date, b.name AS Series_Name
FROM `whateverthefuck-346000.books.Books` a
LEFT JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id
WHERE b.name IS NULL;
--Apparently the worlds hardest query--
--Most likely uses query for interview tests--

CREATE OR REPLACE TABLE `whateverthefuck-346000.books.Savis Book Collection` AS 
SELECT a.Title, a.Author1, a.Author2, a.Publisher, a.Release_Date, b.name AS Series_Name
FROM `whateverthefuck-346000.books.Books` a
LEFT JOIN `whateverthefuck-346000.books.Book Series` b ON a.Series_ID=b.id;
--CREATE OR REPLACE TABLE creates or replaces a real whole new table instead of uploading one--
--Does not need a join--
--Permanent verison of CTE--
--Use SELECT instead of JOIN if adding all new information--

INSERT INTO `whateverthefuck-346000.books.Book Series`
SELECT 8,'Percy Jackson';
--INSERT INTO is used to manipulate a table--
--SELECT is what you wish to put into the the table--
--Write what you want SELECT in order of columns--

INSERT INTO `whateverthefuck-346000.books.Books`
SELECT 'The Lightning Thief','Rick Riordan',null,'Disney-Hyperion',2005,8;
--Example of very many columns--

DELETE FROM `whateverthefuck-346000.books.Books`
WHERE Series_ID IS NULL;
--Deletes what you don't want/need from table--
--Just uses WHERE--

DELETE FROM `whateverthefuck-346000.books.Books` a
WHERE EXISTS (SELECT * FROM `whateverthefuck-346000.books.Book Series` b WHERE a.Series_ID=b.id);
--Where WHERE takes information from two related tables and deletes information--
--Has to be with a DELETE FROM--
--Uses SELECT * FROM to get the information from the second table--

DELETE FROM `whateverthefuck-346000.books.Books` a
WHERE NOT EXISTS (SELECT * FROM `whateverthefuck-346000.books.Book Series` b WHERE a.Series_ID=b.id);
--Deletes information that isn't related--

WITH CTE_Order AS (
SELECT *,
ROW_NUMBER () OVER (PARTITION BY Author1,Author2 ORDER BY Release_Date DESC) AS Release_Order
FROM `whateverthefuck-346000.books.Books`)

SELECT *
FROM CTE_Order
WHERE Release_Order=1;
--It works backwards--
--PARTITION BY creates the sections for the ROW_NUMBERS--
--ROW_NUMBERS are unique--
--It must be written as shown--
--Can be written into the CTE or on its own--
--Used for sorting in a very specific manner--

with cte_latest as (
select author1, author2, max(release_date) as latest_release
from `whateverthefuck-346000.books.Books`
group by author1, author2)

select a.*
from `whateverthefuck-346000.books.Books` a
join cte_latest b on a.author1=b.author1 and a.author2=b.author2 and a.release_date = b.latest_release













 