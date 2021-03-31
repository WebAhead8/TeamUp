const jwt = require("jsonwebtoken");
const dotenv = require("dotenv");
const model = require("../model/users");
const bcrypt = require("bcryptjs");

dotenv.config();
const SECRET = process.env.JWT_SECRET;

function getAll(req, res, next) {
  model
    .getAllUser()
    .then((user) => {
      res.send(user);
    })
    .catch(next);
}

function get(req, res, next) {
  const id = req.params.id;
  model
    .getUserById(id)
    .then((user) => {
      res.send(user);
    })
    .catch(next);
}

function getUserByUsername(req, res, next) {
  const username = req.params.username;
  model
    .getUserByUsername(username)
    .then((user) => {
      res.send(user);
    })
    .catch(next);
}

function postUsers(req, res, next) {
  const userData = req.body;
  const hashPass = req.body.pass;

  bcrypt
    .genSalt(10)
    .then((salt) => bcrypt.hash(hashPass, salt))
    .then((hash) => {
      userData.pass = hash;
      userData.platform = [];
      userData.gamelist = [];
      model
        .createUser(userData)
        .then((user) => {
          const token = jwt.sign({ user: user.id }, SECRET, {
            expiresIn: "5h",
          });
          const response = {
            firstname: user.username,
            lastname: user.lastname,
            username: user.username,
            pass: hash,
            email: user.email,
            platform: user.platform,
            gamelist: user.gamelist,
            access_token: token,
          };
          res.status(201).send(response);
        })
        .catch(next);
    });
}

function login(req, res, next) {
  const email = req.body.email;
  const password = req.body.pass;
  model
    .getUser(email)
    .then((user) => {
      if (user) {
        bcrypt.compare(password, user.pass).then((match) => {
          if (!match) {
            const error = new Error("Incorrect Password");
            status = 404;
            next(error);
          } else {
            const token = jwt.sign({ user: user.id }, SECRET, {
              expiresIn: "5h",
            });
            res.status(200).send({ access_token: token, user: user.username });
          }
        });
      } else {
        const error = new Error("no user Found");
        error.status = 404;
        next(error);
      }
    })
    .catch(next);
}
function delusers(req, res, next) {
  const id = req.params.id;
  model
    .deluser(id)
    .then(() => {
      res.status(204).send();
    })
    .catch(next);
}
// Update Models
function updateUsername(req, res, next) {
  const id = req.body.id;
  const username = req.body.username;
  model
    .updateUsername(id, username)
    .then((user) => {
      res.send(user);
    })
    .catch(next);
}
function updateAvatarImg(req, res, next) {
  const id = req.body.id;
  const avatarIcon = req.body.avatarIcon;
  model
    .updateAvatarImg(id, avatarIcon)
    .then((user) => {
      res.send(user);
    })
    .catch(next);
}

function updateEmail(req, res, next) {
  const id = req.body.id;
  const email = req.body.email;
  model
    .updateEmail(id, email)
    .then((user) => {
      res.send(user);
    })
    .catch(next);
}

function updatePlatforms(req, res, next) {
  const id = req.body.id;
  const platform = req.body.platform;

  model
    .updatePlatforms(id, platform)
    .then((user) => {
      res.send(user);
    })
    .catch(next);
}
function updateGamesList(req, res, next) {
  const id = req.body.id;
  const gamelist = req.body.gamelist;
  model
    .updateGamesList(id, gamelist)
    .then((user) => {
      res.send(user);
    })
    .catch(next);
}

function updatePassword(req, res, next) {
  const id = req.body.id;
  const hashPass = req.body.pass;

  bcrypt
    .genSalt(10)
    .then((salt) => bcrypt.hash(hashPass, salt))
    .then((hash) => {
      pass = hash;
      model
        .updatePassword(id, pass)
        .then((user) => {
          res.send(user);
        })
        .catch(next);
    });
}

//login in all pages:
function getUserByToken(req, res, next) {
  const token = req.headers.authorization;
  const userID = jwt.verify(token, process.env.JWT_SECRET);
  model
    .getUserById(userID.user)
    .then((user) => {
      if (user) {
        res.status(200).send(user);
      } else {
        const error = new Error("no user Found");
        error.status = 404;
        next(error);
      }
    })
    .catch(next);
}

module.exports = {
  get,
  getUserByUsername,
  getAll,
  postUsers,
  login,
  updateUsername,
  getUserByToken,
  delusers,
  updateEmail,
  updatePlatforms,
  updateGamesList,
  updatePassword,
  updateAvatarImg,
};
