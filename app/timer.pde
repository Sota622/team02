class Timer {

  int limit = 60;
  int startTime;

  boolean paused = false;
  int pauseStart;
  int pauseTime;

  Timer() {
    reset();
  }

  void reset() {
    startTime = millis();
    pauseTime = 0;
    paused = false;
  }

  void pause() {
    if (!paused) {
      paused = true;
      pauseStart = millis();
    }
  }

  void resume() {
    if (paused) {
      paused = false;
      pauseTime += millis() - pauseStart;
    }
  }

  void update() {
    // 特に処理なし
  }

  void display() {

    int elapsed;

    if (paused) {
      elapsed = (pauseStart - startTime - pauseTime) / 1000;
    } else {
      elapsed = (millis() - startTime - pauseTime) / 1000;
    }

    int remain = limit - elapsed;

    if (remain < 0) {
      remain = 0;
    }

    textSize(40);
    fill(0);
    textAlign(CENTER, TOP);
    text(remain, width / 2 - 10, 30);
  }

  boolean isFinish() {

    if (paused) {
      return false;
    }

    return (millis() - startTime - pauseTime) >= limit * 1000;
  }

}
