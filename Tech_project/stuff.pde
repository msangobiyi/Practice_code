ArrayList<ki> ki = new ArrayList<ki>();
BlackHole apple;
int limit= 150;
PImage img;
//ki[] balls = new ki[150];//

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100, 100);
  img= loadImage("goku.png");
  apple = new BlackHole();
  //for (int i = 0; i < balls.length; i++) {           //
  // balls[i] = new ki(random(5, 20), random(.01, 5)); //
  //  }                                                //
}

void draw() {
  background(0, 0, 100);
  apple.display();
  image(img, mouseX, mouseY, img.height/8, img.width/8);
  if (mousePressed) {
    ki.add(new ki(25, random(.01, 5))) ;
    //for (int i = 0; i < balls.length; i++) {
    // balls[i] = new ki(random(5, 20), random(.01, 5));
    // }
  }
  if (ki.size() >= limit) {
    ki.remove(0);
  } 

  for (int i = 0; i < ki.size (); i++) {
    ki j =ki.get(i);
    j.display();
    j.move();
    j.ground();
    j.isSuckedin(apple);
    if(apple.consumes(j)){
      ki.remove(i);
    }
  }
}

