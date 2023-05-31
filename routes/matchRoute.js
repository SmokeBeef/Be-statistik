const app = require("express").Router()
const control = require('../controller/match')

app.post("/add", control.add)