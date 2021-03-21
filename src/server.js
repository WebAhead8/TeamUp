const express = require("express");
const PORT = process.env.PORT || 4000;
const cors = require("cors");

const server = express();
server.use(cors());

server.listen(PORT, () => console.log(`Listening on http://localhost:${PORT}`));
