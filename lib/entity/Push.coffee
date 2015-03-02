class Push

  # @param @repo Repository the push was against
  constructor: (@repo) ->
    @commits = []

  # Add a new commit
  addCommit: (commit) ->
    @commits.push commit

module.exports = Push