node = (data, next) ->
  data: data
  next: next

class SinglyLinkedList
  constructor: (dataItems=[]) ->
    @head = null
    @length = 0
    @push item for item in dataItems
    return @


  at: (index) ->
    if -1 < index < @length
      current = @head
      i = 0
      while i < index
        current = current.next
        i += 1
      return current


  push: (data) ->
    newNode = node(data)
    if @head is null
      @head = newNode
    else
      current = @at(@length-1)
      current.next = newNode
    @length += 1
    return @


  insertAfter: (index, data) ->
    current = @at index
    if current
      newNode = node(data)
      newNode.next = current.next
      current.next = newNode
      @length += 1
      return @


  insertBeginning: (data) ->
    newNode = node(data)
    newNode.next = @head
    @head = newNode
    @length += 1
    return @


  removeAfter: (index) ->
    current = @at(index)
    if current
      current.next = current.next.next
      @length -= 1
      return @


  removeBeginning: ->
    @head = @head.next
    @length -= 1
    return @


  toArray: ->
    current = @head
    arr = []
    while current
      arr.push(current.data)
      current = current.next
    return arr


  toString: ->
    @toArray().toString()


module.exports = SinglyLinkedList
