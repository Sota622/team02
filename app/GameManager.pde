class GameManager {

  PImage titleImage;

  GameManager(){

    titleImage = loadImage("title.png");

  }


  void update(){

  }


  void display(){

  image(titleImage,0,0,width,height);

}


  void mousePressed(){

  // STARTボタンの位置
  if(mouseX > 280 && mouseX < 470 &&
     mouseY > 400 && mouseY < 470){

    print("ゲーム開始");

  }

}


  void mouseReleased(){

  }

}
