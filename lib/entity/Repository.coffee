class Repository

  # Details of a repository that a push has been made against
  constructor: (@url, @name, @fullName) ->

module.exports = Repository
