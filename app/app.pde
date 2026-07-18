final int WIDTH = 800;
final int HEIGHT = 600;

GameManager gameManager;

void setup() {
  size(WIDTH, HEIGHT);
  smooth();
  frameRate(60);

  println("Game Start");

  gameManager = new GameManager();
}

void draw() {
  gameManager.update();
  gameManager.display();
}

void mousePressed() {
  gameManager.mousePressed();
}

void mouseDragged() {
  gameManager.mouseDragged();
}

void mouseReleased() {
  gameManager.mouseReleased();
}
