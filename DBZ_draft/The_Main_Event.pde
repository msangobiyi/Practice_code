///////////////////////////////
//      Particles Systems    //
//        Ineteract here     //
///////////////////////////////
//initializes variables
ArrayList<ki> ki = new ArrayList<ki>();
BlackHole create;
int limit= 150;
int namekposition;
PImage img;
PImage namek;
PImage dn;
void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100, 100);
  img= loadImage("goku.png"); //defines variable for goku
  namek= loadImage("Namek.jpg"); //defines variable for namek
  dn= loadImage("destroyednamek.jpg"); //defines variable for destroyed namek
  dn.resize(displayWidth/2, displayHeight); //makes image appropriate size for desired window
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
  if (ki.size() >= limit) { // removes ki blast if the ki blast is touching the blackhole
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
  create.display(); // creates the objects in the display portion
  if (create.y>=height/2) {


    namekposition= 10000; // Moves image off of screen so alternate image can be displayed
    image(dn, 0, 0); // Creates the Destroyed Namek image

    noLoop();
    //create.sz2=800;
  }
}

