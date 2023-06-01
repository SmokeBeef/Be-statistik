const { PrismaClient } = require("@prisma/client")
const { response } = require("../utils/wrapper")
const multer = require("multer")
const fs = require("fs")
const path = require("path")
const storage = multer.diskStorage({
    destination: (req, res, cb) => {
        cb(null, path.join(__dirname, "../public/team"))
    },
    filename: (req, file, cb) => {
        cb(null, `logo-team-${Date.now()}-${file.originalname}`)
    }
})

const upload = multer({
    storage: storage,
    fileFilter: (req, file, cb) => {
        const mimtype = ["image/jpg", "image/jpeg", "image/png"]
        console.log(file.mimetype);
        if (!mimtype.includes(file.mimetype)) return cb("type not file support", false)

        const size = file.size
        if (size > 2 * 1024 * 1024) return cb("file too large", false)

        return cb(null, true)
    }
}).single("logo")

const prisma = new PrismaClient()


exports.add = async (req, res) => {
    try {
        upload(req, res, async error => {
            if (error) return res.json({ msg: error })
            if (!req.file) return response(res, "nothing to upload", null, 404)
            console.log(req.body.logo);
            console.log(req.file);
            const payload = {
                name: req.body.name,
                logo: req.file.filename
            }
            console.log(payload);
            const result = await prisma.team.create({
                data: payload
            
            })
        console.log(result);
        return response(res, "add team", result, 201)
    })
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
        if(result) {
            fs.unlink(`${path.join(__dirname+"/../public/team/"+ result.logo)}`, err => {
                if(err) console.log(err);

            })
        }
        console.log(result);
        return response(res, "delete team", result, 200)

    } catch (error) {
        return response(res, error.message, error, 400)
    }
}