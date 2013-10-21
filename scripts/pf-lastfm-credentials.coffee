# Description:
#   Last.fm Credentials allows you to map your user against your Last.fm user.
#   This is specifically in order to work with apps that have Last.fm Oauth
#   users.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot who do you know on lastfm - List all the users with Last.fm logins
#     tracked by Hubot
#   hubot i am `maddox` on lastfm - map your user to the Last.fm login `maddox`
#   hubot who am i on lastfm - reveal your mapped Last.fm login
#   hubot forget me on lastfm - de-map your user to your Last.fm login
#
# Author:
#   beaugunderson, based on GitHub Credentials by maddox

module.exports = (robot) ->

  robot.respond /who do you know on last(\.)?fm(\?)?$/i, (msg) ->
    theReply = "Here is who I know:\n"

    for own key, user of robot.brain.users()
      if user.lastfmLogin
        theReply += "#{user.name}"

        if user.mention_name
          theReply += " (#{user.mention_name})"

        theReply += " is #{user.lastfmLogin}:"
        theReply += " http://last.fm/user/#{user.lastfmLogin}\n"

    msg.send theReply

  robot.respond /(im|i'm|i am) ([a-z0-9-]+) on last(\.)?fm\s*$/i, (msg) ->
    lastfmLogin = msg.match[2]
    msg.message.user.lastfmLogin = lastfmLogin
    robot.brain.save()
    msg.send "Ok, you are #{lastfmLogin} on Last.fm"

  robot.respond /who am i on last(\.)?fm(\?)?$/i, (msg) ->
    user = msg.message.user
    if user.lastfmLogin
      msg.reply "You are known as #{user.lastfmLogin} on Last.fm"
    else
      msg.reply "I don't know who you are. You should probably identify yourself with your Last.fm login"

  robot.respond /forget me on last(\.)?fm/i, (msg) ->
    user = msg.message.user
    user.lastfmLogin = null

    msg.reply("Ok, I have no idea who you are anymore.")
