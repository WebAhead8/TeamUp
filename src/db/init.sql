BEGIN;

DROP TABLE IF EXISTS users, games, rooms, posts, avatarImg CASCADE; 


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(255) NOT NULL,
  lastname VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  pass VARCHAR(255) NOT NULL,
  platform TEXT [],
  gamelist TEXT [],
  avatarIcon TEXT
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
    skill TEXT,
    platform VARCHAR(255) NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    username INTEGER REFERENCES users(id),
    content TEXT,
    liked INTEGER
);

CREATE TABLE avatarImg (
    id SERIAL PRIMARY KEY,
    avatarSrc TEXT NOT NULL,
    avatarName VARCHAR(255) NOT NULL
);

INSERT INTO avatarImg (avatarName, avatarSrc) VALUES 
('persone1','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzUjuJ9a9w5dwIX_6aNGakPBVsgLzkE1mw1g&usqp=CAU'),
('persone2','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStqcnztZvciX-ShiuJxRGNX46F6GRCQi-_Eg&usqp=CAU'),
('persone3','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFaBxwrb4dKge__RTHGSSDR4J_eO7Tg8zekQ&usqp=CAU'),
('persone4','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyz-77X11MoGE22xVjjPhbpW6lPj6I0SkcTQ&usqp=CAU'),
('persone5','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlG4gXA0eUk2HgpynHSv30FXiqNOJEcwwXYmBiBUeHqfM6kUK3isKCUqPQXJq-ZECqOuw&usqp=CAU'),
('persone6','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToySq_WusGScvQ9hanrX3JpqOW-6_JNYM-iSNCfP-978MLxl5z2Wo9Ue_VNQ9H3UbnJOM&usqp=CAU'),
('persone7','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn8P6POnmXE2YJlFMqlJ-b2F_t8bdqTq4CAb-mQWDeI813MCCXefNOg9RjN2AQZwPzy3Y&usqp=CAU'),
('persone8','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLg7YYue_VyRsQLCwmguYP8nSLBwe24G8WgqJr8i_YxHwyHXbn9wqkZXAwdAvSGF9kVMk&usqp=CAU'),
('persone9','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSla-p7MqWVSLL2rpSQHlxEO6mKceKYPvZjo4oslefoeXE7-oMcRHP5IfT3qgllHC8kKvQ&usqp=CAU'),
('persone10','https://www.w3schools.com/w3images/avatar6.png');

INSERT INTO users (firstname ,lastname, username, email, pass, platform, gamelist, avatarIcon)  VALUES
  ('Sery1976', 'Serya', 'Seryaa', 'serya19@gmail.com', '123456', '{"PC"}', '{"Pubg"}', '')
  ;
  

INSERT INTO games (gname, descr) VALUES
  ('Pubg', 'Royal Battle'),
  ('The Last Of Us', 'Teamdeath Match'),
  ('GTAV', 'Open World'),
  ('COD: Warzone', 'Shooter'),
  ('COD: Cold War', 'Shooter'),
  ('Brawlhalla', 'Battle'),
  ('Rainbow Six', 'Shooter'),
  ('Uncharted', 'Shooter'),
  ('Ark', 'Survival'),
  ('Fortnite', 'Royal Battle'),
  ('Minecraft', 'Survival Craft'),
  ('Among Us', 'Royal Battle'),
  ('Overcooked', 'Cooking Battle'),
  ('CSGO', 'Shooter'),
  ('Overwatch', 'Royal Battle'),
  ('Destiny 2', 'Royal Battle'),
  ('Sea of Thieves', 'Royal Battle'),
  ('League of Legends', 'Royal Battle'),
  ('Apex Legends', 'Royal Battle')
  ;

  INSERT INTO rooms (rname, gname, host, gamers, maxgamers, descr, lang, age, skill, platform) VALUES
  ('lets play togther', 1, 1,'{"mahmod123"}', 4, 'melee attack', 'Arabic', '23+', '{"PRO"}', 'PC')
  ;

  INSERT INTO posts (username, content,liked) VALUES
  (1, 'Serya', 6)
  ;

COMMIT;
