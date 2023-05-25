-- How many rows are in the data_analyst_jobs table?

SELECT COUNT(*)
FROM data_analyst_jobs;

-- Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
-- XTO Land Data Analyst

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
-- 21 in Tennessee
-- 27 in Tennessee or Kentucky

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location LIKE 'TN' OR location LIKE 'KY';

-- How many postings in Tennessee have a star rating above 4?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location LIKE 'TN' AND star_rating > 4;

-- How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- Show the average star rating for companies in each state. The output should show the state as 'state' and the average rating for the state as 'avg-rating'. Which state shows the highest average rating?
-- NE has the highest average star rating.

Select location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT null 
	AND star_rating IS NOT null 
	AND location != 'USA' 
	AND location != 'DC'
	AND location != 'REMOTE'
GROUP BY location
ORDER BY AVG(star_rating) DESC;

-- Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT COUNT(DISTINCT(title)) AS unique_jobs
FROM data_analyst_jobs;

-- How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT(title)) AS unique_jobs_cali
FROM data_analyst_jobs
WHERE location LIKE 'CA';

-- Find the name of each company and its average star rating for all companies that have more than 5000 reviews all locations. How many companies are there with more than 5000 reviews across all locations?
-- There are 40 companys with more than 5000 reviews without nulls.

SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT null
GROUP BY company
ORDER BY AVG(star_rating) DESC;

-- Add te code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
-- Unilever, General Motors, Nike, American Express, Microsoft, And Kaiser Permanente are tied for the highest star rating with a rating of 4.1999

-- Find all the job titles that contain the word 'Analyst'. How many different job titles are there?
-- There are 1669 job titles that contain the word 'Analyst'. Only 774 unique job titles with the word 'Analyst'.

SELECT DISTINCT(title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

-- How many different job titles do not contain either the word 'Analyst' or the word 'Analytics'? What word do these positions have n common?
-- There are 4 job titles that do not contain 'Analyst' or 'Analytics'. They all contain the word 'Tableau'.

SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';

-- Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
--	Disregard any postings where the domain is NULL.
--	Order your results so that the domain with the greatest number of 'hard to fill' jobs is at the top.
-- Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

SELECT domain,
	COUNT(CASE WHEN days_since_posting > 21 THEN title END) AS hard_to_fill
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%' AND domain IS NOT null
GROUP BY domain
ORDER BY hard_to_fill DESC;








