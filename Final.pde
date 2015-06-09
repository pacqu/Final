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
  if (state.equals("MENU")) {
    background(0,0,0);
    textSize(64);
    textAlign(CENTER, CENTER);
    text("Text Game", width/2, height/2-100);
    textSize(20);
    rectMode(CENTER);
    if ((width/2-100 <= mouseX && mouseX <= width/2+100) && (height/2+25 <= mouseY && mouseY <= height/2+75))
      fill(25,25,112);
    else 
      fill(255);
    //rect(width/2, height/2 + 50, 200, 50);
    text("Play", width/2, height/2+50);
    if ((width/2 - 100 <= mouseX && mouseX <= width/2+100) && (height/2+100 <= mouseY && mouseY <= height/2+150))
      fill(104,34,139);
    else 
      fill(255);
    //rect(width/2, height/2 + 125, 200, 50);
    text("Options", width/2, height/2+125);
    if ((width/2-100 <= mouseX && mouseX <= width/2+100) && (height/2+175 <= mouseY && mouseY <= height/2+225))
      fill(255,0,255);
    else 
      fill(255);
    //rect(width/2, height/2 + 200, 200, 50);
    text("Credits", width/2, height/2+200);
    fill(255);
  //Draw Circle Buttons w/ text for each state
  }
  else if (state.equals("PLAY")) {
  }
  else if (state.equals("OPTIONS")) {
  }
  else if (state.equals("CREDITS")) {
  }
}

//Methods "PLAY" needs: populate words list, drop to add new words on screen, move words on screen, key pressed to 
//record letter typed, 
