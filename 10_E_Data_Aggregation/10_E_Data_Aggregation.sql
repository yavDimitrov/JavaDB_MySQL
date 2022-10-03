#01. Records’ Count
	SELECT COUNT(`id`) AS 'count' FROM `wizzard_deposits`;
    
#02. Longest Magic Wand
	SELECT MAX(`magic_wand_size`) AS 'longest_magic_wand' FROM `wizzard_deposits`;
    
    #02.A SECOND Longest Magic Wand
	SELECT DISTINCT `magic_wand_size` AS 'longest_magic_wand' FROM `wizzard_deposits`
    ORDER BY `magic_wand_size` DESC
    LIMIT 1 offset 1;
    
#03. Longest Magic Wand per Deposit Groups
