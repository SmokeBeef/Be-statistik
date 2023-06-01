const app = require("express").Router()
const control = require('../controller/match')

app.post("/add", control.add)
app.get("/", control.findAll)
app.get("/:id",control.spesifyMatch)

module.exports = app