# A commit against a bitbucket repo
class Commit

  # Set up the basic values of a commit
  #
  # @param @author The name of the commit author
  # @param @branch The branch of the commit
  # @param @message The message of the commit
  # @param @files[] The array of files that have been changed
  constructor: (@author, @branch, @message, @files = []) ->

  # Add a new file to the commit
  addFile: (file) ->
    @files.push file


module.exports = Commit
