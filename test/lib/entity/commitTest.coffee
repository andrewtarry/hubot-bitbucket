expect = require('chai').expect
Commit = require '../../../lib/entity/Commit'

describe 'Commit entity', ->

  it 'should be defined', ->
    expect(Commit).to.not.be.undefined

  it 'should use required constructor args', ->
    author  = 'author'
    branch  = 'branch'
    message = 'message'
    url     = 'https://bitbucket.org/user/repo/commits/03f4a7270240708834de475bcf21532d6134777e'
    commit = new Commit author, branch, message, url

    expect(commit.author).to.equal author
    expect(commit.branch).to.equal branch
    expect(commit.message).to.equal message
    expect(commit.url).to.equal url
