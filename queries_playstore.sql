-- Query 1
SELECT * FROM analytics WHERE id = 1880;

-- Query 2
SELECT id, app_name FROM analytics WHERE last_updated = '2018-01-08';

-- Query 3
SELECT category, COUNT(id) FROM analytics GROUP BY category;

-- Query 4
SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;

-- Query 5
SELECT app_name FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT
  1;

-- Query 6
SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY
  AVG(rating) DESC;

-- Query 7
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price
  DESC LIMIT 1;

-- Query 8
SELECT app_name FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL
  ORDER BY rating DESC;

-- Query 9
SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 10000;

-- Query 10
SELECT app_name FROM analytics WHERE price BETWEEN 0.1 AND 1 ORDER BY reviews
  DESC LIMIT 10;

-- Query 11
SELECT app_name FROM analytics WHERE last_updated = (
  SELECT MIN(last_updated) FROM analytics
);

-- Query 12
SELECT app_name FROM analytics WHERE price = (
  SELECT MAX(price) FROM analytics
);

-- Query 13
SELECT SUM(reviews) FROM analytics;

-- Query 14
SELECT category FROM analytics GROUP BY category HAVING COUNT(app_name) > 300;

-- Query 15
SELECT app_name, reviews, min_installs, min_installs / reviews AS proportion
  FROM analytics WHERE min_installs / reviews = (
    SELECT MAX(min_installs / reviews) FROM analytics
  );

-- Query FS1
SELECT app_name, rating FROM analytics x WHERE min_installs >= 50000 AND rating
  >= ALL(SELECT rating FROM analytics y WHERE min_installs >= 50000 AND
  x.category = y.category);

-- Query FS2
SELECT app_name FROM analytics WHERE app_name ILIKE 'facebook';

-- Query FS3
SELECT app_name FROM analytics WHERE 1 = array_length(genres, 1);

-- Query FS4
SELECT app_name FROM analytics WHERE 1 < array_length(genres, 1);

-- Query FS5
SELECT app_name FROM analytics WHERE genres @> ARRAY['Education'];