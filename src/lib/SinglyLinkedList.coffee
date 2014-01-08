node = (data, next) ->
  data: data
  next: next

class SinglyLinkedList
  constructor: (dataItems=[]) ->
    @head = null
    @tail = null
    @length = 0
    @push item for item in dataItems
    return @


  at: (position) ->
    if -1 < position < @length
      if position is (@length - 1)
        return @tail
      else
        current = @head
        i = 0
        while i < position
          current = current.next
          i += 1
        return current


  push: (data) ->
    newNode = node(data)
    if @head is null
      @head = newNode
      @tail = newNode
    else
      @tail.next = newNode
    @length += 1
    return newNode


  insertAfter: (position, data) ->
    current = @at(position)
    if current
      newNode = node(data)
      newNode.next = current.next
      current.next = newNode
      @length += 1
      return newNode


  insertBeginning: (data) ->
    newNode = node(data)
    newNode.next = @head
    @head = newNode
    @length += 1
    return newNode


  removeAfter: (position) ->
    current = @at(position)
    if current
      oldNode = current.next
      current.next = current.next.next
      @length -= 1
      return oldNode


  removeBeginning: ->
    oldNode = @head
    @head = @head.next
    @length -= 1
    return oldNode


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
