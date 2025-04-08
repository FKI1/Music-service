TRUNCATE TABLE AlbumsArtists, ArtistsGenres, Albums, Genres, Artists RESTART IDENTITY CASCADE;


INSERT INTO Artists(name) values 
('Женя Трофимов'), 
('MiyaGi'), 
('Andro'), 
('JONY');

INSERT INTO Genres(name) VALUES 
('бард-рок'),
('Русский хип-хоп'),
('Russian Pop'),
('Ukranian Pop'),
('Регги'),
('R&B'),
('хип-хоп'),
('поп');


INSERT into albums(name, title, release_year) values
('Женя Трофимов', 'Что бы она пела', 2022),
('Женя Трофимов, Комната культуры', 'Кассета с тремя сторонами', 2023),
('Женя Трофимов', 'Преступление и наказание', 2024),
('JONY', 'Список твоих мыслей', 2019),
('JONY', 'Небесные розы', 2020),
('Miyagi & Andy Panda', 'Yamakasi', 2020),
('Miyagi & Andy Panda', 'HATTORI', 2022),
('MiyaGi', 'Buster Keaton', 2019),
('Andro', 'MOON FLAME', 2019),
('Andro', 'JANI GIPSY', 2021),
('Andro', 'ВЕРА', 2024);

INSERT INTO ArtistsGenres(artists_id, genres_id) VALUES 
(1,1), 
(2,2),  
(2,3), 
(3,2),  
(3,4),  
(3,5),  
(4,6), 
(4,7), 
(4,8);

INSERT INTO AlbumsArtists(albums_id, artists_id) VALUES
(1,1),  
(2,1), 
(3,1),  
(4,4), 
(5,4),  
(6,2),  
(7,2),  
(8,2), 
(9,3), 
(10,3), 
(11,3);

INSERT INTO Tracks(name, title, duration, albums_id) VALUES
('Женя Трофимов', 'Самолеты', 254, 1),
('Женя Трофимов', 'Муза', 317, 1),
('Женя Трофимов', 'Номер', 346, 1),
('Женя Трофимов', 'Я даже не знаю', 357, 2),
('Женя Трофимов', 'Пусть она поёт', 349, 2),
('Женя Трофимов', 'Так беспокоюсь', 321, 2),
('Женя Трофимов', 'Студент', 321, 3),
('JONY', 'Аллея', 222, 4),
('JONY', 'Love my Voice', 230, 4),
('JONY', 'Без тебя я не я', 320, 4),
('JONY', 'Мир сошел с ума', 340, 5),
('JONY', 'Ты пари', 354, 5),
('JONY', 'Ты беспощадна', 403, 5),
('Miyagi & Andy Panda', 'Там ревели горы', 256, 6),
('Miyagi & Andy Panda', 'Atlant', 307, 6),
('Miyagi & Andy Panda', 'Ночь', 308, 7),
('Miyagi & Andy Panda', 'Saloon', 246, 7),
('Miyagi & Andy Panda', 'Captain', 334, 8),
('Miyagi & Andy Panda', 'Angel', 335, 8),
('Andro', 'Болен твоей улыбкой ', 246, 9),
('Andro', 'Ночной рейс', 213, 9),
('Andro', 'Романтики', 220, 10),
('Andro', 'Накопил монет', 247, 10),
('Andro', 'Gita', 254, 11),
('Andro', 'Gipsy Drill', 255, 11);

insert into collection(name, release_year) values
('Что бы она пела', 2022),
('Кассета с тремя сторонами', 2023),
('Преступление и наказание', 2024),
('Список твоих мыслей', 2019),
('Небесные розы', 2020),
('Yamakasi', 2020),
('HATTORI', 2022),
('Buster Keaton', 2019),
('MOON FLAME', 2019),
('JANI GIPSY', 2021),
('ВЕРА', 2024);

insert into collectiontracks(collection_id, tracks_id) values
(1,1),
(1,2),
(1,3),
(2,4),
(2,5),
(2,6),
(3,7),
(4,8),
(4,9),
(4,10),
(5,11),
(5,12),
(5,13),
(6,14),
(6,15),
(7,16),
(7,17),
(8,18),
(8,19),
(9,20),
(9,21),
(10,22),
(10,23),
(11,24),
(11,25);

SELECT * FROM Artists;
SELECT * FROM Genres;
SELECT * FROM Albums;
SELECT * FROM ArtistsGenres;
SELECT * FROM AlbumsArtists;
SELECT * FROM tracks;
SELECT * FROM collection;
SELECT * FROM collectiontracks;
