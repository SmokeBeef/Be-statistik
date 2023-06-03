const app = require("express").Router()
const control = require("../controller/ballpossesion")

app.post("/", control.add)


module.exports = app