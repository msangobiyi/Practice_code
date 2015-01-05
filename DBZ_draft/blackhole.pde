class BlackHole {
  PVector loc;
  float sz, sz2, max, y;
  PImage a;
  PImage spiritbomb;

  //CONSTRUCTOR
  BlackHole() {
    loc = new PVector(width-100.0, height/2.0);
    sz = 200;
    sz2=25;
    max= 500;
    y=0;
    a = loadImage("dragonball.png");
    spiritbomb= loadImage("spiritbomb.png");
    
  }

  void display() {
    fill(0);
    image(a, loc.x*.75, loc.y*.75, sz, sz);
    
    image(spiritbomb, width/2-200 , y, sz2, sz2);
    spiritbomb.resize(125, 125);
    
  }
  void grow() {
    sz2+=5;
  }
  void drop() { 
    y+=5;
    if (y>=height/2) {
      y=height/2;
    }
  }
 
    void silence() {
      sz2=max;
    }

    boolean consumes(ki food) {
      if (loc.dist(food.loc) < sz/2 + food.sz/2) {
        return true;
      } else {
        return false;
      }
    }
  }

