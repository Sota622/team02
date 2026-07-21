class Trash {

String name;      // ごみの名前
int type;         // ごみの種類
float x, y;       // ごみの位置
float startX, startY;
boolean dragging; // ドラッグ中かどうか

PImage img;       // ごみ画像


Trash(String name, int type, String imageName, float x, float y) {

  this.name = name;
  this.type = type;
  this.x = x;
  this.y = y;

  this.startX = x;
  this.startY = y;

  this.dragging = false;

  img = loadImage(imageName);

}


void display() {

  imageMode(CENTER);

  image(img, x, y, 125, 125);


  fill(255);
  textAlign(CENTER, CENTER);
  textSize(18);

  
  
  imageMode(CORNER);

}


boolean isHit(float mx, float my) {

  return dist(mx, my, x, y) < 60;

}


void startDrag() {

  dragging = true;

}


void stopDrag() {

  dragging = false;

}


void move(float mx, float my) {

  if(dragging) {

    x = mx;
    y = my;

  }

}


void resetPosition() {

  x = startX;
  y = startY;

}


int getType() {

  return type;

}


String getName() {

  return name;

}

}
