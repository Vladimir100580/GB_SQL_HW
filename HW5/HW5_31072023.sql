-- 1. Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]
-- 2. Выведите данные, используя написанное представление [SELECT]
-- 3. Удалите представление [DROP VIEW]
-- 4.* Сколько новостей (записей в таблице media) у каждого пользователя? Вывести поля: news_count (количество новостей), user_id (номер пользователя), user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN.

USE vk;
-- 1.	Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]
-- Пятеро самых 'творческих' пользователей (написавших больше всего сообщений) 

CREATE VIEW creative_personalities AS 
SELECT users.id, COUNT(users.id) AS cnt
FROM users
JOIN messages ON (
	users.id = messages.from_user_id 
)
GROUP BY users.id
ORDER BY cnt desc
limit 5;

-- 2.	Выведите данные, используя написанное представление [SELECT]
SELECT * FROM creative_personalities;

-- 3.	Удалите представление [DROP VIEW]
DROP VIEW creative_personalities;

-- 4.	* Сколько новостей (записей в таблице media) у каждого пользователя? Вывести поля: news_count (количество новостей), user_id (номер пользователя), user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN.
SELECT COUNT(media.user_id), user_id, email
FROM media
JOIN users on users.id = media.user_id 
GROUP BY user_id;

