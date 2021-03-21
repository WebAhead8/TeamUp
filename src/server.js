const express = require("express");
const PORT = process.env.PORT || 4000;
const rooms = require("./handlers/rooms");
const cors = require("cors");

const server = express();
server.use(express.json());
server.use(cors());
server.get("/", (reg, res) => {
  res.send("<h1> Welcome To TeamUp API </h1>");
});
// Rooms Requests
server.get("/rooms", rooms.getAllRooms);
server.get("/rooms/:id", rooms.getRoomsId);
server.post("/rooms", rooms.addRoom);
server.delete("/rooms/:id", rooms.delRoom);
server.post("/teste", (req, res) => console.log(req.body));
server.listen(PORT, () => console.log(`Listening on http://localhost:${PORT}`));
