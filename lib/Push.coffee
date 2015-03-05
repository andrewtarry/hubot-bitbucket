Push = require './entity/Push'
Repository = require './entity/Repository'
File = require './entity/File'
Commit = require './entity/Commit'

# Push actions will handle the incoming request and allow build an entity
pushActions =

  # Build a repository from the api input
  buildRepo: (input) ->
    url = input.canon_url
    repoData = input.repository

    new Repository "#{url}#{repoData.absolute_url}", repoData.name, repoData.slug

  # Build a single from from the array of files returned
  buildFile: (fileInput) ->
    new File fileInput.file, fileInput.type

  # Build a commit entity from the api data
  buildCommit: (input) ->
    commit = new Commit input.author, input.branch, input.message

    for fileData in input.files
      commit.addFile @buildFile fileData

    commit

  # Parse an incoming bitbucket hook
  parse: (input) ->

    repo = @buildRepo input
    push = new Push repo

    for commitData in input.commits
      push.addCommit @buildCommit commitData

    push

module.exports = pushActions
