/* 1. Подсчитать количество групп (сообществ), в которые вступил каждый пользователь.
2. Подсчитать количество пользователей в каждом сообществе.
3. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
4.* Подсчитать общее количество лайков, которые получили пользователи младше 18 лет.
5.* Определить кто больше поставил лайков (всего): мужчины или женщины. */

USE vk;
-- 1. Подсчитать количество групп (сообществ), в которые вступил каждый пользователь.
select firstname, lastname, count(users.id)
from users
join users_communities on users.id = users_communities.user_id
group by users.id
order by count(users.id) desc;

-- 2. Подсчитать количество пользователей в каждом сообществе.
select communities.name, count(communities.id)
from users_communities 
join communities on users_communities.community_id = communities.id
group by communities.id;

-- 3. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
select from_user_id, users.firstname, users.lastname, count(messages.from_user_id) as 'mess_count'
from messages
join users on users.id = messages.from_user_id
where to_user_id = 1
group by from_user_id
order by count(messages.from_user_id) desc
limit 1;

-- 4.* Подсчитать общее количество лайков, которые получили пользователи младше 18 лет.
select count(likes.media_id) -- количество лайков
from likes
join media on likes.media_id = media.id
join profiles on profiles.user_id = media.user_id
where TIMESTAMPDIFF(YEAR, birthday, NOW()) < 18;

-- 5.* Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT  gender, COUNT(likes.user_id)
from likes
join profiles on likes.user_id = profiles.user_id 
group by gender 
order by COUNT(likes.user_id) desc
limit 1;