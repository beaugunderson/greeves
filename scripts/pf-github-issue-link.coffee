# Description:
#   Github issue link looks for #nnn and links to that issue for your default
#   repo. Eg. "Hey guys check out #273"
#   Defaults to issues in HUBOT_GITHUB_REPO, unless a repo is specified Eg. "Hey
#   guys, check out awesome-repo#273"
#
# Dependencies:
#
# Configuration:
#   HUBOT_GITHUB_API
#
# Commands:
#   repo#nnn - link to GitHub issue nnn for repo project
#   user/repo#nnn - link to GitHub issue nnn for user/repo project
#
# Notes:
#   HUBOT_GITHUB_API allows you to set a custom URL path (for Github enterprise users)
#
# Author:
#   Beau Gunderson

module.exports = (robot) ->
  robot.hear /((\S+)#(\d+)).*/, (msg) ->
    repo = msg.match[2]
    issue_number = msg.match[3]

    if isNaN(issue_number)
      return

    url = process.env.HUBOT_GITHUB_API

    msg.send "Issue #{issue_number}: #{url}/datascience/#{repo}/issues/#{issue_number}"
