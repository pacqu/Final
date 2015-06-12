//for visual representation of words
class Word {
  
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
    for (int i = 0; i < progress.length(); i++)
      if (progress.charAt(i) != txt.charAt(i)){
        highlight = "";
        return;
      }
    highlight = progress;
    for (int j = (progress.length() - 1 ); j < txt.length(); j++)
      highlight += " ";  
  } 
  
  void changeY(float newY) {
    y = newY;
  }
  
  void display() {
    fill(100);
    textSize(txtSize + 1);
    text(highlight, x, y);    
    fill(0);
    textSize(txtSize);
    text(txt, x, y);
  }
}


