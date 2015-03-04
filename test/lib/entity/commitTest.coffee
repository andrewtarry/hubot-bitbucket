expect = require('chai').expect
Commit = require '../../../lib/entity/Commit'

describe 'Commit entity', ->

  it 'should be defined', ->
    expect(Commit).to.not.be.undefined

  it 'should use required constructor args', ->
    author = 'author'
    branch = 'branch'
    message = 'message'
    commit = new Commit author, branch, message

    expect(commit.author).to.equal author
    expect(commit.branch).to.equal branch
    expect(commit.message).to.equal message

  it 'should have a default empty file array', ->
    commit = new Commit

    expect(commit.files).to.have.length 0

  it 'should add files to the array', ->
    commit = new Commit
    commit.addFile 'file'

    expect(commit.files).to.have.length 1
