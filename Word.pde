//for visual representation of words
class Word {
<<<<<<< HEAD
  
  float x;
  float y;
  String highlight;
  String txt;
  int txtSize;
  
  Word(float cx, float cy, String t, int ts) {
    x = cx;
    y = cy;
    txt = t;
    txtSize = ts;  
  }
  
  void setHighlight(String progress) {
    for (int i = 0; i < prog.length; i++)
      if (prog.charAt(i) != txt.charAt(i)){
        highlight = "";
        return;
      }
    highlight = progress;  
  } 
  
  void changeY(float newY) {
    y = newY;
  }
  
  void display() {
    //fill();
    textSize(txtSize + 3);
    text(highlight, cx, cy);
    //fill();
    textSize(txtSize);
    text(txt, cx, cy);    
  }
=======
  float x;
  float y;
  String txt;

  Word(float cx, float cy, String t) {
    x = cx;
    y = cy;
    txt = t; 
  }

  void display() {
    text(txt, x, y);
  } 
>>>>>>> origin/master
}


