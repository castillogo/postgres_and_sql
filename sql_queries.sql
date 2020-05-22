-- 1. Selecting Data
SELECT * FROM countries LIMIT 5;
--pandas > df.head()

-- 2. Select certain columns
SELECT country, population FROM countries LIMIT 5;
--pandas > df[['country', 'population']].head(5)

--3. Select the distinct / unique continents
SELECT DISTINCT continent FROM countries;
--pandas > df['continent'].unique()

--4. Sorting data
SELECT country, population FROM countries ORDER BY population DESC;
--pandas > df[['country', 'population']].sort_values(by='population', ascending=False)

--5. Filtering data
SELECT * FROM countries WHERE population > 200000000;
--pandas > df[df['population'] > 200000000]

--6. LIKE
SELECT * FROM countries WHERE country LIKE 'I%';
--pandas > df[df['country'].str.startswith('I')]

--7. Multiple Conditions
SELECT * FROM countries WHERE country LIKE 'I%'
AND population > 300000000;
--pandas > df[(df['country'].str.startswith('I')) & (df['population'] ...)

--8. Grouping and Aggregating
--What's the average birth rate by continent?
SELECT continent, AVG(fertility) AS avg_fertility FROM countries
GROUP BY continent;
--pandas > df.groupby('continent')['fertility'].mean()

--9. Return the avg fertility by continent only if greater than 2
-- HAVING --> post-filtering after aggregation.
SELECT continent, AVG(fertility) AS avg_fertility
FROM countries GROUP BY continent HAVING AVG(fertility) > 2;

--10. Same thing but in multiple steps (SUB-Query)
SELECT * FROM
(SELECT continent, AVG(fertility) AS avg_fertility
FROM countries GROUP BY continent) AS subquery
WHERE avg_fertility > 2;




-- CHALLENGE: Return the largest and smallest county by number of inhabitants.

-- Solution 1
SELECT country FROM countries
WHERE country =
(SELECT country FROM countries ORDER BY population DESC LIMIT 1)
OR country =
(SELECT country FROM countries ORDER BY population LIMIT 1);

-- Solution 2
SELECT country FROM countries
WHERE population =
(SELECT MAX(population) FROM countries)
OR population =
(SELECT MIN(population) FROM countries);
