#02 Insert

INSERT INTO products_stores (product_id, store_id)
(SELECT p.id, 1 FROM products AS p WHERE p.id NOT IN (SELECT product_id FROM products_stores));

#03 UPDATE

UPDATE employees AS e
SET  e.manager_id = 3, e.salary = e.salary - 500
WHERE YEAR(e.hire_date) >= 2003 
AND e.store_id NOT IN (SELECT `id` FROM stores AS s WHERE s.`name` = 'Cardguard' OR s.`name`='Veribet' );

#04 DELETE

DELETE FROM employees AS e
WHERE e.salary >= 6000 
AND e.manager_id IS NOT NULL;