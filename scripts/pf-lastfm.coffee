#
# Description:
#   Last (or current) played song by a user in Last.fm
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_LASTFM_APIKEY
#
# Commands:
#   hubot what's <last FM user> playing  - Returns song name and artist
#   hubot what am I playing - only works if last.fm nick = username who typed it
#
# Author:
#   guilleiguaran
#   sn0opy
#   beaugunderson

module.exports = (robot) ->
  getUser = (name) ->
    name = name.trim().replace(/^@/, '').toLowerCase()

    for own key, user of robot.brain.users()
      if user.name == name or user.mention_name == name
        return user.lastfmLogin

    return name

  getSong = (msg, user) ->
    if not user
      user = getUser msg.match[2]

    apiKey = process.env.HUBOT_LASTFM_APIKEY

    msg.http('http://ws.audioscrobbler.com/2.0/?')
      .query(method: 'user.getrecenttracks', user: user, api_key: apiKey,
      format: 'json')

      .get() (err, res, body) ->
        results = JSON.parse(body)

        if results.error
          msg.send results.message
          return

        song = results?.recenttracks?.track?[0]

        if not song
          return msg.send "Unable to get latest song for #{user}"

        msg.send "#{song.name} by #{song.artist['#text']}"

  robot.respond /what(')?s (.*) (playing|listening to)/i, (msg) ->
    getSong(msg)

  robot.respond /what am I (playing|listening to)/i, (msg) ->
    getSong(msg, msg.message.user.lastfmLogin or msg.message.user.name)
