class Timer {

  int time = 60;
  int count = 0;


  void update() {

    count++;

    if (count >= 60) {

      time--;
      count = 0;

    }


    if (time < 0) {

      time = 0;

    }

  }


  void display() {

    textSize(30);
    text("残り時間 : " + time, 20, 40);

  }


  //時間終了判定
  boolean isFinish() {

    return time == 0;

  }

}
