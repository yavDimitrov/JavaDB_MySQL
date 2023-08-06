# 02 Insert

INSERT INTO property_transactions (property_id, buyer_id, transaction_date, bank_name, iban, is_successful)
	SELECT 
		(`agent_id`+ DAY(`offer_datetime`)),
		(`agent_id`+ MONTH(`offer_datetime`)),
		(DATE(`offer_datetime`)),
		(CONCAT('Bank', ' ', `agent_id`)),
		(CONCAT('BG', `price`, `agent_id`)),
		(1)
    FROM property_offers
    WHERE agent_id <= 2;
    
    #03 UPDATE
    
    UPDATE `properties` AS p
		SET p.price = (p.price - 50000)
        WHERE price >= 800000;
    
       SELECT * FROM `properties` 
		        WHERE price >= 800000;
                
	#04 DELETE
    
    DELETE FROM `property_transactions`
		WHERE is_successful = 0;