# 05 Employees
SELECT     first_name, 
			middle_name,
			last_name,
			salary,
			hire_date
 FROM employees ORDER BY hire_date DESC;
 
 #06 Products with old pictures
 
 SELECT `name` AS product_name, 
	price, 
	best_before, 
	CONCAT(SUBSTRING(`description`, 1, 10), '...') AS short_description, 
	url 
 FROM products AS p
 JOIN pictures AS ps ON p.picture_id = ps.id
 WHERE char_length(`description`) > 100
 AND YEAR(ps.added_on) < 2019
 AND p.price > 20
 ORDER BY p.price DESC;
 
 #07. Counts of products in stores

SELECT ANY_VALUE(s.`name`) AS `name`, count(p.id) AS product_count, ROUND(AVG(p.price), 2) AS `avg` FROM stores AS s
LEFT JOIN products_stores AS ps ON s.id = ps.store_id
LEFT JOIN products AS p ON ps.product_id = p.id
GROUP BY s.`name`
ORDER BY product_count DESC, `avg` DESC, s.id ASC;

SELECT @@sql_mode;

SET sql_mode=only_full_group_by;

#08. Specific employee

SELECT CONCAT(e.first_name, ' ', last_name) AS Full_name,
	s.`name`  AS Store_name, 
	a.`name` AS address, 
	e.salary 
FROM employees AS e
JOIN stores AS s ON e.store_id = s.id
JOIN addresses AS a ON s.address_id = a.id
WHERE e.salary < 4000
	AND a.`name` LIKE '%5%'
	AND char_length(s.`name`) > 8
    AND RIGHT(e.last_name, 1) = 'n'; 		# e.last_name LIKE '%n'; 
    
    
    
#09. Find all information of stores

SELECT REVERSE(s.`name`), 
		CONCAT(UPPER(t.name), '-', a.`name`) AS full_address,
        (SELECT COUNT(e.id) FROM employees AS e WHERE e.store_id = s.id) AS employees_count
FROM stores AS s
JOIN addresses AS a ON s.address_id = a.id
JOIN towns t ON t.id = a.town_id
WHERE(SELECT COUNT(e.id) FROM employees AS e WHERE e.store_id = s.id) > 0
ORDER BY full_address; 

#09.1 Find all information of stores

SELECT REVERSE(s.`name`), 
		CONCAT(UPPER(t.name), '-', a.`name`) AS full_address,
        COUNT(e.id) AS employees_count
FROM stores AS s
JOIN addresses AS a ON s.address_id = a.id
JOIN towns t ON t.id = a.town_id
JOIN employees AS e ON e.store_id = s.id
GROUP BY s.id
HAVING employees_count > 0
ORDER BY full_address;


  