const app = require("express").Router()
const control = require("../controller/goal")

app.post("/add", control.add)
app.get("/:match_id/:team_id", control.GoalTeamInMatch)

module.exports= app