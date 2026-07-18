class ScoreManager {

  int score = 0;

  // 正しく分別
  void addScore() {
    score++;
  }

  // 誤った分別
  void minusScore() {
    if (score > 0) {
      score--;
    }
  }

  // 初期化
  void reset() {
    score = 0;
  }

  // 得点取得
  int getScore() {
    return score;
  }

  // 表示
  void display() {
    textSize(30);
    fill(0);
    text("Score : " + score, 20, 50);
  }

}