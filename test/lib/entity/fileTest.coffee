expect = require('chai').expect
File = require '../../../lib/entity/File'

describe 'File entity', ->

  it 'should be defined', ->
    expect(File).to.not.be.undefined

  it 'should use constructor arguments', ->
    filename = 'name'
    type = 'addition'

    file = new File filename, type

    expect(file.filename).to.equal filename
    expect(file.type).to.equal type
