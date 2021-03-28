const postsModel = require("../model/posts");

function getAllPosts(req, res, next) {
  postsModel
    .getAllPosts()
    .then((allPosts) => {
      res.send(allPosts.rows);
    })
    .catch(next);
}

function getUsersPost(req, res, next) {
  const id = req.params.id;
  postsModel
    .getUsersPost(id)
    .then((allPosts) => {
      res.send(allPosts.rows);
    })
    .catch(next);
}

function addNewPost(req, res, next) {
  const newPost = req.body;
  postsModel
    .addNewPost(newPost)
    .then(() => {
      res.status(201).send("The Post ADDED :)");
    })
    .catch(next);
}

function deletePost(req, res, next) {
  const postId = req.params.id;
  postsModel
    .deletePost(postId)
    .then(() => {
      res.status(204).send("The Post Has DELETED :(");
    })
    .catch(next);
}

module.exports = { getAllPosts, addNewPost, deletePost, getUsersPost };
