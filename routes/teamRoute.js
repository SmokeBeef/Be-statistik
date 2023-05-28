const express = require("express")
const app = express.Router()
const control = require("../controller/team")


app.get("/", control.getAll)
app.post("/add", control.add)
app.delete("/del/:id", control.delete)


module.exports = app