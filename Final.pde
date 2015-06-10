//Final Project by Christopher Liang, Justin Pacquing, and Jeffrey Zou

String state; //"MENU", "PLAY", "OPTIONS", "CREDITS"
String typeProgress;
ArrayList<String> allWords;
//Queue for words to be dropped
//Stack for words already typed

void setup() {
  size(750,750);
  state = "MENU";
}

void draw() {
  int currX;
  int currY;
  if (state.equals("MENU")) {
    textSize(64);
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
    background(0, 0, 0);
    text("NAME", width/2, height/2-100);
    textSize(20);
    if ((width/2-100 <= mouseX && mouseX <= width/2+100) && (height/2+25 <= mouseY && mouseY <= height/2+75))
      fill(25, 25, 112);
    else 
      fill(255);
    //rect(width/2, height/2 + 50, 200, 50);
    text("Play", width/2, height/2+50);
    if ((width/2 - 100 <= mouseX && mouseX <= width/2+100) && (height/2+100 <= mouseY && mouseY <= height/2+150))
      fill(104, 34, 139);
    else 
      fill(255);
    //rect(width/2, height/2 + 125, 200, 50);
    text("Options", width/2, height/2+125);
    if ((width/2-100 <= mouseX && mouseX <= width/2+100) && (height/2+175 <= mouseY && mouseY <= height/2+225))
      fill(255, 0, 255);
    else 
      fill(255);
    //rect(width/2, height/2 + 200, 200, 50);
    text("Credits", width/2, height/2+200);
    fill(255);

    if (mousePressed && mouseButton == LEFT) {
      currX = mouseX;
      currY = mouseY;
      if ((width/2-100 <= currX && currX <= width/2+100) && (height/2+25 <= currY && currY <= height/2+75))
        state = "PLAY";
      else if ((width/2 - 100 <= currX && currX <= width/2+100) && (height/2+100 <= currY && currY <= height/2+150))  
        state = "OPTIONS";
      else if ((width/2-100 <= currX && currX <= width/2+100) && (height/2+175 <= currY && currY <= height/2+225))
        state = "CREDITS";
    }
  } 
  else if (state.equals("PLAY")) {
  
} 
  else if (state.equals("OPTIONS")) {
} 
  else if (state.equals("CREDITS")) {
    textSize(64);
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
    background(0, 0, 0);
    fill(255);
    text("CREDZ", width/2, height/2 - 200);
    textSize(20);
    text("Justin Pacquing", width/2, height/2 - 50);
    text("Jeffrey Zou", width/2, height/2 );
    text("Christopher Liang", width/2, height/2 + 50);
    if ((width/2 - 100 <= mouseX && mouseX <= width/2 + 100) && (height/2 -175 <= mouseY && mouseY <= height/2 -125))
      fill(0, 0, 255);
    else 
      fill(255);
    text("Back", width/2, height/2 - 150);
    if (mousePressed && mouseButton == LEFT) {
      currX = mouseX;
      currY = mouseY;
      if ((width/2 - 100 <= currX && currX <= width/2 + 100) && (height/2 -200 <= currY && currY <= height/2 -100))
        state = "MENU";
    }
  }
  Queue q = new Queue();
  q.enqueue("Test");
  println(q.dequeue());
}

//Methods "PLAY" needs: populate words list, drop to add new words on screen, move words on screen, key pressed to 
//record letter typed, 
