//////////////////////////////////////////////
//           This is where                  //
//        the magic happens                 //
//      Black Hole/ Spirit bomb Setup       //
//////////////////////////////////////////////
class BlackHole {
  //initializing necessary variables
  PVector loc;
  float sz, sz2, max, y;
  PImage a;
  PImage spiritbomb;

  //CONSTRUCTOR//
  BlackHole() {
    loc = new PVector(width-100.0, height/2.0);
    sz = 200;
    sz2=25;
    max= 500;
    y=0;
    a = loadImage("dragonball.png"); // defining variable for dragon ball
    spiritbomb= loadImage("spiritbomb.png"); // definining spirit bomb variable
  }

  void display() {
    fill(0);
    image(a, loc.x*.75, loc.y*.75, sz, sz); //dragon ball a.k.a black hole

    image(spiritbomb, width/2-200, y, sz2, sz2); // spiritbomb
    spiritbomb.resize(125, 125);
  }
  //causes the spirit bomb to grow
  void grow() { 
    sz2+=5;
  }
  //controls the direction of the spirit bomb (downward Y)
  void drop() { 
    y+=5;
    if (y>=height/2) {
      y=height/2;
    }
  }
  //Sets maximum size for spirit bomb. Growth from previous code ceases 
  void silence() {
    sz2=max;
  }
  // Asseses proximity of ki blast and black hole. If they are touching the remove function will take out the particular ki blast.
  boolean consumes(ki food) {
    if (loc.dist(food.loc) < sz/2 + food.sz/2) {
      return true;
    } else {
      return false;
    }
  }
}

