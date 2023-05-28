const app = require("express").Router()
const controller = require('../controller/player')

app.get("/", controller.getAll)
app.get("/id/:id", controller.getByTeam)
app.post("/add", controller.add)
app.delete("/del/:id", controller.delete)


module.exports = app