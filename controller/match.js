const { PrismaClient } = require("@prisma/client")
const { response } = require("../utils/wrapper")
const prisma = new PrismaClient()
const match = prisma.match


exports.add = async (req, res) => {
    try {

        const payload = {
            homeTeam: Number(req.body.homeTeam),
            awayTeam: Number(req.body.awayTeam),
        }
        if (!payload.awayTeam || !payload.homeTeam) {
            return response(res, "team not found", null, 400)
        }

        const result = await match.create({
            data: payload
        })

        return response(res, "success add match", result, 201)


    } catch (error) {
        return response(res, "error payload", error.message, 400)
    }
}

exports.spesifyMatch = async (req, res) => {
    try {
        const id = Number(req.params.id)
        console.log(id);
        const result = await match.findFirst({
            where: {
                id: id
            },
            select: {
                home_team: {
                    select: {
                        name: true
                    }
                },
                away_team: {
                    select: {
                        name: true
                    }
                },
                ballPossession: true,
                card: {
                    select: {
                        player: true
                    }
                },
                goal: {
                    select: {
                        player: true
                    }
                },

            }
        })

        return response(res, "get detail match", result, 200)
    } catch (error) {
        return response(res, error.message, error, 400)
    }
}

exports.findAll = async (req, res) => {
    try {

        const result = await match.findMany({
            include: {
                home_team: {
                    select: {
                        name: true
                    }
                },
                away_team: {
                    select: {
                        name: true
                    }
                },

                
            },

        })
        return response(res, "success get all", result, 200)
    } catch (error) {

        return response(res, error.message, error, 400)
    }
}

exports.delete = async (req, res) => {
    try {
        const id = req.params.id
        const result = match.delete({
            where: {
                id: id
            }
        })
    } catch (error) {

    }
}