const app = require("express").Router()
const control = require("../controller/card")

app.post("/add", control.add)

module.exports = app