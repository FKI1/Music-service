	create table if not exists Genres (
	genres_id SERIAL primary key,
	name varchar(60) not null,
	);
	
	create table if not exists Artists (
	artists_id SERIAL primary key,
	name varchar(60) not null,
	);
	
	create table if not exists Albums (
	albums_id SERIAL primary key,
	name varchar(60) not null,
	title varchar(100) not null,
	release_year varchar(80) not null
	);
	
	create table if not exists Tracks (
	tracks_id SERIAL primary key,
	name varchar(60) not null,
	title varchar(100) not null,
	duration varchar(210) not null,
	albums_id integer not null,
	FOREIGN KEY (albums_id) REFERENCES Albums(albums_id) ON DELETE CASCADE
	);
	
	create table if not exists ArtistsGenres(
	artists_id integer references Artists(artists_id),
	genres_id integer references Genres(genres_id),
	constraint AG primary key (artists_id, genres_id),
	FOREIGN KEY (artists_id) REFERENCES Artists(artists_id) ON DELETE CASCADE,
    FOREIGN KEY (genres_id) REFERENCES Genres(genres_id) ON DELETE CASCADE
	);
	
	create table if not exists AlbumsArtists(
	albums_id integer references Albums(albums_id),
	artists_id integer references Artists(artists_id),
	constraint AA primary key (albums_id, artists_id),
	FOREIGN KEY (albums_id) REFERENCES Albums(albums_id) ON DELETE CASCADE,
    FOREIGN KEY (artists_id) REFERENCES Artists(artists_id) ON DELETE CASCADE
	);
	
	create table if not exists Collection(
	collection_id SERIAL primary key,
	name varchar(60) not null,
	release_year varchar(80) not null
	);
	
	create table if not exists CollectionTracks(
	collection_id integer references Collection(collection_id),
	tracks_id integer references Tracks(tracks_id),
	constraint CT primary key (collection_id, tracks_id),
	FOREIGN KEY (collection_id) REFERENCES Collection(collection_id) ON DELETE cascade,
    FOREIGN KEY (tracks_id) REFERENCES Tracks(tracks_id) ON DELETE CASCADE
	);
	