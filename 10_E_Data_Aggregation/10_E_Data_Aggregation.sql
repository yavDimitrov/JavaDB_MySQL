#01. Records’ Count
	SELECT COUNT(`id`) AS 'count' FROM `wizzard_deposits`;
    
#02. Longest Magic Wand
	SELECT MAX(`magic_wand_size`) AS 'longest_magic_wand' FROM `wizzard_deposits`;
    
    #02.A SECOND Longest Magic Wand
	SELECT DISTINCT `magic_wand_size` AS 'longest_magic_wand' FROM `wizzard_deposits`
    ORDER BY `magic_wand_size` DESC
    LIMIT 1 offset 1;
    
#03. Longest Magic Wand per Deposit Groups
	SELECT `deposit_group`, MAX(`magic_wand_size`) AS 'longest_magic_wand' FROM `wizzard_deposits`
    GROUP BY `deposit_group`
    order by `longest_magic_wand`, `deposit_group`;
    
#04. Smallest Deposit Group per Magic Wand Size
	SELECT `deposit_group` FROM `wizzard_deposits`
    GROUP BY `deposit_group`
    ORDER BY AVG(`magic_wand_creator`) ASC
    LIMIT 1;

#05. Deposits Sum
	SELECT `deposit_group`, SUM(`deposit_amount`) AS 'total_sum' FROM `wizzard_deposits`
    GROUP BY `deposit_group`
    ORDER BY `total_sum`;
    
#06. Deposits Sum for Ollivander Family
	SELECT `deposit_group`, SUM(`deposit_amount`) AS 'total_sum' FROM `wizzard_deposits`
    WHERE `magic_wand_creator` = 'Ollivander family'
    GROUP BY `deposit_group`
    order by `deposit_group`;
    
#07. Deposits Filter
	SELECT `deposit_group`, SUM(`deposit_amount`) AS 'total_sum' FROM `wizzard_deposits`
    WHERE `magic_wand_creator` = 'Ollivander family'
    GROUP BY `deposit_group`
    HAVING `total_sum` < 150000
    ORDER BY `total_sum` DESC;
  

