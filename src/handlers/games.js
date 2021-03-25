const gamesModel = require("../model/games");

function getAllGames(req, res, next) {
  gamesModel
    .getAllGames()
    .then((allGames) => {
      res.send(allGames.rows);
    })
    .catch(next);
}

function getGameById(req, res, next) {
  gamesModel
    .getGameById(req.params.id)
    .then((game) => {
      res.send(game.rows);
    })
    .catch(next);
}

function autocomplete(req, res, next) {
  gamesModel
    .autocomplete(req.params.gname)
    .then((game) => {
      res.send(game.rows);
    })
    .catch(next);
}

function deleteGame(req, res, next) {
  const gameId = req.params.id;
  gamesModel
    .deleteGames(gameId)
    .then(() => {
      res.status(204);
      res.send("The Game DELETED :(");
    })
    .catch(next);
}

function addNewGame(req, res, next) {
  const newGame = req.body;
  gamesModel
    .addGame(newGame)
    .then(() => {
      res.status(204);
      res.send("The Game Has ADDED :)");
    })
    .catch(next);
}

module.exports = {
  addNewGame,
  deleteGame,
  getGameById,
  getAllGames,
  autocomplete,
};
