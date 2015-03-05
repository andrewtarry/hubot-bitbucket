# Description:
#   Listener for commits that are pushed to bitbucket
#
# Configuration:
#   HUBOT_BITBUCKET_PUSH_URL url to listen for
#   HUBOT_BITBUCKET_PUSH_EVENT event to emit when a push is made
#
# Commands:
#   None
#
# Author:
#   andrewtarry
#
push = require '../lib/Push'

module.exports = (robot) ->

  bitbucketPushUrl = process.env.HUBOT_BITBUCKET_PUSH_URL or '/bitbucket/push'
  bitbucketPushEvent = process.env.HUBOT_BITBUCKET_PUSH_EVENT or'bitbucketPushReceived'

  # Listen for bitbucket sending a commit
  #
  # The push listener will only parse the body and emit an event to be picked
  # up elsewhere
  robot.router.post bitbucketPush, (req, res) ->

    push = push.parse req.body

    robot.emit bitbucketPushEvent,
      push: push

    res.send 'OK'
