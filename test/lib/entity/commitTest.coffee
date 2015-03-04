expect = require('chai').expect
Commit = require '../../../lib/entity/Commit'

describe 'Commit entity', ->

  it 'should be defined', ->
    expect(Commit).to.not.be.undefined
