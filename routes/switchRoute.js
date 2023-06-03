const app = require("express").Router()
const control = require("../controller/switch")

app.post("/", control.add)


module.exports = app