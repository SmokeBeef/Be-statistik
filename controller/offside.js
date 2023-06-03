const { PrismaClient } = require("@prisma/client")
const { response } = require("../utils/wrapper")
const Prisma = new PrismaClient()
const offside = Prisma.offset

exports.add = async (req, res) => {
    try {
        const payload = {
            match_id: Number(req.body.match_id),
            offset_team_id: Number(req.body.offset_team_id),
            offset_time: Number(req.body.offset_time)
        }

        const result = await offside.create({
            data: payload
        })

        return response(res, "add offside", result, 201)
    } catch (error) {
        return response(res, "Error bang", error, 500)
    }
}

exports.findInMatchPerTeam = async (req,res) => {
    try {
        const payload = {
            match_id: Number(req.params.match_id),
            offset_team_id: Number(req.params.team_id)
        }
        const result = await offside.count({
            where: payload
        })
        return response(res, "get offside", result, 201)
    } catch (error) {
        return response(res, "Error bang", error, 500)
    }
}