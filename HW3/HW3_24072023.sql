/* 1. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке. [ORDER BY]
2. Выведите количество мужчин старше 35 лет [COUNT].
3. Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY]
4. Выведите номер пользователя, который отправил больше всех заявок в друзья (таблица friend_requests) [LIMIT].
5. Выведите названия и номера групп, имена которых состоят из 5 символов [LIKE]. */

USE vk;
-- 1. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке. [ORDER BY]
SELECT DISTINCT firstname    -- выводим только уникальные значения  (т.е. без повторов)
FROM users                   -- из теблицы users
ORDER BY firstname;          -- сортируем по firstname


-- 2. Выведите количество мужчин старше 35 лет [COUNT].
SELECT *
FROM profiles 
WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) > 35 AND gender = 'm';   -- похожее задание было в прошлый раз (HW2) №4*, здесь аналогично + логический оператор


-- 3. Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY]
SELECT COUNT(*), status        -- подсчитываем количесиво строк с каждым (из четырех возможных) статусом
FROM friend_requests
GROUP BY status;


-- 4. Выведите номер пользователя, который отправил больше всех заявок в друзья (таблица friend_requests) [LIMIT]. 
SELECT initiator_user_id              -- выводим именно id пользователя
FROM friend_requests            
GROUP BY initiator_user_id            -- группируем по количеству отправленных заявок в друзья
ORDER BY COUNT(*) DESC                -- сортировка по убыванию
LIMIT 1;
    
    -- для закрепления решил найти "чемпионов" по популярности, т.е. кому больше всего пришло заявок:
    
SELECT target_user_id, COUNT(*) AS count            -- выводим именно id пользователя и количество пришедших заявок (11-й пользователь победил)
FROM friend_requests            
GROUP BY target_user_id            -- группируем по количеству пришедших заявок в друзья
ORDER BY count DESC                -- сортировка по убыванию
LIMIT 5;                            

-- 5. Выведите названия и номера групп, имена которых состоят из 5 символов [LIKE].

SELECT name
FROM communities            -- communities в переводе с английского "сообщества" ("группа" - это именно оно ... признаюсь, подсмотрел в подсказку)
WHERE name LIKE '_____';    -- "_" - ровно 1 символ. 

-- Вариант с CHAR_LENGTH  (Простите, это для себя)
SELECT name
FROM communities            
WHERE CHAR_LENGTH(name) = 5;     
