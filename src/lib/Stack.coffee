SinglyLinkedList = require './SinglyLinkedList'

class Stack extends SinglyLinkedList
  # replace add (FIFO) behavior with @insertBeginning (LIFO)
  # to match Stack spec when initiating,
  # e.g. new Stack([1, 2, 3, 4]) => [4, 3, 2, 1]
  add: (data) ->
    @insertBeginning data


  push: (data) ->
    @insertBeginning data


  pop: ->
    oldHead = @head
    @removeBeginning()
    return oldHead


  peek: ->
    @head


module.exports = Stack