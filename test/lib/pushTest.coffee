expect = require('chai').expect
actions = require '../../lib/Push'
Push = require '../../lib/entity/Push'
Repo = require '../../lib/entity/Repository'
File = require '../../lib/entity/File'
Commit = require '../../lib/entity/Commit'

describe 'Push actions entity', ->

  it 'should be defined', ->
    expect(actions).to.not.be.undefined

  input =
    canon_url: "https://bitbucket.org"
    commits: [
        {
            author: "marcus"
            branch: "master"
            files: [
                {
                    file: "somefile.py"
                    type: "modified"
                }
            ],
            message: "Added some more things to somefile.py\n",
            node: "620ade18607a",
            "parents": [
                "702c70160afc"
            ],
            "raw_author": "Marcus Bertrand <marcus@somedomain.com>",
            "raw_node": "620ade18607ac42d872b568bb92acaa9a28620e9",
            "revision": null,
            "size": -1,
            "timestamp": "2012-05-30 05:58:56",
            "utctimestamp": "2012-05-30 03:58:56+00:00"
        }
    ],
    "repository":
        "absolute_url": "/marcus/project-x/",
        "fork": false,
        "is_private": true,
        "name": "Project X",
        "owner": "marcus",
        "scm": "git",
        "slug": "project-x",
        "website": "https://atlassian.com/"
    "user": "marcus"

  describe 'buildRepo',  ->

    it 'should build a repository object', ->
      repo = actions.buildRepo input

      expect(repo).to.be.an.instanceof Repo
      expect(repo.url).to.equal 'https://bitbucket.org/marcus/project-x/'
      expect(repo.name).to.equal 'Project X'
      expect(repo.slug).to.equal 'project-x'

  describe 'buildFile', ->

    files = [
        {
            file: "somefile.py"
            type: "modified"
        }
    ]

    it 'should buld a file', ->
      file = actions.buildFile files[0]

      expect(file).to.be.an.instanceof File

    it 'should have correct values', ->
      file = actions.buildFile files[0]

      expect(file.filename).to.equal 'somefile.py'
      expect(file.type).to.equal 'modified'

  describe 'buildCommit', ->

    commit = null

    beforeEach ->
      commit = actions.buildCommit input

    it 'should be an instance of Commit', ->
      expect(commit).to.be.an.instanceof Commit

  describe 'parse', ->

    push = null

    beforeEach ->
      push = actions.parse input

    it 'should be instance of push', ->
      expect(push).to.be.an.instanceof Push

    it 'should have a valid repo', ->
      repo = push.repo

      expect(repo).to.be.an.instanceof Repo
      expect(repo.url).to.equal 'https://bitbucket.org/marcus/project-x/'
      expect(repo.name).to.equal 'Project X'
      expect(repo.slug).to.equal 'project-x'
