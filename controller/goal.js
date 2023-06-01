const { PrismaClient } = require("@prisma/client")
const { response } = require("../utils/wrapper")
const prisma = new PrismaClient()

const goal = prisma.goal

exports.add = async (req,res) => {
    try {
        const payload = {
            match_id: Number(req.body.match_id),
            player_id: Number(req.body.player_id),
            goal_time: Number(req.body.goal_time)
        }

        const result = await goal.create({
            data: payload
        })

        return response(res,"success add", result, 201)
    } catch (error) {
        
        return response(res, error.message, error, 400)
    }
}

exports.GoalTeamInMatch = async (req,res) => {
    try {
        const payload = {
            match_id: Number(req.params.match_id),
            team_id: Number(req.params.team_id)
        }
        const result = await prisma.goal.count({
            where: {
                AND: [
                    {match_id: payload.match_id},
                    {player: {
                        team_id: payload.team_id
                    }},
                ]
            }
        })
        console.log(result);
        return response(res, "get goal in one match", result, 200)

    } catch (error) {
        return response(res, error.message, error, 400)
    }
}

exports.goalPlayerMatch = async (req, res) => {
    try {
        const payload = {
            match_id: req.params.match_id,
            player_id: req.params.player_id
        }
        const result = await goal.count({
            where: {
                AND: [
                    {match_id: payload.match_id},
                    {player_id: payload.player_id}
                ]
            }
        })
        return response(res, "get score", result, 200)
    } catch (error) {
        return response(res, error.message, error, 400) 
    }
}