const { PrismaClient } = require("@prisma/client")
const { response } = require("../utils/wrapper")
const Prisma = new PrismaClient()
const switchPlayer = Prisma.switchPlayer

exports.add = async (req, res) => {
    try {
        const payload = {
            match_id: Number(req.body.match_id),
            player_out_id: Number(req.body.player_out_id),
            player_in_id: Number(req.body.player_in_id),
            switch_time: Number(req.body.switch_time)
        }

        const result = await switchPlayer.create({
            data: payload
        })
        return response(res, "switch player", result, 201)
    } catch (error) {
        return response(res, "Error bang", error, 500)
    }
}