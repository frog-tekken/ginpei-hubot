module.exports = (robot) ->

  robot.hear /sushi/i, (res) ->
    res.send 'やったね☆'

  robot.respond /おはよう/i, (res) ->
    res.reply 'おはよ☆'
