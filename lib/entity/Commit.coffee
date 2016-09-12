# A commit against a bitbucket repo
class Commit

  # Set up the basic values of a commit
  #
  # @param @author The name of the commit author
  # @param @branch The branch of the commit
  # @param @message The message of the commit
  # @param @url The URL to the commit
  constructor: (@author, @branch, @message, @url) ->

module.exports = Commit
