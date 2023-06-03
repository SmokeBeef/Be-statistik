const { PrismaClient } = require("@prisma/client")
const { response } = require("../utils/wrapper")
const Prisma = new PrismaClient()
const ballPossession = Prisma.ballPossession


exports.add = async (req,res) => {
    try {
        const time = req.body.time
        const possTime = req.body.possession_time
        const possession_time = (possTime/time ) * 100
        const payload = {
            match_id: req.body.match_id,
            team_id: req.body.team_id,
            possession_time
        }
        const result = await ballPossession.create({
            data: payload
        })

        return response(res, "add ballposesion", result, 201)
    } catch (error) {
        return response(res, error.message, error, 400)
    }
}