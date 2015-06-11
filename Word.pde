//for visual representation of words
class Word {
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
}


