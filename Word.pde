//for visual representation of words
float x;
float y;
String txt;

Word(float cx, float cy, String t){
  x = cx;
  y = cy;
  txt = t; 
}

void display(){
  text(txt, cx, cy);
  
}



