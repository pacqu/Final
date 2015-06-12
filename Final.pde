//Final Project by Christopher Liang, Justin Pacquing, and Jeffrey Zou
import java.io.*;

int speed=1;
int numberOfWords;
int score; //1 per word

float time;

String state; //"MENU", "PLAY", "OPTIONS", "CREDITS"
String difficulty; //"NOOB", "HARD", "IMPOSSIBLE"
String mode = "NORMAL";
String typeProgress;
String wordFile;
ArrayList<String> allWords;
Word[] onScreen;
Queue toDrop;
Stack mostRecent;
int currX;
int currY;

void setup() {
  size(750,750);
  state = "MENU";
  wordFile = "words_full.txt";
  typeProgress = "a";
}

void draw() {
  if (state.equals("MENU")) {
    stateMenu();
  } 
  else if (state.equals("PLAY")) {
    statePlay();
    /*
    else if (mode.equals("TIMED"))
    */
  } 
  else if (state.equals("OPTIONS")) {
    stateOptions();
  }
  
  else if (state.equals("CREDITS")) {
    stateCredits();
  }
}

void stateMenu() {
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
void statePlay() {
  if (mode.equals("NORMAL")) {  
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
}
void stateOptions() {
  println(typeProgress);
}

void stateCredits() {
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

void setToDrop(){
  getAllWords();
  for (int i = 0; i < 5; i++){
    toDrop.enqueue(allWords.remove(random(allWords.size())));
  }
}
  //drop: takes from Queue and initiates into game
  //calls to drop are delayed 

void drop(){
  String curr = (String) toDrop.dequeue();
  Word currWord = new Word(random(width), 100, curr, 16);
  //100 to be changed, should be start of "drop region"
  toDrop.enqueue(allWords.remove(random(allWords.size())));
}
  
  //fall: input a Word object, changes y-coordinate
void fall(Word w){
  w.addToY(50);
  if (w.getY() <= 200) //WE NEED TO DEFINE BOUNDS OF 'FALLING' REGION
    //whatever penalties for not getting word in time
    return;
}
  //keyPressed:
void keyPresed(){
   if((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')){
     typeProgress += key;
     typeProgress = typeProgress.toLowerCase();
   }
   else if (key == ENTER || key == RETURN)
     //check whether typeProgress is word in list, if is remove and add to score;
     typeProgress = "";
}

