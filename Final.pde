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
    text("Hello Bitches",175,335);
    textSize(20);
    rectMode(CENTER);
    if ((275 <= mouseX && mouseX <= 475) && (350 <= mouseY && mouseY <= 450))
      fill(10,10,10);
    else 
      fill(255);
    rect(375,400,200,50);
    if ((275 <= mouseX && mouseX <= 475) && (400 <= mouseY && mouseY <= 500))
      fill(10,10,10);
    else 
      fill(255);
    rect(375,475,200,50);
    if ((275 <= mouseX && mouseX <= 475) && (400 <= mouseY && mouseY <= 550))
      fill(10,10,10);
    else 
      fill(255);
    rect(375,550,200,50);
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
