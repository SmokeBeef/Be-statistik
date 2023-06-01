const { PrismaClient } = require("@prisma/client")
const { response } = require("../utils/wrapper")
const Prisma = new PrismaClient()
const card = Prisma.card

exports.add = async (req, res) => {
    try {
        const payload = {
            match_id: req.body.match_id,
            player_id: req.body.player_id,
            card_type: req.body.card_type,
            card_time: req.body.card_time
        }

        const result = await card.create({
            data: payload
        })

        return response(res,"success add goal", result, 201)
    } catch (error) {
        return response(res, error.message, error, 400)
    }
}