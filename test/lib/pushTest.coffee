expect = require('chai').expect
actions = require '../../lib/Push'
Push = require '../../lib/entity/Push'
Repo = require '../../lib/entity/Repository'
Commit = require '../../lib/entity/Commit'

describe 'Push actions entity', ->

  it 'should be defined', ->
    expect(actions).to.not.be.undefined

  input = require('./req.json')

  describe 'buildRepo',  ->

    it 'should build a repository object', ->
      repo = actions.buildRepo input

      expect(repo).to.be.an.instanceof Repo
      expect(repo.url).to.equal 'https://bitbucket.org/marcus/project-x'
      expect(repo.name).to.equal 'project-x'
      expect(repo.fullName).to.equal 'marcus/project-x'

  describe 'buildCommit', ->

    input = require('./req.json')
    changeData = input['push']['changes'][0]
    commitData = changeData['commits'][0]

    commit = null

    beforeEach ->
      commit = actions.buildCommit changeData, commitData

    it 'should be an instance of Commit', ->
      expect(commit).to.be.an.instanceof Commit

    it 'should have correct values', ->
      expect(commit.author).to.equal 'marcus'
      expect(commit.branch).to.equal 'master'
      expect(commit.message).to.equal "Added some more things to somefile.py"

  describe 'parse', ->

    push = null

    beforeEach ->
      push = actions.parse input

    it 'should be instance of push', ->
      expect(push).to.be.an.instanceof Push

    it 'should have a valid repo', ->
      repo = push.repo

      expect(repo).to.be.an.instanceof Repo
      expect(repo.url).to.equal 'https://bitbucket.org/marcus/project-x'
      expect(repo.name).to.equal 'project-x'
      expect(repo.fullName).to.equal 'marcus/project-x'

    it 'should have commits', ->
      expect(push.commits).to.have.length 1

      commit = push.commits[0]

      expect(commit).to.be.an.instanceof Commit
