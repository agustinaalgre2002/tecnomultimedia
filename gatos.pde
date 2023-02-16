Gatos[] misgatitos= new Gatos  [20];

class Gatos {
  int gatitossave = 0;
  int highScore = 0;
  boolean ganar  = true;
  int  savetime;
  int totaltime = 12000;
  Estados estados;
  PImage  nube;
  PFont texboton;
  PFont subtex;
  PImage gatito;
  float x, y;
  int d;
  float xSpeed;
  float ySpeed;

  Gatos(float x, float y, int d) {
    this.x = x ;
    this.y = y ;
    this.d = d ;
    xSpeed = int(random(5, 40));
    ySpeed = int(random(5, 30));
    gatito = loadImage ("gato2.png");
    nube = loadImage ("nubes.png");
    subtex = loadFont("Cutesy-Regular-20.vlw");
    texboton = loadFont("CutesRegular-48.vlw");
    savetime = millis();

  }
  void dibujar() {
  }

  void speed() { //mover
    x += xSpeed;
    y += ySpeed;
  }




  void colision() {

    if ((x<0) || (x>width-d)) {
      xSpeed = -xSpeed;
    }

    if ((y<0) || (y>height-d)) {
      ySpeed = -ySpeed;
    }
  }


  void display() { //imagen que se reproduce
    gatito.resize(100, 100);
    image(gatito, x, y);
  }

  void salvar() {
    if (mousePressed) {

      float distance = dist(mouseX, mouseY, x, y);

      if (distance<d) {
        xSpeed = 0;
        ySpeed = 0;
        x = -1000;
        gatitossave++;
        highScore = max(gatitossave, highScore);
        //player.play();
      } else {
        //player.stop();
      }
    }
  }
  void score() {
    image(nube, 0, 0);
    textFont (subtex);
    textSize(50);
    text("gatitos salvados "+gatitossave+"  de 20", 130, 550);
  }


}
