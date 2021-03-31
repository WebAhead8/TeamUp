# TeamUp - Back-End Repo

This is the back-end (API) project for TeamUP front-end. This project helps the gamers to team up with the right team as they want the game to be.

Front-End : https://youthful-bhaskara-379d1b.netlify.app/
Back-End : https://teamupgamers.herokuapp.com/

# Team Members :

1. Bushra Shwiki.
2. Mahmud Diab.
3. Muhammad Khamaisi.

# Techs We Used :

- Node js
- Express js
- JavaScript
- Postgresql

# How It Works?

## Clone This Repo

- After npm i

1. Enter `psql` and create user and database.
2. Make a .env file and add DEV_DATABASE_URL={your local database link}
3. Run `npm run dev`

# Methods & Routes :

## Users :

### / GET :

/users [Get All Users]
/users/:id [Get User By Id]
/user/:username [Get User By Username]
/login/me [Get User By Token]

### / DELETE :

/users/:id [Delete A User By ID]

### / POST

/update/username
/update/email
/update/platforms
/update/gameslist
/update/password
/update/avatarimg

/users [Create New User]
/login

## Games

### / GET :

/games/
/game/:id
/games/:gname

### / POST :

/addGame

### / DELETE :

/post/:id
