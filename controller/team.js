const { PrismaClient } = require("@prisma/client")
const { response } = require("../utils/wrapper")
const multer = require("multer")
const path = require("path")
const storage = multer.diskStorage({
    destination: (req, res, cb) => {
        cb(null, path.join(__dirname, "../public/team"))
    },
    filename: (req, file, cb) => {
        cb(null, `logo-team-${Date.now()}-${file.filename}`)
    }
})

exports.upload = multer({
    storage: storage,
    fileFilter: (req, file, cb) => {
        const mimtype = ["/jpg", "/jpeg", "/png"]
        if (file.mimetype !== mimtype) cb("type not file support", false)

        const size = file.size
        if (size > 2 * 1024 * 1024) cb("file too large", false)

        cb(null, true)
    }
}).single("logo")

const prisma = new PrismaClient()


exports.add = async (req, res) => {
    try {
        this.upload(req, res, async error => {
            if (error) return res.json({ msg: error })
            console.log(req.headers);
            const payload = {
                name: req.body.name
            }
            console.log(payload);
            const result = await prisma.team.create({
                data: {
                    name: payload.name
                }
            })
            console.log(result);
        })
        return response(res, "add team", result, 201)
    } catch (error) {
        return response(res, error.message, error, 400)
    }
}

exports.getAll = async (req, res) => {
    try {
        const result = await prisma.team.findMany({
            include: {
                player: true
            }
        })
        console.log(result);
        return response(res, 'get team and player', result, 200)
    } catch (error) {
        return response(res, error.message, error, 200)
    }
}

exports.delete = async (req, res) => {
    try {
        const id = Number(req.params.id)



        const result = await prisma.team.delete({
            where: {
                id: id
            }
        })
        console.log(result);
        return response(res, "delete team", result, 200)

    } catch (error) {
        return response(res, error.message, error, 400)
    }
}