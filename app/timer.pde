class Timer {

  int limit = 60;
  int startTime;

  Timer() {
    reset();
  }

  void reset() {
    startTime = millis();
  }

  void update() {
    // 特に処理なし
  }

  void display() {
    int remain = limit - (millis() - startTime) / 1000;

    if (remain < 0) {
      remain = 0;
    }

    textSize(30);
    fill(0);
    text("残り時間 : " + remain, 20, 40);
  }

  boolean isFinish() {
    return (millis() - startTime) >= limit * 1000;
  }

}
