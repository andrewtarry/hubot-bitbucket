Push = require './entity/Push'
Repository = require './entity/Repository'
Commit = require './entity/Commit'

# Push actions will handle the incoming request and allow build an entity
pushActions =

  # Build a repository from the api input
  buildRepo: (input) ->
    repoData = input.repository

    new Repository "#{repoData.links.html.href}", repoData.name, repoData.full_name

  # Build a commit entity from the api data
  buildCommit: (changeData, commitData) ->
    branch = if changeData.new? then changeData.new.name else changeData.old.name
    commit = new Commit commitData.author.user.username, branch, commitData.message

    commit

  # Parse an incoming bitbucket hook
  parse: (input) ->

    repo = @buildRepo input
    push = new Push repo

    for changeData in input['push']['changes']
      for commitData in changeData['commits']
        push.addCommit @buildCommit changeData, commitData

    push

module.exports = pushActions
