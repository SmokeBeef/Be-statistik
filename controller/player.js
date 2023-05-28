const { PrismaClient } = require("@prisma/client")
const { response } = require("../utils/wrapper")
const prisma = new PrismaClient()



exports.add = async (req, res) => {
    // try {
    const payload = {
        name: req.body.name,
        numberJersey: req.body.numberJersey,
        position: req.body.position,
        team_id: Number(req.body.team_id)
    }
    console.log(payload);
    const cekJersey = await prisma.player.findMany({
        where: {
            AND: [
                { numberJersey: payload.numberJersey },
                { team_id: payload.team_id }
            ]
        }
    })

    console.log("result ", cekJersey);
    if (cekJersey.length !== 0) return response(res, "Number Jersey already used", null, 409)

    const result = await prisma.player.create({
        data: payload
    })

    return response(res, "add a player", result, 201)

    // } catch (error) {
    //     return response(res, error.message, error, 400)
    // }
}

exports.getAll = async (req, res) => {
    try {
        const result = await prisma.player.findMany({
            select: {
                name: true,
                numberJersey: true,
                position: true,
                id: true,
                team: {
                    select: {
                        name: true
                    }
                }
            },

            orderBy: {
                team_id: "asc"
            },
        })

        return response(res, 'get player and team', result, 200)
    } catch (error) {
        return response(res, error.message, error, 400)
    }

}

exports.getByTeam = async (req,res) => {
    try {

        const payload = Number(req.params.id)
        if(!payload) return res.status(409)
        const result = await prisma.player.findMany({
            where: {
                team_id: payload
            }
        })
        console.log("get by team id ", result);
        return response(res, "success get player by id", result, 200)
    } catch (error) {
        return response(res, error.message,error, 500)
    }
}

exports.delete = async (req, res) => {
    try {
        const payload = Number(req.params.id)


        const result = await prisma.player.delete({
            where: {
                id: payload
            }
        })

        return response(res, "Delete player", result, 200)
    } catch (error) {
        return response(res, error.message, error, 400)
    }
}

