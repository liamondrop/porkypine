class SinglyLinkedList
  constructor: (values = []) ->
    @head = null
    @length = 0
    @add v for v in values
    return @


  add: (value) ->
    node =
      data: value
      next: null

    if @head is null
      @head = node
    else
      current = @head
      while current.next isnt null
        current = current.next
      current.next = node
    
    @length += 1
    return @


  removeAt: (index) ->
    if -1 < index < @length
      current = @head
      i = 0
      if index is 0
        @head = current.next
      else
        while i < index
          prev = current
          current = current.next
          i += 1
        prev.next = current.next

      @length -= 1

    return @


  get: (index) ->
    if -1 < index < @length
      current = @head
      i = 0
      while i < index
        current = current.next
        i += 1
      return current


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
