// The noise function's 3rd argument, a global variable that increments once per cycle
float zoff = 0.0;  

// We will increment zoff differently than xoff and yoff
float zincrement = 0.02; 
float increment=0.07;

int rows=250;
int cols=250;

void setup() {
  size(1000, 1000); 

  //Runs once
  //noLoop();
}

void draw() {

  // Optional: adjust noise detail here
  // noiseDetail(8,0.65f);

  int sizeX=width/rows;
  int sizeY=height/cols;

  float xoff = 0.0; // Start xoff at 0

  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x <= rows; x++) {

    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0

    for (int y = 0; y <= cols; y++) {

      yoff += increment; 

      float bright = noise(xoff, yoff, zoff)*6;

      stroke(255);
      strokeWeight(0.2);

      fill(colorVal(bright));
      rect(x*sizeX, y*sizeY, sizeX, sizeY);
    }
  }


  zoff += zincrement; 
  //saveFrame(frameCount+".png");
}
color colorVal(float val) {


  switch((int)val) {
  case 0: 
    return color(255, 255, 0);//yellow
  case 1: 
    return color(0, 0, 205);//blue
  case 2: 
    return color(#126F2B);//darkest green
  case 3: 
    return color(#8BCB56);//darker green
  case 4: 
    return color(0, 200, 0);//green
  case 5: 
    return color(255);//white
  }
  return color(255, 0, 0);
}