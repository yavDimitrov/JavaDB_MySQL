#10. Find name of top paid employee by store name
DELIMITER $$
CREATE FUNCTION udf_top_paid_employee_by_store(store_name VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN

RETURN (SELECT CONCAT(e.first_name, ' ', e.middle_name , '. ', e.last_name, ' works in store for ', 2020 - YEAR(e.hire_date), ' years')
	FROM employees AS e
    JOIN stores AS s ON e.store_id = s.id
    WHERE s.`name` = store_name
    ORDER BY e.salary DESC 
    LIMIT 1);
END$$

  SELECT udf_top_paid_employee_by_store('Stronghold') as 'full_info';
  
 #11. Update product price by address
 
 DELIMITER $$
  CREATE PROCEDURE udp_update_product_price (address_name VARCHAR (50))
BEGIN
	DECLARE increase_level INT;
    IF address_name LIKE '0%' THEN SET increase_level = 100;
		ELSE SET increase_level = 200;
		END IF;
        
	UPDATE products p SET price = price + increase_level
		WHERE p.id IN (
			SELECT ps.product_id FROM addresses AS a
            JOIN stores AS s ON a.id =s.address_id
            JOIN products_stores AS ps ON ps.store_id = s.id
            WHERE a.`name` = address_name
        );

END $$