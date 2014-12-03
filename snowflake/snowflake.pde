int count = 1000;
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];
PVector[] acc = new PVector[count];
float[] sz = new float[count];
PImage snowflake;

void setup(){
 size(800, 800);
 snowflake = loadImage("snowflake.jpg"); 
 for(int i = 0; i < count; i++){
  sz[i] = random(20,30); 
  loc[i] = new PVector(random(100, width-100), random(30, height)); 
  vel[i] = new PVector(0, 1); 
  acc[i] = new PVector(random(-.01,.01), .1); 
 }
}

void draw(){
  background(255);
  for (int i = 0; i < count; i++) {
    vel[i].add(acc[i]);
    loc[i].add(vel[i]);
    vel[i].limit(4);
     image(snowflake, loc[i].x, loc[i].y, sz[i], sz[i]);
    if (loc[i].y - sz[i]/2 > height) {
      loc[i].set(random(width), random(-height, -sz[i]/2));
      vel[i].set(0, 1);
    }
  }
  
  
}
