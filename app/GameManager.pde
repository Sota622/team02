class GameManager {

  // ===== 画面の状態 =====
  final int TITLE = 0;
  final int PLAY = 1;
  final int RESULT = 2;

  int scene = TITLE;


  // ===== ゲームで使うもの =====
  Trash trash;
  Bin[] bins;

  ScoreManager score;
  Timer timer;

  PImage titleImage;


  // ===== コンストラクタ =====
  GameManager() {

    // タイトル画像読み込み
    titleImage = loadImage("title.png");


    score = new ScoreManager();
    timer = new Timer(60);

    trash = new Trash();


    bins = new Bin[4];

    bins[0] = new Bin("燃やせる");
    bins[1] = new Bin("燃やせない");
    bins[2] = new Bin("缶・びん");
    bins[3] = new Bin("資源");

  }


  // ===== 毎フレーム更新 =====
  void update() {

    if(scene == PLAY) {

      timer.update();

      trash.update();


      if(timer.isFinish()) {

        scene = RESULT;

      }

    }

  }


  // ===== 描画 =====
  void display() {

    if(scene == TITLE) {

      drawTitle();

    } else if(scene == PLAY) {

      drawGame();

    } else if(scene == RESULT) {

      drawResult();

    }

  }



  // ===== タイトル画面 =====
  void drawTitle() {

    image(titleImage, 0, 0, width, height);

  }



  // ===== ゲーム画面 =====
  void drawGame() {

    background(255);


    timer.display();

    score.display();


    for(int i = 0; i < bins.length; i++) {

      bins[i].display();

    }


    trash.display();

  }



  // ===== 結果画面 =====
  void drawResult() {

    background(220);


    textSize(40);

    text("ゲーム終了", 300, 100);


    textSize(30);

    text("Score : " + score.getScore(), 300, 180);

  }



  // ===== マウスクリック =====
  void mousePressed() {


    // タイトル画面
    if(scene == TITLE) {

      scene = PLAY;

      timer.reset();

      score.reset();

    }


    // ゲーム画面
    else if(scene == PLAY) {

      trash.mousePressed();

    }

  }



  // ===== マウスを離した =====
  void mouseReleased() {


    if(scene == PLAY) {


      trash.mouseReleased();


      for(int i = 0; i < bins.length; i++) {


        if(bins[i].check(trash)) {


          score.add(10);

          trash.nextTrash();

          return;

        }

      }


      // 間違えた場合
      score.minus(5);

      trash.nextTrash();

    }

  }

}