GameManager gameManager;


void setup() {

  size(800, 600);

  gameManager = new GameManager();

}


void draw() {

  gameManager.update();

  gameManager.display();

}


void mousePressed() {

  gameManager.mousePressed();

}


void mouseReleased() {

  gameManager.mouseReleased();

}