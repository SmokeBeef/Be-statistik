const { PrismaClient } = require("@prisma/client")
const { response } = require("../utils/wrapper")
const Prisma = new PrismaClient()
const ballPossession = Prisma.ballPossession


exports.add = async (req,res) => {
    try {
        const time = Number(req.body.time)
        const possTime = Number(req.body.possession_time)
        const possession_time = (possTime/time ) * 100
        console.log(time," / " ,possTime, " = ", possession_time);

        const payload = {
            match_id: Number(req.body.match_id),
            team_id: Number(req.body.team_id),
            possession_time
        }
        console.log(payload);
        const result = await ballPossession.create({
            data: payload
        })

        return response(res, "add ballposesion", result, 201)
    } catch (error) {
        console.log(error);
        return response(res, error.message, error, 400)
    }
}