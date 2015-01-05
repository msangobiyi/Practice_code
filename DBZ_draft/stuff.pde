////////////////////////////////
//         This is where      //
//        the magic happens   //
////////////////////////////////
ArrayList<ki> ki = new ArrayList<ki>();
BlackHole create;
int limit= 150;
int namekposition;
PImage img;
PImage namek;
PImage dn;
//ki[] balls = new ki[150];//

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100, 100);
  img= loadImage("goku.png");
  namek= loadImage("Namek.jpg");
  dn= loadImage("destroyednamek.jpg");
  dn.resize(displayWidth/2, displayHeight);
  namek.resize(displayWidth/2, displayHeight); // creates a suitable size for the desired background 
  create = new BlackHole();
  namekposition=0;
}

void draw() {
  image(namek, namekposition, namekposition);  // Dragon Ball Z themed background
  image(img, mouseX, mouseY, img.height/8, img.width/8); // Goku image follows mouse
  if (mousePressed) {
    ki.add(new ki(25, random(.01, 5))) ;
  }
  if (ki.size() >= limit) {
    ki.remove(0);
  } 

  for (int i = 0; i < ki.size (); i++) {
    ki j =ki.get(i);
    j.display();
    j.move();
    j.ground();
    j.devour(create);
    if (create.consumes(j)) {
      ki.remove(i);    // Removes spawned object once it comes into contact witht he black hole (prevents lag)
      create.grow();
    }
    if (create.consumes(j) && create.sz2>=create.max) {
      create.silence();
      create.drop();
    }
  }

  if (create.y>=height/2) {


    namekposition= 10000;
    image(dn, 0, 0);

    noLoop();
    //create.sz2=800;
  }
  create.display();
}

