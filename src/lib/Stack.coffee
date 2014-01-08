SinglyLinkedList = require './SinglyLinkedList'

class Stack extends SinglyLinkedList
  # replace push (FIFO) behavior with @insertBeginning (LIFO)
  # to match Stack spec when initiating,
  # e.g. new Stack([1, 2, 3, 4]) => [4, 3, 2, 1]
  push: (dataItem) ->
    @insertBeginning(dataItem)


  pop: ->
    @removeBeginning()


  peek: ->
    @head


module.exports = Stack