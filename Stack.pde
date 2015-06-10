class Stack{  
  LNode<Object> front;
  
  Stack(){
    front = new LNode<Object>('\u0000');
  }
    
  void push(Object o){
    LNode<Object> newFront = new LNode<Object>(o);
    newFront.setNext(front);
    front = newFront;
  }
    
  Object pop(){
    Object re = front.getData();
    front = front.getNext();
    return re;
  }
}
