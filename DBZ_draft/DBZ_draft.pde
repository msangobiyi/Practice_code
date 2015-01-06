///////////////////////////////
//      This is where        //
//     the magic happens     //
//   Ki Blast Specififcations//
///////////////////////////////
class ki {
  PVector loc, vel, gravity;
  float sz;
  float speed;
  ki(float tempsz, float tempspeed) {
    sz= tempsz;
    speed= tempspeed;
    loc= new PVector(mouseX+100, mouseY); 
    //new PVector(width/2,  height*.1);//
    vel= PVector.random2D();
    gravity= new PVector(.5, 0);
    vel.setMag(speed);
  }
  void display() { //gives ball life(makes visible)//
    PImage kiblast;
    kiblast= loadImage("kiblast.gif"); // creates a single ki blast
    image(kiblast, loc.x, loc.y, sz, sz);
  }
  void move() {//teaches the ball how to walk (makes ball move)
    vel.add(gravity);
    loc.add(vel);
  }
  void ground() {
    if (loc.y + sz/2 > height) {  
      loc.y = height - sz/2;
      vel.x *= .9;       
      vel.y *= -.7;
    }
  }
  void devour(BlackHole darkmatter) { //Gravitational properties for ki blast
    gravity = PVector.sub(darkmatter.loc, loc);
    gravity.setMag(1);
  }
}

