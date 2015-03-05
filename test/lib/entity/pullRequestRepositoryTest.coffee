expect = require('chai').expect
PRRepo = require '../../../lib/entity/PullRequestRepository'

describe 'Pull Request Repository entity', ->

  it 'should be defined', ->
    expect(PRRepo).to.not.be.undefined

  it 'should have constructor values', ->
    repo = 'myRepo'
    commit = 'myCommit'

    prrepo = new PRRepo repo, commit

    expect(prrepo.repo).to.equal repo
    expect(prrepo.commit).to.equal commit
