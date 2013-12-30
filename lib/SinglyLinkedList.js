function SinglyLinkedList() {
  this._head = null;
  this._size = 0;
}

SinglyLinkedList.prototype.add = function (data) {
  var current,
    node = {
    data: data,
    next: null
  };

  if (null === this._head) {
    this._head = node;
  } else {
    current = this._head;
    while (null !== current.next) {
      current = current.next;
    }
    current.next = node;
  }
  
  this._size += 1;
};

SinglyLinkedList.prototype.remove = function (index) {
  if (-1 < index && index < this._size) {
    var current = this._head;
    var i = 0, prev;
    if (0 === index) {
      this._head = current.next;
    } else {
      while (index > i) {
        prev = current;
        current = current.next;
        i += 1;
      }
      prev.next = current.next;
    }
    this._size -= 1;
    return current;
  }
};

SinglyLinkedList.prototype.at = function (index) {
  if (-1 < index && index < this._size) {
    var current = this._head;
    var i = 0;
    while (index > i) {
      current = current.next;
      i += 1;
    }
    return current;
  }
};

module.exports = SinglyLinkedList;

// , size:function() {
//   return this._length;
// }, toArray:function() {
//   for (var b = [], a = this._head;a;) {
//     b.push(a.data), a = a.next;
//   }
//   return b;
// }, toString:function() {
//   return this.toArray().toString();
// }};