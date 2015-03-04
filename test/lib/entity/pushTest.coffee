expect = require('chai').expect
Push = require '../../../lib/entity/Push'

describe 'Push entity', ->

  it 'should be defined', ->
    expect(Push).to.not.be.undefined

  it 'should have a repo in the constructor', ->
    repoMock = 'myRepo'

    push = new Push repoMock

    expect(push.repo).to.equal repoMock

  it 'should have an empty list of commits', ->
    push = new Push

    expect(push.commits).to.have.length 0

  it 'should add commits', ->
    push = new Push
    push.addCommit 'commit'

    expect(push.commits).to.have.length 1
