USE my_first_db;
SELECT product_name, manufacturer, price 
FROM mobile_phones
WHERE product_count > 2;

SELECT *
FROM mobile_phones
WHERE manufacturer = 'Samsung';

SELECT 	*
FROM mobile_phones
WHERE product_name LIKE '%iPhone%';

SELECT 	*
FROM mobile_phones
WHERE manufacturer LIKE '%Samsung%';

SELECT 	*
FROM mobile_phones
WHERE product_name LIKE '%8%';

SELECT 	*
FROM mobile_phones
WHERE product_name LIKE '%0%' OR product_name LIKE '%1%' OR product_name LIKE '%2%' OR product_name LIKE '%3%' OR product_name LIKE '%4%' OR product_name LIKE '%5%' OR product_name LIKE '%6%' OR product_name LIKE '%7%' OR product_name LIKE '%8%' OR product_name LIKE '%9%';