const model = require("../model/rooms");

function getAllRooms(req, res, next) {
  model
    .getAllRooms()
    .then((room) => {
      res.send(room);
    })
    .catch(next);
}

function getRoomsId(req, res, next) {
  const id = req.params.id;
  model
    .getRoomsId(id)
    .then((room) => {
      res.send(room);
    })
    .catch(next);
}

function addRoom(req, res, next) {
  const newRoom = req.body;
  model
    .addRooms(newRoom)
    .then((room) => {
      res.status(201).send(room);
    })
    .catch(next);
}

function delRoom(req, res, next) {
  const id = req.params.id;
  model
    .delRoom(id)
    .then(() => {
      res.status(204).send();
    })
    .catch(next);
}

module.exports = {
  getAllRooms,
  getRoomsId,
  addRoom,
  delRoom,
};
