const db = require("../db/connection");

function getAllGames() {
  return db.query("SELECT * FROM games");
}

function deleteGames(id) {
  return db.query("DELETE FROM games WHERE id = $1", [id]);
}

function autocomplete(gname) {
  return db.query("SELECT * FROM games WHERE gname ILIKE $1 || '%' ", [gname]);
}

function addGame(newGame) {
  return db.query("INSERT INTO games (gname, descr) VALUES ($1, $2)", [
    newGame.gname,
    newGame.descr,
  ]);
}

function getGameById(id) {
  return db.query("SELECT * FROM games WHERE id = $1", [id]);
}

module.exports = { getAllGames, deleteGames, addGame, getGameById, autocomplete };
