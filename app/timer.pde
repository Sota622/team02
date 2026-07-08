class Timer {

  int time = 60;      // 残り秒数
  int count = 0;      // 秒を数えるカウンタ

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


    if (time == 0){
    //gamemanager内で実装
    }
}