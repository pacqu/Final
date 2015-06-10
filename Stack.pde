class Stack{  
  DNode<Object> front;
  
  Stack(){
    front = new DNode<Object>('\u0000');
  }
    
  void push(Object o){
    DNode<Object> newFront = new DNode<Object>(o);
    newFront.setNext(front);
    front = newFront;
  }
    
  Object pop(){
    Object re = front.getData();
    front = front.getNext();
    return re;
  }
}
