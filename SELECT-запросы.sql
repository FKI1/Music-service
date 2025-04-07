--Самый продолжительный трек
select title, duration from tracks
where duration = (select MAX(duration) from tracks);

--Продолжительность трека не менее 3,5 минут
select title, duration from tracks
where duration >= 350;

--Название сборников, вышедших с 2018 по 2020 год включительно
select name, release_year from collection
where release_year between '2018' and '2020';

--Испольнители из одного слова
select name from artists
where name not like '% %';

--Название трека, содержащее слово "мой\my"
select title from tracks
where title like '%my%';

--Количество исполнителей в каждом жанре
SELECT 
    g.name AS genre,
    COUNT(DISTINCT ag.artists_id) AS artists_count
FROM 
    genres g
LEFT JOIN 
    artistsgenres ag ON g.genres_id = ag.genres_id
GROUP BY 
    g.name
ORDER BY 
    artists_count DESC;

--Количество треков, вошедших в альбомы 2019-2020 годов
SELECT 
    a.name AS album_name,
    a.release_year AS release_year,
    COUNT(t.tracks_id) AS tracks_count
FROM 
    albums a
JOIN 
    tracks t ON a.albums_id = t.albums_id
WHERE 
    a.release_year BETWEEN 2019 AND 2020
GROUP BY 
    a.name, a.release_year
ORDER BY 
    a.release_year DESC, tracks_count DESC;

--Средняя продолжительность треков по каждому альбому
select 
	a.title as title_album,
	Count(t.tracks_id) as tracks_counts_albums, 
	ROUND(AVG(t.duration), 2) AS avg_duration_seconds,
    ROUND(AVG(t.duration)/60, 2) AS avg_duration_minutes
from 
	albums a 
join 
	tracks t on a.albums_id = t.albums_id
GROUP BY 
    a.title
ORDER BY 
    tracks_counts_albums DESC;

--Все исполнители, которые не выпустили альбомы в 2020 году
SELECT a.name AS artist_name
FROM artists a
WHERE a.artists_id not IN (
    SELECT DISTINCT aa.artists_id
    FROM AlbumsArtists aa
    JOIN albums al ON aa.albums_id = al.albums_id
    WHERE 
        al.release_year = 2020 )
ORDER BY a.name;

-- Названия сборников, в которых присутствует исполнительтель 
SELECT DISTINCT
    al.title AS album_title
FROM 
    albums al
JOIN 
    tracks t ON al.albums_id = t.albums_id
JOIN 
    artists a ON t.albums_id  = COALESCE(a.artists_id, a.artists_id)
WHERE 
    a.name = 'Женя Трофимов';

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT 
    al.title AS album_title,
    COUNT(DISTINCT g.genres_id) AS distinct_genres_count
FROM 
    albums al
JOIN 
    tracks t ON al.albums_id = t.albums_id
JOIN 
    artists a ON t.albums_id = a.artists_id
JOIN 
    ArtistsGenres ag ON a.artists_id = ag.artists_id
JOIN 
    genres g ON ag.genres_id = g.genres_id
GROUP BY 
    al.albums_id, al.title
HAVING 
    COUNT(DISTINCT g.genres_id) > 1
ORDER BY 
    distinct_genres_count DESC, al.title;

--Наименования треков, которые не входят в сборники
SELECT 
    t.title AS track_name
FROM 
    tracks t
LEFT JOIN 
    albums al ON t.albums_id = al.albums_id
WHERE 
    al.albums_id IS NULL;

--Названия альбомов, содержащих наименьшее количество треков.
WITH album_track_counts AS (
    SELECT 
        a.albums_id,
        a.title AS album_title,
        COUNT(t.tracks_id) AS track_count
    FROM 
        albums a
    LEFT JOIN 
        tracks t ON a.albums_id = t.albums_id
    GROUP BY 
        a.albums_id, a.title
)
SELECT 
    album_title,
    track_count
FROM 
    album_track_counts
WHERE 
    track_count = (SELECT MIN(track_count) FROM album_track_counts)
ORDER BY 
    album_title;