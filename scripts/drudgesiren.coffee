# Description:
#   Checks if some serious shit is going down on drudgereport.com
#
# Author:
#   awentzonline

jsdom = require("jsdom")


inStateOfEmergency = false
lastHeadline = "No headline"
outputRoom = process.env.HUBOT_DRUDGESIREN_ROOM or "general"
pollDelay = parseInt(process.env.HUBOT_DRUDGESIREN_POLL) or 120 # seconds


checkSiren = (robot, emergencyRegexp) ->
  robot.http("http://drudgereport.com").get() (err, res, body) ->
    doc = jsdom.jsdom(body, {
      features: {
        FetchExternalResources: [],
        ProcessExternalResources: false,
        QuerySelector: true
      }
    })
    headline = doc.querySelector("#drudgeTopHeadlines tt center font").textContent.trim()
    if body.match(emergencyRegexp)
      if lastHeadline != headline
        robot.messageRoom outputRoom, "#{headline} http://drudgereport.com/siren.gif"
      inStateOfEmergency = true
    else
      if inStateOfEmergency
        robot.messageRoom outputRoom, "According to drudgereport.com, the state of emergency has passed."
      inStateOfEmergency = false
    lastHeadline = headline

module.exports = (robot) ->
  pollInteval = setInterval () ->
    checkSiren(robot, /siren\.gif/i)
  , pollDelay * 1000
  # debugging
  robot.respond /drudge (.+)/i, (msg) ->
    checkSiren(robot, new RegExp(msg.match[1], "ig"))
