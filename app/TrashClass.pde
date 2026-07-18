class Trash {
  String name;      // ごみの名前
  int type;         // ごみの種類
  float x, y;       // ごみの位置
  float startX, startY;
  boolean dragging; // ドラッグ中かどうか

  Trash(String name, int type, float x, float y) {
    this.name = name;
    this.type = type;
    this.x = x;
    this.y = y;
    this.startX = x;
    this.startY = y;
    this.dragging = false;
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    textAlign(CENTER, CENTER);

    // ごみの種類によって見た目を変える
    if (type == 0) {
      // 燃えるごみ
      fill(240, 220, 180);
      ellipse(x, y, 80, 60);

    } else if (type == 1) {
      // 燃えないごみ
      fill(180, 180, 180);
      rect(x - 40, y - 30, 80, 60);

    } else if (type == 2) {
      // 缶・びん
      fill(120, 200, 180);
      rect(x - 25, y - 45, 50, 90);

    } else if (type == 3) {
      // 資源ごみ
      fill(120, 180, 240);
      rect(x - 35, y - 35, 70, 70);
    }

    // ごみの名前
    fill(255);
    textSize(18);
    text(name, x, y + 60);
  }

  boolean isHit(float mx, float my) {
    return dist(mx, my, x, y) < 60;
  }

  void startDrag() {
    dragging = true;
  }

  void stopDrag() {
    dragging = false;
  }

  void move(float mx, float my) {
    if (dragging) {
      x = mx;
      y = my;
    }
  }

  void resetPosition() {
    x = startX;
    y = startY;
  }

  int getType() {
    return type;
  }

  String getName() {
    return name;
  }
}
