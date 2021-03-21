const express = require("express");
const PORT = process.env.PORT || 4000;
const rooms = require("./handlers/rooms");
const cors = require("cors");
const gamesHandler = require("./handlers/games");
const postsHandler = require("./handlers/posts");

const server = express();
server.use(express.json());
server.use(cors());
server.use(express.urlencoded());

server.get("/", (reg, res) => {
  res.send("<h1> Welcome To TeamUp API </h1>");
});

// Rooms Requests
server.get("/rooms", rooms.getAllRooms);
server.get("/rooms/:id", rooms.getRoomsId);
server.post("/rooms", rooms.addRoom);
server.delete("/rooms/:id", rooms.delRoom);
server.post("/teste", (req, res) => console.log(req.body));

// Games
server.get("/AllGames", gamesHandler.getAllGames);
server.get("/game/:id", gamesHandler.getGameById);
server.post("/addGame", gamesHandler.addNewGame);
server.delete("/game/:id", gamesHandler.deleteGame);

// Posts
server.get("/AllPosts", postsHandler.getAllPosts);
server.post("/addPost", postsHandler.addNewPost);
server.delete("/post/:id", postsHandler.deletePost);

server.listen(PORT, () => console.log(`Listening on http://localhost:${PORT}`));
