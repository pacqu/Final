class Queue {  
  DNode<Object> front;
  DNode<Object> back;
  int size;

  Queue() {
    front = back = null;
    size = 0;
  }

  void enqueue(Object o) {
    DNode<Object> newBack = new DNode<Object>(o);
    if (size == 0)
      front = back = newBack;
    else {
      back.setNext(newBack);
      back = back.getNext();
    }
    size++;
  }

  Object dequeue() {
    if (front == null)
      return null;  
    Object re = front.getData();
    front = front.getNext();
    size--;
    return re;
  }

  Object peek() {
    return front.getData();
  }

  boolean isEmpty() {
    return size == 0;
  }
}

