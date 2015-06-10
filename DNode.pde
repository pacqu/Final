class DNode<E>{
  
  E data;
  DNode<E> next;
  
  DNode( E d ) {
    data = d;
  }
  
  String toString() {
    return "" + data;
   }
    
  void setData( E c ) {
    data = c;
   }
   
  void setNext( DNode<E> n ) {
    next = n;
  }
  
  E getData() {
    return data;
  }
  
  DNode<E> getNext() {
    return next;
  }
}  

