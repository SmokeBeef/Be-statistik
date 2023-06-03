const app = require("express").Router()
const control = require("../controller/offside")
app.post("/", control.add)
app.get("/:match_id/:team_id", control.findInMatchPerTeam)

module.exports = app