const express = require('express')
const cors = require("cors")
const bodyParser = require("body-parser")
const teamRoute = require("./routes/teamRoute")
const playerRoute = require("./routes/playerRoute")

require("dotenv").config()

const PORT = process.env.PORT || 8000
const app = express()


// app.use(bodyParser.urlencoded({extended: false}))
app.use(express.urlencoded({extended: false}))
app.use(express.json())
app.use(cors())

app.use("/team", teamRoute)
app.use("/player", playerRoute)

app.listen(PORT, () => {
    console.log(`Listen on port ${PORT}`);
})