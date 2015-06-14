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
    highlight = "";  
  }
  
  void setHighlight(String progress) {
    for (int i = 0; i < progress.length(); i++)
      if (progress.charAt(i) != txt.charAt(i)){
        highlight = "";
        return;
      }
    highlight = progress;
    //for (int j = (progress.length() - 1 ); j < txt.length(); j++)
      //highlight += " ";  
  } 
  float getY(){
    return y;
  }
  
  String getTxt(){
    return txt;
  }
  
  void addToY(float sub) {
    y += sub;
  }
  
  void display() {
    fill(255);
    textSize(txtSize + 3);
    for (int i = 0; i < highlight.length(); i++)
      text(highlight.charAt(i), x + (i*(txtSize/2)), y);    
    fill(100);
    for (int j = highlight.length(); j < txt.length(); j++)
      text(txt.charAt(j), x + (j*(txtSize/2)) , y);
  }
}


