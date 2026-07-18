class GameManager {

  PImage titleImage;

  // ===== 画面 =====
  final int TITLE = 0;
  final int PLAY = 1;
  final int RESULT = 2;

  int scene = TITLE;

  // ===== ゲームで使うクラス =====
  Timer timer;
  ScoreManager score;

  Trash trash;
  TrashBox[] boxes;

  Button startButton;
  Button retryButton;

  // ===== ゴミデータ =====
  String[] trashNames = {
    "生ごみ",
    "ティッシュ",
    "フライパン",
    "乾電池",
    "空き缶",
    "ガラスびん",
    "新聞紙",
    "ペットボトル"
  };

  int[] trashTypes = {
    0,
    0,
    1,
    1,
    2,
    2,
    3,
    3
  };

  GameManager() {

    titleImage = loadImage("title.png");

    timer = new Timer();
    score = new ScoreManager();

    // ===== ゴミ箱生成 =====
    boxes = new TrashBox[4];

    boxes[0] = new TrashBox(0, 40, 500, 160, 80);
    boxes[1] = new TrashBox(1, 220, 500, 160, 80);
    boxes[2] = new TrashBox(2, 400, 500, 160, 80);
    boxes[3] = new TrashBox(3, 580, 500, 160, 80);

    trash = null;

    // タイトル画面のSTARTボタン
    startButton = new Button(
      280,
      400,
      190,
      70,
      "START"
    );

    // 結果画面のRETRYボタン
    retryButton = new Button(
      280,
      400,
      190,
      70,
      "RETRY"
    );

  }

  //========================
  // 更新処理
  //========================
  void update() {

    if (scene == PLAY) {

      timer.update();

      if (timer.isFinish()) {
        scene = RESULT;
      }

    }

  }

  //========================
  // 描画処理
  //========================
  void display() {

    if (scene == TITLE) {

      image(titleImage, 0, 0, width, height);
      startButton.display();

    }

    else if (scene == PLAY) {

      background(255);

      // タイマー
      timer.display();

      // スコア
      score.display();

      // ゴミ箱
      for (int i = 0; i < boxes.length; i++) {
        boxes[i].display();
      }

      // ゴミ
      if (trash != null) {
        trash.display();
      }

    }

    else if (scene == RESULT) {

      background(220);

      textAlign(CENTER);

      textSize(40);
      fill(0);
      text("ゲーム終了", width / 2, 180);

      textSize(30);
      text("Score : " + score.getScore(), width / 2, 250);

      text("Rank : " + getRank(), width / 2, 300);

      retryButton.display();

    }

  }

  //========================
  // マウスを押した
  //========================
  void mousePressed() {

    if (scene == TITLE) {

      if (startButton.isClicked()) {

        scene = PLAY;

        timer.reset();
        score.reset();

        createTrash();

      }

    }

    else if (scene == PLAY) {

      if (trash != null) {

        if (trash.isHit(mouseX, mouseY)) {
          trash.startDrag();
        }

      }

    }

    else if (scene == RESULT) {

      if (retryButton.isClicked()) {

        scene = TITLE;

      }

    }

  }

  //========================
  // ドラッグ
  //========================
  void mouseDragged() {

    if (scene == PLAY) {

      if (trash != null) {
        trash.move(mouseX, mouseY);
      }

    }

  }


  //========================
  // マウスを離した
  //========================
  void mouseReleased() {

    if (scene != PLAY) {
      return;
    }

    if (trash == null) {
      return;
    }

    trash.stopDrag();

    boolean enteredBox = false;

    for (int i = 0; i < boxes.length; i++) {

      if (boxes[i].contains(trash)) {

        enteredBox = true;

        if (boxes[i].isCorrect(trash)) {

          score.addScore();

          createTrash();

        } else {

          score.minusScore();

          trash.resetPosition();

        }

        break;

      }

    }

    // ゴミ箱に入らなかった場合
    if (!enteredBox) {

      trash.resetPosition();

    }

  }


  //========================
  // ゴミ生成
  //========================
  void createTrash() {

    int index = int(random(trashNames.length));

    trash = new Trash(

      trashNames[index],

      trashTypes[index],

      width / 2,

      250

    );

  }


  //========================
  // ランク取得
  //========================
  String getRank() {

    int s = score.getScore();

    if (s >= 30) {
      return "S";
    }

    if (s >= 25) {
      return "A";
    }

    if (s >= 20) {
      return "B";
    }

    if (s >= 10) {
      return "C";
    }

    return "D";

  }

}
