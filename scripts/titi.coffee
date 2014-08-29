# Description:
#   Titi me is the most important thing in your life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot titi me - get a titi
#   hubot titi bomb - get 5 titis

uniqueRandom = require 'unique-random'

IMAGES = [
  'http://i.imgur.com/sZlwn0S.jpg',
  'http://i.imgur.com/wB8JhMJ.jpg',
  'http://i.imgur.com/ejcOMTH.jpg',
  'http://i.imgur.com/sg0jP8j.jpg',
  'http://i.imgur.com/8aEHgjW.jpg',
  'http://i.imgur.com/w7LlAXk.jpg',
  'http://i.imgur.com/r5TMdbb.jpg',
  'http://i.imgur.com/ZG4tzuH.jpg',
  'http://i.imgur.com/ncyfUFS.jpg',
  'http://i.imgur.com/hp0TTbv.jpg',
  'http://i.imgur.com/QMXKFrJ.jpg',
  'http://i.imgur.com/XbebxMA.jpg',
  'http://i.imgur.com/DtS6qbV.jpg',
  'http://i.imgur.com/u9aZEdF.jpg',
  'http://i.imgur.com/VcKFGE8.jpg',
  'http://i.imgur.com/VCtlLaA.jpg',
  'http://i.imgur.com/DqeHUVu.jpg',
  'http://i.imgur.com/4RvrTXw.jpg',
  'http://i.imgur.com/lyYz0Mo.jpg',
  'http://i.imgur.com/hxuxu90.jpg',
  'http://i.imgur.com/ncJh8SR.jpg',
  'http://i.imgur.com/yAUZzVQ.jpg',
  'http://i.imgur.com/fWAVYSp.jpg',
  'http://i.imgur.com/vWRy1qC.jpg',
  'http://i.imgur.com/T659eYx.jpg',
  'http://i.imgur.com/zKfmc4V.jpg',
  'http://i.imgur.com/VUAAWbs.jpg',
  'http://i.imgur.com/5KFaxcn.jpg',
  'http://i.imgur.com/qX4uPkO.jpg',
  'http://i.imgur.com/AerzlHZ.jpg',
  'http://i.imgur.com/Y3xV96K.jpg',
  'http://i.imgur.com/vWOK0LI.jpg',
  'http://i.imgur.com/KPszWLu.jpg',
  'http://i.imgur.com/Cf1onxg.jpg',
  'http://i.imgur.com/ckeGwrZ.jpg',
  'http://i.imgur.com/qLjZcCc.jpg',
  'http://i.imgur.com/fIICbMz.jpg',
  'http://i.imgur.com/gqMe4mk.jpg',
  'http://i.imgur.com/5SJBMyo.jpg',
  'http://i.imgur.com/qzhCxH1.jpg',
  'http://i.imgur.com/Mw6GeqH.jpg',
  'http://i.imgur.com/j6GfoYv.jpg',
  'http://i.imgur.com/FDHqftr.jpg',
  'http://i.imgur.com/5ChWHt6.jpg',
  'http://i.imgur.com/aBstXVL.jpg',
  'http://i.imgur.com/zjGoHRz.jpg',
  'http://i.imgur.com/OURDpxc.jpg',
  'http://i.imgur.com/k7XNAEr.jpg',
  'http://i.imgur.com/zkySJvU.jpg',
  'http://i.imgur.com/oReG7am.jpg',
  'http://i.imgur.com/VN108nk.jpg',
  'http://i.imgur.com/TrnCACs.jpg',
  'http://i.imgur.com/9nXdo6S.jpg',
  'http://i.imgur.com/BrHwt58.jpg',
  'http://i.imgur.com/GhyKtrp.jpg',
  'http://i.imgur.com/gY9BWj9.jpg',
  'http://i.imgur.com/WH2mTp0.jpg',
  'http://i.imgur.com/WhwCMR2.jpg',
  'http://i.imgur.com/fsffmvi.jpg',
  'http://i.imgur.com/c9XnffO.jpg'
]

module.exports = (robot) ->
  robot.respond /titi me/i, (msg) ->
    msg.send IMAGES[uniqueRandom(0, IMAGES.length)()]

  robot.respond /titi bomb/i, (msg) ->
    rand = uniqueRandom 0, IMAGES.length

    for [1..5]
      msg.send IMAGES[rand()]
