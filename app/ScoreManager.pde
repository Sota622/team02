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

  // スコアの背景
  fill(255, 255, 255, 180);
  rect(20, 20, 180, 50);


  // スコア文字
  fill(0);
  textSize(30);
  textAlign(LEFT, CENTER);

  text("Score :   " + score, 30, 45);

}

}
