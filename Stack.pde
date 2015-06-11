class Stack {  
  DNode<Object> front;
  int size;
  
  Stack() {
    front = new DNode<Object>('\u0000');
    size = 0;
  }
    
  void push(Object o) {
    DNode<Object> newFront = new DNode<Object>(o);
    newFront.setNext(front);
    front = newFront;
    size++;
  }
    
  Object pop() {
    Object re = front.getData();
    front = front.getNext();
    size--;
    return re;
  }
  
  boolean isEmpty() {
    return size == 0;
  }
  
  Object peek() {
    return front.getData();
  }
}
