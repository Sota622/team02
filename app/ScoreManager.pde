class ScoreManager {

  int score;

  ScoreManager() {
    score = 0;
  }

  // 正解
  void addScore() {
    score++;
  }

  // 不正解
  void minusScore() {
    score--;
  }

  // 初期化
  void reset() {
    score = 0;
  }

  // 得点取得
  int getScore() {
    return score;
  }

  void display() {
    textSize(30);
    fill(0);
    text("Score : " + score, 20, 50);
  }

}