//Final Project by Christopher Liang, Justin Pacquing, and Jeffrey Zou
import java.io.*;

int speed=1;
int numberOfWords;
int score; //1 per word

float time;
int startTime;

String state; //"MENU", "PLAY", "OPTIONS", "CREDITS"
String difficulty; //"NOOB", "HARD", "IMPOSSIBLE"
String mode = "NORMAL";
String typeProgress;
String nextWord;
String wordFile;

ArrayList<String> allWords;
ArrayList<Word> onScreen;
Queue toDrop;
Stack mostRecent;
int currX;
int currY;
long completeM = 0;
int dropCount = 0;
float completeX, completeY;
int lives = 3;

void setup() {
  size(750, 750);
  state = "MENU";
  wordFile = "words.txt";
  typeProgress = "";
  onScreen = new ArrayList<Word>();
  toDrop = new Queue();
  mostRecent = new Stack();
}

void draw() {
  if (state.equals("MENU")) {
    stateMenu();
  } else if (state.equals("PLAY")) {
    if (startTime == 0) {
      startTime = second();
      time = 60;
    }
    statePlay();
  } else if (state.equals("CREDITS")) {
    stateCredits();
  } else if (state.equals("END")) {
    stateEnd();
  }
}

void stateMenu() {
  textSize(64);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  background(0, 0, 0);
  fill(0, 255, 0);
  text("This game", width/2, height/2-100);
  textSize(20);
  if ((width/2-100 <= mouseX && mouseX <= width/2+100) && (height/2+25 <= mouseY && mouseY <= height/2+75))
    fill(0, 0, 255);
  else 
    fill(255);
  //rect(width/2, height/2 + 50, 200, 50);
  text("Play", width/2, height/2+50);
  if ((width/2-100 <= mouseX && mouseX <= width/2+100) && (height/2+100 <= mouseY && mouseY <= height/2+150))
    fill(255, 0, 255);
  else 
    fill(255);
  //rect(width/2, height/2 + 200, 200, 50);
  text("Credits", width/2, height/2+125);
  fill(255);

  if (mousePressed && mouseButton == LEFT) {
    currX = mouseX;
    currY = mouseY;
    if ((width/2-100 <= currX && currX <= width/2+100) && (height/2+25 <= currY && currY <= height/2+75))
      state = "PLAY";
    else if ((width/2-100 <= currX && currX <= width/2+100) && (height/2+100 <= currY && currY <= height/2+150))
      state = "CREDITS";
  }
}

void statePlay() {
  while (difficulty == null) {
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
        fill(192, 192, 192);
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
      for (int i = 0; i < onScreen.size (); i++) {
        onScreen.get(i).setHighlight(typeProgress);
        fall(onScreen.get(i));
        onScreen.get(i).display();
      }
    }
    //code that create screen for playing
  }
  setGame();
}

/*if (((currentMillis - previousMillis) & 1) == 0) 
 //fall(onScreen.get(dropCount));
 //onScreen.get(dropCount).display();
 //dropCount++;
 */

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

