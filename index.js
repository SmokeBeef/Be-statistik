const express = require('express')
const cors = require("cors")
const bodyParser = require("body-parser")
const teamRoute = require("./routes/teamRoute")
const playerRoute = require("./routes/playerRoute")
const matchRoute = require("./routes/matchRoute")
const goalRoute = require("./routes/goalRoute")
const cardRoute = require("./routes/cardRoute")
const ballPosRoute = require("./routes/ballPosRoute")
const osRoute = require("./routes/offsideRoute")
const switchPlayer = require("./routes/switchRoute")
const dotenv = require("dotenv")
dotenv.config()

const PORT = process.env.PORT || 8000
const app = express()


// app.use(bodyParser.urlencoded({extended: false}))
app.use(express.urlencoded({ extended: false }))
app.use(express.json())
app.use(cors())

app.use(express.static("./public"))
app.use("/team", teamRoute)
app.use("/player", playerRoute)
app.use("/goal", goalRoute)
app.use("/match", matchRoute)
app.use("/card", cardRoute)
app.use("/bp", ballPosRoute)
app.use("/os", osRoute)
app.use("/switch", switchPlayer)


app.listen(PORT, () => {
    console.log(`Listen on port ${PORT}`);
})