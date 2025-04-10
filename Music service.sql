	create table if not exists Genres (
	genres_id SERIAL primary key,
	name varchar(60) not null);
	
	create table if not exists Artists (
	artists_id SERIAL primary key,
	name varchar(60) not null);
	
	create table if not exists Albums (
	albums_id SERIAL primary key,
	name varchar(60) not null,
	title varchar(100) not null,
	release_year integer not null
	);
	
	create table if not exists Tracks (
	tracks_id SERIAL primary key,
	name varchar(60) not null,
	title varchar(100) not null,
	duration integer not null,
	albums_id integer not null,
	FOREIGN KEY (albums_id) REFERENCES Albums(albums_id) ON DELETE CASCADE
	);
	
	create table if not exists ArtistsGenres(
	artists_id integer REFERENCES Artists(artists_id) ON DELETE CASCADE,
   	genres_id integer REFERENCES Genres(genres_id) ON DELETE cascade,
    	constraint AG primary key (artists_id, genres_id)
	);
	
	create table if not exists AlbumsArtists(
	albums_id integer REFERENCES Albums(albums_id) ON DELETE CASCADE,
   	artists_id integer REFERENCES Artists(artists_id) ON DELETE cascade,
    	constraint AA primary key (albums_id, artists_id)
	);
	
	create table if not exists Collection(
	collection_id SERIAL primary key,
	name varchar(60) not null,
	release_year integer not null
	);
	
	create table if not exists CollectionTracks(
	collection_id integer REFERENCES Collection(collection_id) ON DELETE cascade,
   	tracks_id integer REFERENCES Tracks(tracks_id) ON DELETE cascade,
    	constraint CT primary key (collection_id, tracks_id)
	);
	
	
