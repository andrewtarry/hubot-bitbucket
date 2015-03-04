Push = require './entity/Push'
Repository = require './entity/Repository'
File = require './entity/File'
Commit = require './entity/Commit'

pushActions =

  # Build a repository from the api input
  buildRepo: (input) ->
    url = input.canon_url
    repoData = input.repository

    new Repository "#{url}#{repoData.absolute_url}", repoData.name, repoData.slug

  # Build a single from from the array of files returned
  buildFile: (fileInput) ->
    new File fileInput.file, fileInput.type

  buildCommit: (input) ->

    commit = new Commit

    commit

  parse: (input) ->

    repo = @buildRepo input
    push = new Push repo

    push

module.exports = pushActions
