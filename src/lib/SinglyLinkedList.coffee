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
      if position is 0
        return @head
      else if position is (@length - 1)
        return @tail
      else
        current = @head.next
        i = 1
        while i < position
          current = current.next
          i += 1
        return current


  push: (dataItem) ->
    newNode = node(dataItem)
    if @head is null
      @head = newNode
      @tail = newNode
    else
      @tail.next = newNode
      @tail = newNode
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
      if position is @length
        @tail = current
      return oldNode


  removeBeginning: ->
    oldNode = @head
    @head = @head.next
    @length -= 1
    if @length is 0
      @tail = @head
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
