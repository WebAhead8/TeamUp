const express = require("express");
const PORT = process.env.PORT || 4000;
const cors = require("cors");
const gamesHandler = require("./handlers/games");
const postsHandler = require("./handlers/posts");

const server = express();

server.use(cors());
server.use(express.json());
server.use(express.urlencoded());

//games
server.get("/AllGames", gamesHandler.getAllGames);
server.get("/game/:id", gamesHandler.getGameById);
server.post("/addGame", gamesHandler.addNewGame);
server.delete("/game/:id", gamesHandler.deleteGame);

//posts
server.get("/AllPosts", postsHandler.getAllPosts);
server.post("/addPost", postsHandler.addNewPost);
server.delete("/post/:id", postsHandler.deletePost);

server.listen(PORT, () => console.log(`Listening on http://localhost:${PORT}`));
