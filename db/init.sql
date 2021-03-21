BEGIN;

DROP TABLE IF EXISTS users CASCADE; 

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(255) NOT NULL,
  lastname VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  platform TEXT [],
  gamelist TEXT [],
  post INTEGER REFERENCES posts(id)

);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    gname VARCHAR(255) NOT NULL,
    descr TEXT,
    rooms INTEGER REFERENCES rooms(id)



);

CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,
    rname VARCHAR(255) NOT NULL,
    host INTEGER REFERENCES users(id),
    gamer TEXT [],
    maxgamers INTEGER,
    descr TEXT,
    lang VARCHAR(255) NOT NULL,
    age VARCHAR(255) NOT NULL,
    skill TEXT [],
    platform VARCHAR(255) NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    username INTEGER REFERENCES users(id),
    content TEXT,
    liked INTEGER
);

INSERT INTO users (firstname, lastname, post) VALUES
  ('Sery1976', 'Serya', 'This is my FIRST blog, dsnfso fnldsn lsdng ldn kldskng kdng kdsng kdfngfxkjnkdlng jkdng kdn jfdn jnfdkgn jng dkjng dkjng kd'),


COMMIT;
