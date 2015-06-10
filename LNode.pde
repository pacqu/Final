class LNode<E>{
  
  E data;
  LNode<E> next;
  
  LNode( E d ) {
    data = d;
  }
  
  String toString() {
    return "" + data;
   }
    
  void setData( E c ) {
    data = c;
   }
   
  void setNext( LNode<E> n ) {
    next = n;
  }
  
  E getData() {
    return data;
  }
  
  LNode<E> getNext() {
    return next;
  }
}  

