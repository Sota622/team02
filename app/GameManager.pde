class GameManager {

PImage titleImage;
PImage haikeiImage;
PImage resultImage;

final int TITLE = 0;
final int PLAY = 1;
final int RESULT = 2;

int scene = TITLE;

Timer timer;
ScoreManager score;
Trash trash;
TrashBox[] boxes;

Button startButton;
Button retryButton;
Button homeButton;
Button resumeButton;

boolean pause = false;

String[] trashNames = {
  "生ごみ",
  "ティッシュ",
  "マスク",
  "衣類",
  "割り箸",
  "フライパン",
  "乾電池",
  "空き缶",
  "ガラスびん",
  "新聞紙",
  "ペットボトル"
};
String[] trashImages = {
"生ごみ.png",
"ティッシュ.png",
"マスク.png",
"衣類.png",
"割り箸.png",
"フライパン.png",
"乾電池.png",
"空き缶.png",
"ガラスびん.png",
"新聞紙.png",
"ペットボトル.png"
};

int[] trashTypes = {
  0,
  0,
  0,
  0,
  0,
  1,
  1,
  2,
  2,
  3,
  3
};

GameManager() {

  titleImage = loadImage("title.png");
  haikeiImage = loadImage("haikei.png");
  resultImage = loadImage("結果.png");

  timer = new Timer();
  score = new ScoreManager();

  boxes = new TrashBox[4];

  boxes[0] = new TrashBox(0, 80, 420, 140, 80);
  boxes[1] = new TrashBox(1, 245, 420, 140, 80);
  boxes[2] = new TrashBox(2, 410, 420, 140, 80);
  boxes[3] = new TrashBox(3, 580, 420, 140, 80);

  trash = null;

  startButton = new Button(320,388,175,90,"START");

resumeButton = new Button(300,300,200,60,"RESUME");

retryButton = new Button(300,378,200,62,"RETRY");

homeButton = new Button(300,450,200,60,"HOME");
}

void update() {

  if(scene == PLAY && pause == false) {

    timer.update();

    if(timer.isFinish()) {
      scene = RESULT;
    }

  }

}

void display() {

  if(scene == TITLE) {

    image(titleImage,0,0,width,height);
    startButton.display();

  } else if(scene == PLAY) {

    image(haikeiImage,0,0,width,height);

    timer.display();
    score.display();

    for(int i=0;i<boxes.length;i++) {
      boxes[i].display();
    }

    if(trash != null) {
      trash.display();
    }

    drawPauseButton();

    if(pause) {

      fill(255,200);
      rect(0,0,width,height);

      fill(0);
      textAlign(CENTER,CENTER);
      textSize(50);
      text("PAUSE",width/2,150);

      resumeButton.display();
      retryButton.display();
      homeButton.display();

    }

  } else if(scene == RESULT) {

    image(resultImage,0,0,width,height);

    fill(0);
    textAlign(CENTER);

    textSize(50);
    text("GAME RESULT!",width/2,70);

    textSize(40);
    text(score.getScore(),width/2+40,185);
    text(getRank(),width/2+50,260);

    retryButton.display();
    homeButton.display();

  }

}

void mousePressed() {

  if(scene == TITLE) {

    if(startButton.isClicked()) {

      scene = PLAY;
      timer.reset();
      score.reset();
      createTrash();

    }

  } else if(scene == PLAY) {

    if(dist(mouseX,mouseY,width-50,70)<30) {

      pause = true;
      return;

    }

    if(pause) {

      if(resumeButton.isClicked()) {

        pause = false;

      }

      if(retryButton.isClicked()) {

        timer.reset();
        score.reset();
        createTrash();
        pause = false;

      }

      if(homeButton.isClicked()) {

        scene = TITLE;
        pause = false;

      }

      return;

    }

    if(trash != null) {

      if(trash.isHit(mouseX,mouseY)) {
        trash.startDrag();
      }

    }

  } else if(scene == RESULT) {

    if(retryButton.isClicked()) {

      scene = PLAY;
      timer.reset();
      score.reset();
      createTrash();

    }

    if(homeButton.isClicked()) {

      scene = TITLE;

    }

  }

}

void mouseDragged() {

  if(scene == PLAY && pause == false) {

    if(trash != null) {

      trash.move(mouseX,mouseY);

    }

  }

}

void mouseReleased() {

  if(scene != PLAY || pause) {
    return;
  }

  if(trash == null) {
    return;
  }

  trash.stopDrag();

  boolean enteredBox = false;

  for(int i=0;i<boxes.length;i++) {

    if(boxes[i].contains(trash)) {

      enteredBox = true;

      if(boxes[i].isCorrect(trash)) {

        score.addScore();
        createTrash();

      } else {

        score.minusScore();
        trash.resetPosition();

      }

      break;

    }

  }

  if(!enteredBox) {

    trash.resetPosition();

  }

}

void createTrash() {

  int index = int(random(trashNames.length));

trash = new Trash(

  trashNames[index],

  trashTypes[index],

  trashImages[index],

  width/2,

  250

);

}

String getRank() {

  int s = score.getScore();

  if(s >= 30) {
    return "S";
  }

  if(s >= 25) {
    return "A";
  }

  if(s >= 20) {
    return "B";
  }

  if(s >= 10) {
    return "C";
  }

  return "D";

}

void drawPauseButton() {

 

}

}
