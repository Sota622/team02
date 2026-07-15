class Button {

  float x;
  float y;
  float w;
  float h;
  String text;


  Button(float x, float y, float w, float h, String text){

    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;

  }


  void display(){

    fill(100,200,100);
    rect(x,y,w,h);

    fill(0);
    textSize(30);
    textAlign(CENTER,CENTER);
    text(text,x+w/2,y+h/2);

  }


  boolean isClicked(){

    if(mouseX > x && mouseX < x+w &&
       mouseY > y && mouseY < y+h){

      return true;

    }

    return false;

  }

}