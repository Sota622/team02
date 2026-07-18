class TrashBox {

  int type;          // ゴミ箱の種類
  float x, y;        // 左上座標
  float w, h;        // 幅・高さ

  TrashBox(int type, float x, float y, float w, float h) {
    this.type = type;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  // ゴミ箱を表示
  void display() {

    stroke(0);
    strokeWeight(2);

    if (type == 0) {
      fill(255, 180, 180);
    } else if (type == 1) {
      fill(180);
    } else if (type == 2) {
      fill(180, 255, 180);
    } else if (type == 3) {
      fill(180, 220, 255);
    }

    rect(x, y, w, h);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);

    if (type == 0) {
      text("燃える", x + w / 2, y + h / 2);

    } else if (type == 1) {
      text("燃えない", x + w / 2, y + h / 2);

    } else if (type == 2) {
      text("缶・びん", x + w / 2, y + h / 2);

    } else if (type == 3) {
      text("資源", x + w / 2, y + h / 2);
    }
  }

  // ゴミ箱の中に入っているか
  boolean contains(Trash trash) {

    return (trash.x >= x &&
            trash.x <= x + w &&
            trash.y >= y &&
            trash.y <= y + h);

  }

  // ゴミの種類が正しいか
  boolean isCorrect(Trash trash) {

    return trash.getType() == type;

  }

}