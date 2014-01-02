expect = require 'expect.js'
Module = require '../src/lib/Module'

classProperties =
  find: (id) ->
    "found #{id}"
  create: (attrs) ->
    for key, val of attrs
      "created #{key}: #{val}"

instanceProperties =
  save: (id) ->
    "saved #{id}"

class User extends Module
  @extend classProperties
  @include instanceProperties


describe 'Module', ->
  it 'should be defined', ->
    expect(Module).not.to.be undefined

  describe 'Extend', ->
    it 'should add properties and methods directly to the class', ->
      id = Math.random()
      obj = {key0: 'value 1', key1: 'value 2'}
      expect(User.find id).to.contain(id)
      expect(User.create(obj)[1]).to.contain(obj.key1)
  describe 'Include', ->
    it 'should add props and methods to the new instance', ->
      user = new User
      id = 'teddy'
      expect(user.save id).to.contain(id)


  

