class BlackHole {
  PVector loc;
  float sz;
  
  //CONSTRUCTOR
  BlackHole() {
    loc = new PVector(width-100.0, height/2.0);
    sz = 200;
  }
  
  void display() {
    fill(0);
    ellipse(loc.x, loc.y, sz, sz);
  }
  
  boolean consumes(ki food) {
    if (loc.dist(food.loc) < sz/2 + food.sz/2) {
      return true;
    }
    else{
      return false;
    }
  }
}
