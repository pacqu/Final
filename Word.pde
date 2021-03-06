//for visual representation of words
class Word {

  float x;
  float y;
  String highlight;
  String txt;
  int txtSize;
  boolean pause;

  Word(float cx, float cy, String t, int ts) {
    x = cx;
    y = cy;
    txt = t;
    txtSize = ts;
    highlight = "";
  }

  void setHighlight(String progress) {
  if (!pause) {
      for (int i = 0; i < progress.length (); i++) {
        if (i < txt.length())  
          if (progress.charAt(i) != txt.charAt(i)) {
            highlight = "";
            return;
          }
        if ( i >= txt.length()) {
          highlight = "";
          return;
        }
      }
      highlight = progress;
      //for (int j = (progress.length() - 1 ); j < txt.length(); j++)
      //highlight += " ";
    } 
  }
  
  void setPause() {
    pause = !pause;
  }
  
  float getY() {
    return y;
  }
  
  float getX(){
    return x;
  }

  String getTxt() {
    return txt;
  }

  void addToY(float sub) {
    y += sub;
  }

  void display() {
    rectMode(CORNERS);
    fill(0);
    rect(x - 10, y -10, x + txt.length() * txtSize, y+ txtSize + 1);
    fill(255, 223, 0);
    textSize(txtSize);
    for (int i = 0; i < highlight.length (); i++)
      text(highlight.charAt(i), x + (i*((txtSize/2) + 5)), y);    
    fill(255, 255, 255);
    for (int j = highlight.length (); j < txt.length(); j++)
      text(txt.charAt(j), x + (j* ((txtSize/2) + 5)), y);
  }
}

