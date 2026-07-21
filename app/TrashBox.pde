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
