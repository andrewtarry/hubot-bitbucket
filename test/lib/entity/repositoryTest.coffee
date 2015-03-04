expect = require('chai').expect
Repository = require '../../../lib/entity/Repository'

describe 'Repository entity', ->

  it 'should be defined', ->
    expect(Repository).to.not.be.undefined

  it 'should set values', ->
    url = 'url'
    name = 'name'
    slug = 'slug'

    repo = new Repository url, name, slug

    expect(repo.url).to.equal url
    expect(repo.name).to.equal name
    expect(repo.slug).to.equal slug
