expect = require 'expect.js'
porkypine = require('../index').porkypine
LinkedList = porkypine.SinglyLinkedList


getRandomInt = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min


describe 'Singly Linked List', ->
  it 'should be defined', ->
    expect(LinkedList).not.to.be undefined

describe '[new] Linked List', ->
  range = [0..getRandomInt(1, 100)]
  ll1 = new LinkedList
  ll2 = new LinkedList range
  it 'should be an instance of SinglyLinkedList', ->
    expect(ll1).to.be instanceof LinkedList
  it 'should have a length equal to the number of added values', ->
    ll1.add n for n in range
    expect(ll1.length).to.equal range.length
  it 'should accept an arbitrary number of arguments', ->
    expect(ll2.length).to.equal range.length