ArrayList<String> getWords(String fileName) {
  ArrayList<String> re = new ArrayList<String>();
  try {
    BufferedReader buffRead = createReader(fileName);
    String a = buffRead.readLine();
    while (a != null) {
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

void getAllWords() {
  allWords = getWords(wordFile);
}

void setToDrop() {
  getAllWords();
  for (int i = 0; i < 5; i++) {
    int rem = (int) random(allWords.size());
    String en = allWords.remove(rem);
    toDrop.enqueue(en);
    nextWord = en;
  }
}
//drop: takes from Queue and initiates into game
//calls to drop are delayed 

void drop() {
  String curr = (String) toDrop.dequeue();
  Word currWord = new Word(random(20, width - 200), 100 + random(50), curr, 16);
  onScreen.add(currWord);
  //100 to be changed, should be start of "drop region"
  int rem = (int) random(allWords.size());
  String en = allWords.remove(rem);
  toDrop.enqueue(en);
}

//fall: input a Word object, changes y-coordinate
void fall(Word w) {
  w.addToY(.5);
  if (w.getY() <= 200) //WE NEED TO DEFINE BOUNDS OF 'FALLING' REGION
    //whatever penalties for not getting word in time
    return;
  else if (w.getY() > 600) {
    onScreen.remove(w);
    score -= (w.txt).length();
    lives--;
  }
}

//keyPressed:
void keyPressed() {
  //Keeps track of your progress
  if ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z') || (key == ' ')) {
    typeProgress += key;
    typeProgress = typeProgress.toLowerCase();
  } 
  //delete recent letter
  else if (key == BACKSPACE) {
    if (typeProgress.length() > 0)
      typeProgress = typeProgress.substring(0, typeProgress.length() - 1);
  } else if (key == ENTER || key == RETURN) {
    float m = millis();
    for (int i = 0; i < onScreen.size (); i++) {
      if ((onScreen.get(i)).getTxt().equals(typeProgress)) {
        completeX = onScreen.get(i).x + 40;
        completeY = onScreen.get(i).y + 20;
        completeM = millis();
        Word rem = onScreen.remove(i);
        score += (rem.txt).length();
        mostRecent.push(rem.txt); 
        //score += 1; //This part changes depending on how we keep track of score
      }
    }
    typeProgress = "";
  }
}
void setGame() {
  if (mode.equals("TIMED")) {
    long currentMillis = millis();
    background(0);
    fill(255, 255, 255);
    stroke(0, 255, 0);
    strokeWeight(10);
    beginShape();
    vertex(5, 640);
    vertex(545, 640);
    vertex(545, 745);
    vertex(5, 745);
    endShape(CLOSE);
    stroke(255, 0, 0);
    beginShape();
    vertex(555, 640);
    vertex(745, 640);
    vertex(745, 745);
    vertex(555, 745);
    endShape(CLOSE);
    fill(255);
    textSize(30);
    text("Timer: " + (int) time, 75, 25);
    fill(0, 102, 153);
    textSize(25);
    text("Typing:", 55, 655);
    text("Score", 655, 655);
    text(score, 655, 700);
    if ((currentMillis-completeM) <= 400)
      text("+1", completeX, completeY);
    textMode(CENTER);
    textSize(50);
    text(typeProgress, 277.5, 692.5);
    getAllWords();
    setToDrop();
    textSize(14);
    fill(255);
    text("Next Word to Drop: " + toDrop.peek(),500,15);
    text("Latest Word Typed: " + mostRecent.peek(),500,30);
    if (onScreen.size() < 5) {
      drop();
    } 
    for (int i = 0; i < onScreen.size (); i++) {
      if (i <onScreen.size())
        onScreen.get(i).setHighlight(typeProgress);
      if (i <onScreen.size())
        fall(onScreen.get(i));
      if (i <onScreen.size())
        onScreen.get(i).display();
    }
    //println(startTime);
    if (second() < startTime)
      time = 60 - ( (60 + second()) - startTime  + 1);
    else
      time = 60 - ( second() - startTime + 1);
    //println(time);
    if (time <= 0 ) {
      state = "END";
      println(state);
    }
}
else {
    long currentMillis = millis();
    background(0);
    if (lives == 3) {
    stroke(136,136,136);
    line(250,25,275,50);
    line(250,50,275,25);
    line(300,25,325,50);
    line(300,50,325,25);
    line(350,25,375,50);
    line(350,50,375,25);
  }
  else if (lives == 2) {
    stroke(136,136,136);
    line(300,25,325,50);
    line(300,50,325,25);
    line(350,25,375,50);
    line(350,50,375,25);
    stroke(255,0,0);
    line(250,25,275,50);
    line(250,50,275,25);

  }
  else if (lives == 1) {
    stroke(255,0,0);
    line(250,25,275,50);
    line(250,50,275,25);
    line(300,25,325,50);
    line(300,50,325,25);
    stroke(136,136,136);
    line(350,25,375,50);
    line(350,50,375,25);
  } 

    fill(255, 255, 255);
    stroke(0, 255, 0);
    strokeWeight(10);
    beginShape();
    vertex(5, 640);
    vertex(545, 640);
    vertex(545, 745);
    vertex(5, 745);
    endShape(CLOSE);
    stroke(255, 0, 0);
    beginShape();
    vertex(555, 640);
    vertex(745, 640);
    vertex(745, 745);
    vertex(555, 745);
    endShape(CLOSE);
    fill(255);
    fill(0, 102, 153);
    textSize(25);
    text("Typing:", 55, 655);
    text("Score", 655, 655);
    text(score, 655, 700);
    if ((currentMillis-completeM) <= 400)
      text("+1", completeX, completeY);
    textMode(CENTER);
    textSize(50);
    text(typeProgress, 277.5, 692.5);
    getAllWords();
    setToDrop();
    textSize(14);
    fill(255);
    text("Next Word to Drop: " + toDrop.peek(),500,15);
    text("Latest Word Typed: " + mostRecent.peek(),500,30);
    if (onScreen.size() < 5) {
      drop();
    } 
    for (int i = 0; i < onScreen.size (); i++) {
      if (i <onScreen.size())
        onScreen.get(i).setHighlight(typeProgress);
      if (i <onScreen.size())
        fall(onScreen.get(i));
      if (i <onScreen.size())
        onScreen.get(i).display();
    }
    if (lives == 0) {
      state = "END";
      println(state);
    }
    
    }
}




void stateEnd() {
  //println("stateEnd called");
  background(0);
  fill(255);
  textSize(60);
  text("Your score was:", width/2, 100);
  text(score, width/2, 200);
  if ((width/2-100 <= mouseX && mouseX <= width/2+100) && (height/2+25 <= mouseY && mouseY <= height/2+75))
    fill(0, 0, 255);
  else 
    fill(255);
  //rect(width/2, height/2 + 50, 200, 50);
  text("Play", width/2, height/2+50);
  if ((width/2-100 <= mouseX && mouseX <= width/2+100) && (height/2+100 <= mouseY && mouseY <= height/2+150))
    fill(255, 0, 255);
  else 
    fill(255);
  //rect(width/2, height/2 + 200, 200, 50);
  text("Menu", width/2, height/2+125);
  fill(255);
  String choose = null;
  if (mousePressed && mouseButton == LEFT) {
    currX = mouseX;
    currY = mouseY;
    if ((width/2-100 <= currX && currX <= width/2+100) && (height/2+25 <= currY && currY <= height/2+75))
      choose = "PLAY";
    else if ((width/2-100 <= currX && currX <= width/2+100) && (height/2+100 <= currY && currY <= height/2+150))
      choose = "MENU";
    if (choose != null) {
      startTime = 0;
      allWords = new ArrayList<String>();
      onScreen = new ArrayList<Word>();
      toDrop = new Queue();
      mostRecent = new Stack();
      score = 0;
      typeProgress = "";  
      state = choose;
    }
  }
}

