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
('Joel Miller','https://static.wikia.nocookie.net/thelastofus/images/1/17/Joel_2038_shoulder_infobox.jpg/revision/latest?cb=20201121211458'),
('Ellie Williams','https://static.wikia.nocookie.net/thelastofus/images/5/50/Ellie_Jackson_shoulder_infobox.jpg/revision/latest?cb=20201121211251'),
('Dina','https://static.wikia.nocookie.net/thelastofus/images/f/f7/Dina_Farm_close_up.png/revision/latest?cb=20201112230350'),
('Lara Croft','https://i.pinimg.com/originals/eb/88/1f/eb881fc72133bffec6b6f98fffa03a9e.jpg'),
('Nathan Drake','https://static.wikia.nocookie.net/uncharted/images/9/9d/Nathan_Drake_from_A_Thief%27s_End.png/revision/latest?cb=20180521172750'),
('Samuel Drake','https://static.tvtropes.org/pmwiki/pub/images/sam_drake_001.jpg'),
('Elena Fisher','https://static.wikia.nocookie.net/uncharted/images/d/de/Elena_Fisher_from_ATE.png/revision/latest?cb=20160707202711'),
('Victor Sullivan','https://static.wikia.nocookie.net/uncharted/images/0/09/Victor_Sullivan_from_A_Thief%27s_End.png/revision/latest?cb=20180521172919'),
('Chloe','https://s3.amazonaws.com/prod-media.gameinformer.com/styles/thumbnail/s3/legacy-images/The%20Evolution%20Of%20Chloe%E2%80%99s%20Design%20For%20Uncharted%3A%20The%20Lost%20Legacy/chloe_5F00_game_5F00_informer1.jpg'),
('Maxine Caulfield','https://miro.medium.com/max/4050/0*19XH9E5y5CS3Rqoz.jpg'),
('Chloe Price','https://beamlasopa462.weebly.com/uploads/1/2/6/6/126666449/673036837.jpg'),
('Rachel Amber','https://static.wikia.nocookie.net/life-is-strange/images/0/09/BtS_rachel.png/revision/latest?cb=20170901142604'),
('Arthur  Morgan','https://static.wikia.nocookie.net/reddeadredemption/images/5/52/RDR2_Arthur_Morgan_Default.jpg/revision/latest?cb=20200602191534'),
('Aloy','https://s1.1zoom.me/big0/728/Warriors_Horizon_Zero_Dawn_Aloy_Redhead_girl_Face_566425_1358x1024.jpg'),
('Kratos','https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c072a9f7-5085-43da-82b5-7ecfb5873367/dc9ayte-a5cefaec-f925-48d9-8638-7a504386b364.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvYzA3MmE5ZjctNTA4NS00M2RhLTgyYjUtN2VjZmI1ODczMzY3XC9kYzlheXRlLWE1Y2VmYWVjLWY5MjUtNDhkOS04NjM4LTdhNTA0Mzg2YjM2NC5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.q1OwsnIil2Uge2nquD192oozINbW90pEfHN5IeC180U'),
('Scorpion','https://i.pinimg.com/originals/ce/d0/66/ced0664f5047413861e9f501be6ef0b5.jpg'),
('Sub Zero','https://wallpaperaccess.com/full/255016.jpg')
;

INSERT INTO users (firstname ,lastname, username, email, pass, platform, gamelist, avatarIcon)  VALUES
  ('Sery1976', 'Serya', 'Seryaa', 'serya19@gmail.com', '123456', '{"PC"}', '{"Pubg"}', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzUjuJ9a9w5dwIX_6aNGakPBVsgLzkE1mw1g&usqp=CAU'),
  ('Boshe', 'Wiki', 'Boshee', 'boshee97@gmail.com', '234567', '{"PS"}', '{"The Last of Us"}', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStqcnztZvciX-ShiuJxRGNX46F6GRCQi-_Eg&usqp=CAU'),
  ('Mah', 'Diabo', 'Aldiab', 'diab97@gmail.com', '345678', '{"PC"}', '{"COD"}', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFaBxwrb4dKge__RTHGSSDR4J_eO7Tg8zekQ&usqp=CAU'),
  ('Mario', 'Mar', 'Marioka98', 'marioka98@gmail.com', '456789', '{"PC"}', '{"Fortnite"}', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyz-77X11MoGE22xVjjPhbpW6lPj6I0SkcTQ&usqp=CAU'),
  ('Hamodi', 'Kh', 'ElHamodi', 'elhamodi92@gmail.com', '567890', '{"PC"}', '{"Apex Legends"}', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlG4gXA0eUk2HgpynHSv30FXiqNOJEcwwXYmBiBUeHqfM6kUK3isKCUqPQXJq-ZECqOuw&usqp=CAU')
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
  ('For noobs ONLY', 2, 2, '{"Boshee fans"}', 10, 'Boxing', 'English', '18+', '{"no skill needed"}', 'PS'),
  ('lets play with diab', 4, 3,'{"mahmod cod leader"}', 5, 'Boxing', 'Arabic', '23+', '{"PRO"}', 'PC'),
  ('lets play with mario', 10, 4,'{"Mario new player"}', 20, 'noobs fortnite players', 'English', '23+', '{"PRO"}', 'PC'),
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
