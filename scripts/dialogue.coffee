#  Prepare the API key then start hubot like:
# ```
# $ HUBOT_DOCOMO_DIALOGUE_API_KEY=01234abcdx bin/hubot
# ```
#
# API detail: https://dev.smt.docomo.ne.jp/?p=docs.api.page&api_name=dialogue&p_name=api_usage_scenario

module.exports = (robot) ->
  context = null

  robot.respond /(.*)/i, (res) ->
    API_KEY = process.env.HUBOT_DOCOMO_DIALOGUE_API_KEY
    API_URL = 'https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue'

    message = res.match[1]

    res.http(API_URL)
      .query(APIKEY: API_KEY)
      .header('Content-Type', 'application/json')
      .post(JSON.stringify(
        utt: message
        content: context
        t: 20
      )) (err, _, body) ->
        if err
          console.error '[dialogue.coffee]', err
          callback(utt:'あ、ごめんなんかえらった')
        else
          data = JSON.parse(body)
          reply_message = data.utt
          res.reply reply_message
          context = data.context
