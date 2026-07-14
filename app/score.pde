class ScoreManager {

  int score = 0;

//正しく分別
  void addScore() {
    score++;
  }

//誤った分別
  void minusScore() {
    score--;
  }

  void display() {
    textSize(30);
    fill(0);
    text("Score : " + score, 20, 50);
  }

}