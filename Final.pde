//Final Project by Christopher Liang, Justin Pacquing, and Jeffrey Zou

String state; //"MENU", "PLAY", "OPTIONS", "CREDITS"
String typeProgress;
ArrayList<String> allWords;
//Queue for words to be dropped
//Stack for words already typed

void setup() {
  size(960,1080);
  state = "MENU";
}

void draw() {
  if (state.equals("MENU")) {
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
