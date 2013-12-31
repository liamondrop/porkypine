expect = require 'expect.js'
porkypine = require('../index').porkypine
LinkedList = porkypine.SinglyLinkedList


getRandomInt = (min, max) ->
    Math.floor(Math.random() * (max - min + 1)) + min


describe 'Singly Linked List', ->
    it 'should be defined', ->
        expect(LinkedList).not.to.be undefined

describe '[new] Linked List', ->
	ll = new LinkedList
	it 'should be an instance of SinglyLinkedList', ->
		expect(ll).to.be instanceof LinkedList
	it 'should accept an arbitrary number of arguments', ->
		range = [0..getRandomInt(1, 100)]
		ll.add n for n in range
		expect(ll.length).to.equal range.length

