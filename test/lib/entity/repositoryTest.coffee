expect = require('chai').expect
Repository = require '../../../lib/entity/Repository'

describe 'Repository entity', ->

  it 'should be defined', ->
    expect(Repository).to.not.be.undefined

  it 'should set values', ->
    url = 'url'
    name = 'name'
    fullName = 'fullName'

    repo = new Repository url, name, fullName

    expect(repo.url).to.equal url
    expect(repo.name).to.equal name
    expect(repo.fullName).to.equal fullName
