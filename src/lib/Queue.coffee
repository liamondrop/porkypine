SinglyLinkedList = require './SinglyLinkedList'

class Queue extends SinglyLinkedList
  enqueue: (dataItem) ->
    @push(dataItem)


  dequeue: ->
    @removeBeginning()


module.exports = Queue