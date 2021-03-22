const path = require("path");
const db = require(path.join(__dirname, "..", "db", "connection"));

function getAllRooms() {
  return db.query(`SELECT * from rooms`).then((result) => {
    return result.rows;
  });
}

function getRoomsId(id) {
  return db
    .query(`SELECT * FROM rooms WHERE id = ($1)`, [id])
    .then((result) => {
      return result.rows;
    });
}

function addRooms(room) {
  const roomDetails = [
    room.rname,
    room.gname,
    room.host,
    room.gamers,
    room.maxgamers,
    room.descr,
    room.lang,
    room.age,
    room.skill,
    room.platform,
  ];

  return db
    .query(
      `INSERT INTO rooms (rname, gname, host, gamers, maxgamers, descr, lang, age, skill, platform) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10) returning *`,
      roomDetails
    )
    .then((result) => {
      return result.rows;
    });
}

function delRoom(id) {
  return db.query(`DELETE FROM rooms WHERE id = ($1)`, [id]).then((result) => {
    return result;
  });
}

module.exports = {
  getAllRooms,
  getRoomsId,
  addRooms,
  delRoom,
};
