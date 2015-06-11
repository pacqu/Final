//Final Project by Christopher Liang, Justin Pacquing, and Jeffrey Zou
import java.io.*;

int speed;
int numberOfWords;
int score; //1 per word

float time;

String state; //"MENU", "PLAY", "OPTIONS", "CREDITS"
String difficulty; //"NOOB", "HARD", "IMPOSSIBLE"
String typeProgress;
String wordFile;
ArrayList<String> allWords;
Word[] onScreen;
Queue toDrop;
Stack mostRecent;

void setup() {
  size(750,750);
  state = "MENU";
  wordFile = "test.txt";
  getAllWords();
}

void draw() {
  int currX;
  int currY;
  if (state.equals("MENU")) {
    textSize(64);
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
    background(0, 0, 0);
    fill(0,255,0);
    text("This game", width/2, height/2-100);
    textSize(20);
    if ((width/2-100 <= mouseX && mouseX <= width/2+100) && (height/2+25 <= mouseY && mouseY <= height/2+75))
      fill(0, 0, 255);
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
    textSize(64);
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
    background(0, 0, 0);
    text("Select Difficulty", width/2, height/2-100);
    textSize(20);
    if ((width/2-100 <= mouseX && mouseX <= width/2+100) && (height/2+25 <= mouseY && mouseY <= height/2+75))
      fill(25, 25, 112);
    else 
      fill(255);
    //rect(width/2, height/2 + 50, 200, 50);
    text("Noob", width/2, height/2+50);
    if ((width/2 - 100 <= mouseX && mouseX <= width/2+100) && (height/2+100 <= mouseY && mouseY <= height/2+150))
      fill(104, 34, 139);
    else 
      fill(255);
    //rect(width/2, height/2 + 125, 200, 50);
    text("Hard", width/2, height/2+125);
    if ((width/2-100 <= mouseX && mouseX <= width/2+100) && (height/2+175 <= mouseY && mouseY <= height/2+225))
      fill(255, 0, 255);
    else 
      fill(255);
    //rect(width/2, height/2 + 200, 200, 50);
    text("Impossible", width/2, height/2+200);
    fill(255);
    if ((width/2-100 <= mouseX && mouseX <= width/2+100) && (height/2+250 <= mouseY && mouseY <= height/2+300))
      fill(192,192,192);
    else
      fill(255);
    text("Back", width/2, height/2+275);
    fill(255);

    if (mousePressed && mouseButton == LEFT) {
      currX = mouseX;
      currY = mouseY;
      if ((width/2-100 <= currX && currX <= width/2+100) && (height/2+25 <= currY && currY <= height/2+75))
        difficulty = "NOOB";
      else if ((width/2 - 100 <= currX && currX <= width/2+100) && (height/2+100 <= currY && currY <= height/2+150))  
        difficulty = "HARD";
      else if ((width/2-100 <= currX && currX <= width/2+100) && (height/2+175 <= currY && currY <= height/2+225))
        difficulty = "IMPOSSIBLE";
      else if ((width/2-100 <= currX && currX <= width/2+100) && (height/2+225 <= currY && currY <= height/2+300))
        state = "MENU";
    }
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
}

  static ArrayList<String> getWords(String fileName){
    ArrayList<String> re = new ArrayList<String>();
    try{
        FileReader reader = new FileReader(fileName);
        BufferedReader buffRead = new BufferedReader(reader);
        String a = buffRead.readLine();
        while (a != null){
      re.add(a);
      a = buffRead.readLine();
        }
    }
    catch(FileNotFoundException ex) {
        System.out.println( "Err: File Not Found" );
    }
    catch(IOException ex) { 
        System.out.println( "Err: IO" );
    }
    return re;
  }
  
  void getAllWords(){
    allWords = getWords(wordFile);
  }
  
  //drop: takes from Queue and initiates into game
  //calls to drop are delayed 
  
  //fall: input a Word object, changes y-coordinate
  
  //keyPressed:



