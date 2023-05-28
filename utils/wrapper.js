

const response = (res, msg = "", data, code) => {

    if (code >= 400)
        return res.status(code).json({
            status: "fail",
            msg,
            data,
        })

    return res.status(code).json({
        status: "success",
        msg,
        data
    })
}

module.exports = {
    response
}