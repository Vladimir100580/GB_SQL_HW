------------------ Задача 2.
-- Написать скрипт, добавляющий в созданную БД vk 2-3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей) (CREATE TABLE)

-- добавим таблицу фотоальбомов
DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
	`id` SERIAL,
	`name` varchar(255),
    `user_id` BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- добавим таблицу фотографий
DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
	id SERIAL,
	`album_id` BIGINT unsigned,
	`media_id` BIGINT unsigned NOT NULL,

	FOREIGN KEY (album_id) REFERENCES photo_albums(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

-- добавим таблицу городов
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	id SERIAL,
	`name` varchar(255) NOT NULL
);

-- добавим поле с идентификатором города
ALTER TABLE profiles ADD COLUMN city_id BIGINT UNSIGNED NOT NULL ;

-- сделаем это поле внешним ключом
ALTER TABLE profiles ADD CONSTRAINT fk_profiles_city_id
    FOREIGN KEY (city_id) REFERENCES cities(id)