SinglyLinkedList = require './SinglyLinkedList'

class Queue extends SinglyLinkedList
  enqueue: (data) ->
    @push(data)


  dequeue: ->
    @removeBeginning()


module.exports = Queue