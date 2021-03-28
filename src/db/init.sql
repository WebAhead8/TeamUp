BEGIN;

DROP TABLE IF EXISTS users, games, rooms, posts CASCADE; 


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(255) NOT NULL,
  lastname VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  pass VARCHAR(255) NOT NULL,
  platform TEXT [],
  gamelist TEXT []
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    gname VARCHAR(255) NOT NULL,
    descr TEXT
);

CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,
    rname VARCHAR(255) NOT NULL,
    gname INTEGER REFERENCES games(id),
    host INTEGER REFERENCES users(id),
    gamers TEXT [],
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

INSERT INTO users (firstname ,lastname, username, email, pass, platform, gamelist)  VALUES
  ('Sery1976', 'Serya', 'Seryaa', 'serya19@gmail.com', '123456', '{"PC"}', '{"Pubg"}'),
  ('Boshe', 'Wiki', 'Boshee', 'boshee97@gmail.com', '234567', '{"PS"}', '{"The Last of Us"}'),
  ('Mah', 'Diabo', 'Aldiab', 'diab97@gmail.com', '345678', '{"PC"}', '{"COD"}'),
  ('Mario', 'Mar', 'Marioka98', 'marioka98@gmail.com', '456789', '{"PC"}', '{"Fortnite"}'),
  ('Hamodi', 'Kh', 'ElHamodi', 'elhamodi92@gmail.com', '567890', '{"PC"}', '{"Apex Legends"}')
  ;
  

INSERT INTO games (gname, descr) VALUES
  ('Pubg', 'Battle Royal'),
  ('The Last Of Us', 'Teamdeath Match'),
  ('GTAV', 'Open World'),
  ('COD: Warzone', 'Shooter'),
  ('COD: Cold War', 'Shooter'),
  ('Brawlhalla', 'Battle'),
  ('Rainbow Six', 'Shooter'),
  ('Uncharted', 'Shooter'),
  ('Ark', 'Survival'),
  ('Fortnite', 'Battle Royal'),
  ('Minecraft', 'Survival Craft'),
  ('Among Us', 'Battle Royal'),
  ('Overcooked', 'Cooking Battle'),
  ('CSGO', 'Shooter'),
  ('Overwatch', 'Battle Royal'),
  ('Destiny 2', 'Battle Royal '),
  ('Sea of Thieves', 'Battle Royal'),
  ('League of Legends', 'Battle Royal'),
  ('Apex Legends', 'Battle Royal')
  ;

  INSERT INTO rooms (rname, gname, host, gamers, maxgamers, descr, lang, age, skill, platform) VALUES
  ('lets play togther', 1, 1,'{"Boshee fans"}', 4, 'melee attack', 'Arabic', '23+', '{"PRO"}', 'PC'),
  ('For noobs ONLY',2,2, '{"Boshee fans"}', 10, 'Boxing', 'English', '18+', '{"no skill needed"}', 'PS'),
  ('lets play with diab', 4, 3,'{"mahmod cod leader"}', 5, 'Boxing', 'Arabic', '23+', '{"PRO"}', 'PC')
  ('lets play with mario', 10, 4,'{"Mario new player"}', 20, 'noobs fortnite players', 'English', '23+', '{"PRO"}', 'PC')
  ('only professionals', 18, 5,'{"Best players"}', 3, 'Team players', 'Hebrow', '23+', '{"PRO"}', 'PC')

  ;

  INSERT INTO posts (username, content,liked) VALUES
  (1, 'Serya', 6),
  (2, 'im new PS player and wanna meet new players', 3),
  (3, 'who wants to be my new premade', 8),
  (4, 'looking for noobs fortnite players', 7),
  (5, 'looking for apex players', 9)
  ;

COMMIT;
