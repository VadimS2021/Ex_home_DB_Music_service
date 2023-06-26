CREATE TABLE IF NOT EXISTS Genres (
  id SERIAL PRIMARY KEY,
  genre_name VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS Singers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(40) NOT NULL
);
CREATE TABLE IF NOT EXISTS Albums (
  id SERIAL PRIMARY KEY,
  album_title VARCHAR(50) NOT NULL,
  release_year INTEGER
);
CREATE TABLE IF NOT EXISTS Tracks (
  id SERIAL PRIMARY KEY,
  track_name VARCHAR(50) NOT NULL,
  duration TIME,
  album_id INTEGER REFERENCES Albums(id)
);
CREATE TABLE IF NOT EXISTS Collections (
  id SERIAL PRIMARY KEY,
  collection_title VARCHAR(50) NOT NULL,
  release_year INTEGER
);
CREATE TABLE IF NOT EXISTS TrackCollection (
  track_id INTEGER REFERENCES Tracks(id),
  collection_id INTEGER REFERENCES Collections(id),
  CONSTRAINT pk_track_collection PRIMARY KEY (track_id, collection_id)
);
CREATE TABLE IF NOT EXISTS SingerAlbum (
  singer_id INTEGER REFERENCES Singers(id),
  album_id INTEGER REFERENCES Albums(id),
  CONSTRAINT pk_singer_album PRIMARY KEY (singer_id, album_id)
);
CREATE TABLE IF NOT EXISTS SingerGenre (
  genre_id INTEGER REFERENCES Genres(id),
  singer_id INTEGER REFERENCES Singers(id),
  CONSTRAINT pk_genre_singer PRIMARY KEY (genre_id, singer_id)
);
