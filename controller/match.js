const { PrismaClient } = require("@prisma/client")
const { response } = require("../utils/wrapper")
const prisma = new PrismaClient()
const match = prisma.match


exports.add = async (req, res) => {
    try {
        
        const payload = {
            homeTeam: req.body.homeTeam,
            awayTeam: req.body.awayTeam,
        }

        const result = await match.create({
            data: payload
        })

        return response(res, "success add match", result, 201)
        
        
    } catch (error) {
        return response(res,"errro payload", error.message, 400)
    }
}

exports.delete = async (req,res) => {
    try {
        const id = req.params.id
        const result = match.delete({
            where:{
                id: id
            }
        })
    } catch (error) {
        
    }
}