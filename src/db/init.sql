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
('Joel Miller','data:image/jpeg;base64,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'),
('Ellie Williams','https://fsb.zobj.net/crop.php?r=Xe51net11A9bou-Ly53Ttk0KDwbPDkXF2meW3OzpLYIJMLNObminQypEnbsB3zNRj9PaKYuVxaetRIRIDi9Cic1lCiuPxnBXTJcqimUNpY_JApC2vu6pDcwz7JIUW-r-pUPg54wdRS1xue8l'),
('Dina','https://pbs.twimg.com/profile_images/1295291239798132737/kvXtkyLu_400x400.jpg'),
('Lara Croft','https://i.pinimg.com/originals/eb/88/1f/eb881fc72133bffec6b6f98fffa03a9e.jpg'),
('Nathan Drake','https://i.pinimg.com/originals/1e/0e/ba/1e0eba3e513b9aaab8b6f1ca581fd5a8.jpg'),
('Samuel Drake','https://static.tvtropes.org/pmwiki/pub/images/sam_drake_001.jpg'),
('Elena Fisher','https://i.pinimg.com/originals/ef/c8/e8/efc8e8a68f90f253e3222eb3d7fc5c19.png'),
('Victor Sullivan','https://comicvine1.cbsistatic.com/uploads/scale_medium/6/66303/2036366-1655045_vlcsnap_2010_12_12_15h18m29s218.png'),
('Chloe','https://s3.amazonaws.com/prod-media.gameinformer.com/styles/thumbnail/s3/legacy-images/The%20Evolution%20Of%20Chloe%E2%80%99s%20Design%20For%20Uncharted%3A%20The%20Lost%20Legacy/chloe_5F00_game_5F00_informer1.jpg'),
('Maxine Caulfield','https://miro.medium.com/max/4050/0*19XH9E5y5CS3Rqoz.jpg'),
('Chloe Price','https://beamlasopa462.weebly.com/uploads/1/2/6/6/126666449/673036837.jpg'),
('Rachel Amber','https://i.redd.it/0d5h1pooajg51.jpg'),
('Arthur  Morgan','https://i.pinimg.com/originals/13/d1/27/13d1279b3fa252da820779b9cd8d6291.png'),
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
