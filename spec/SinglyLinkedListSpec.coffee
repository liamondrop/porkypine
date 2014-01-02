expect = require 'expect.js'
LinkedList = require('../index').SinglyLinkedList

log = (ll) ->
  console.log ll.toString()

randBetween = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min


describe 'Singly Linked List', ->
  it 'should be defined', ->
    expect(LinkedList).not.to.be undefined

  describe 'Create [new] Linked List', ->
    range = [0..randBetween(1, 100)]
    ll1 = new LinkedList
    ll2 = new LinkedList range
    it 'should be an instance of SinglyLinkedList', ->
      expect(ll1).to.be instanceof LinkedList
    it 'should accept an arbitrary number of arguments', ->
      expect(ll2.length).to.equal range.length
    it 'should have a length equal to the number of added items', ->
      ll1.add n for n in range
      expect(ll1.length).to.equal range.length

  describe 'LinkedList.head', ->
    range = [randBetween(1, 20)..randBetween(21, 100)]
    ll = new LinkedList range
    it 'should be the first node in the list', ->
      expect(ll.head.data).to.equal(range[0])

  describe 'LinkedList.length', ->
    range = [randBetween(1, 20)..randBetween(21, 100)]
    ll = new LinkedList range
    it 'should equal the number of items added to the list', ->
      expect(ll.length).to.equal(range.length)

  describe 'LinkedList.at', ->
    range = [randBetween(1, 20)..randBetween(21, 100)]
    ll = new LinkedList range
    it 'should retrieve a node at the given index', ->
      expect(ll.at(0).data).to.equal range[0]
      expect(ll.at(1).data).to.equal range[1]

  describe 'LinkedList.add', ->
    ll = new LinkedList [1, 2, 3, 4]
    it 'should push a new node onto the end of the list', ->
      data = 5
      ll.add data
      expect(ll.at(ll.length - 1).data).to.equal data
      log ll
    it 'should be possible to add any data type', ->
      ll.add [{1, 2, 3}, [101, 202, 303]]
      ll.add 'test data'
      ll.add /[^A-Z]/gi
      ll.add Infinity
      ll.add NaN
      ll.add ->
      log ll

  describe 'LinkedList.insertAfter', ->
    ll = new LinkedList [1, 2, 3, 4]
    it 'should insert data after the given index', ->
      index = 2
      data = 'test data'
      ll.insertAfter index, data
      expect(ll.at(index + 1).data).to.equal data
      expect(ll.at(index).next.data).to.equal data
      log ll
    it 'should increment the length by 1', ->
      expect(ll.length).to.equal 5
    it 'should return undefined if index is outside of list bounds', ->
      index = 10
      data = 'test data'
      expect(ll.insertAfter index, data).to.equal undefined

  describe 'LinkedList.insertBeginning', ->
    ll = new LinkedList [1, 2, 3, 4]
    oldHead = ll.head
    it 'should insert a new node at the beginning of the list', ->
      data = 'test data'
      ll.insertBeginning data
      expect(ll.head.data).to.equal data
      log ll
    it 'should increment the length by 1', ->
      expect(ll.length).to.equal 5
    it 'should move the old head to the second position in the list', ->
      expect(ll.head.next).to.equal oldHead
      expect(ll.at(1)).to.equal oldHead

  describe 'LinkedList.removeAfter', ->
    ll = new LinkedList [1, 2, 3, 4]
    it 'should remove data after the given index', ->
      index = 1
      ll.removeAfter index
      expect(ll.at(index + 1).data).to.equal 4
      expect(ll.at(index).next.data).to.equal 4
      log ll
    it 'should decrement the length', ->
      expect(ll.length).to.equal 3
    it 'should return undefined if index is >= to list.length', ->
      index = 10
      expect(ll.removeAfter index).to.equal undefined

  describe 'LinkedList.removeBeginning', ->
    ll = new LinkedList [1, 2, 3, 4]
    it 'should remove the first node of the list', ->
      data = 'test data'
      ll.removeBeginning()
      expect(ll.at(0).data).to.equal 2
      expect(ll.head.data).to.equal 2
      expect(ll.head.next.data).to.equal 3
      log ll
    it 'should decrement the length', ->
      expect(ll.length).to.equal 3

