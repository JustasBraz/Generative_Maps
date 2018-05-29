import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;


// The noise function's 3rd argument, a global variable that increments once per cycle
float zoff = 0.0;  
// We will increment zoff differently than xoff and yoff
float zincrement = 0.005; 
float increment=0.07;
int rows=50;
int cols=50;
PeasyCam cam;


void setup() {
  size(800, 800, P3D); 
    cam = new PeasyCam(this, 1000);
    lights();
  //noLoop();
}

void draw() {
   background(255);
  // Optional: adjust noise detail here
  // noiseDetail(8,0.65f);
 // rotateX(PI/2.5);
  translate(-width/2, -height/2);
 // translate(width/2, height/2);
  int sizeX=width/rows;
  int sizeY=height/cols;
 // loadPixels();
 int z= 0;

  float xoff = 0.0; // Start xoff at 0
 //z-=1;
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x <= rows; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y <= cols; y++) {
     // increment =random(0.005,0.15);
      yoff += increment; // Increment yoff
      
      // Calculate noise and scale by 255
      float bright = noise(xoff,yoff,zoff)*colorLen();
    
      // Try using this line instead
      //float bright = random(0,255);
      
      // Set each pixel onscreen to a grayscale value
      //pixels[x+y*width] = color(bright,bright,bright);
      stroke(255);
    strokeWeight(0.5);
    //noStroke();
      fill(colorVal(bright));
   //   blendMode(BLEND);
   //   ellipse(x*sizeX, y*sizeY,sizeX*2, sizeY*2);
     // rect(x*sizeX, y*sizeY,sizeX,sizeY);
   
    //  cube(x*sizeX, y*sizeY, z,sizeX,colorVal(bright) );
    switch((int)(bright)){
      case 0: 
      for(int i =0; i<= 10;i++){
      cube(x*sizeX, y*sizeX, sizeX*i,sizeX/2,colorVal(bright) );
      }
      //return color(255,255,0);//yellow
      break;
         case 1: //return color(0,0,205);//blue
         for(int i =0; i<= 0;i++){
      cube(x*sizeX, y*sizeX, sizeX*i,sizeX/2,colorVal(bright) );
      }
         break;
         case 2: for(int i =0; i<=0;i++){
      cube(x*sizeX, y*sizeX, sizeX*i,sizeX/2,colorVal(bright) );
      }
             break;//darkest green
         case 3:for(int i =0; i<= 4;i++){
      cube(x*sizeX, y*sizeX, z*sizeX*i,sizeX/2,colorVal(bright) );
      }
             break;//darkest green
         case 4: for(int i =0; i<= 5;i++){
      cube(x*sizeX, y*sizeX, sizeX*i,sizeX/2,colorVal(bright) );
      }
             break;
         case 5: for(int i =0; i<= 6;i++){
      cube(x*sizeX, y*sizeX, sizeX*i,sizeX/2,colorVal(bright) );
      }
         break;
         case 6:
         for(int i =0; i<= 7;i++){
      cube(x*sizeX, y*sizeX, z*sizeX*i,sizeX/2,colorVal(bright) );
      }break;
         case 7:
         for(int i=0; i<= 8;i++){
      cube(x*sizeX, y*sizeX, sizeX*i,sizeX/2,colorVal(bright) );
      }break;
         case 8:
         for(int i =0; i<= 9;i++){
      cube(x*sizeX, y*sizeX, sizeX*i,sizeX/2,colorVal(bright) );
      }break;
         case 9:
         for(int i =0; i<= 10;i++){
      cube(x*sizeX, y*sizeX, sizeX*i,sizeX/2,colorVal(bright) );
      }
         break;
         case 10:
         for(int i =0; i<= 11;i++){
      cube(x*sizeX, y*sizeX, sizeX*i,sizeX/2,colorVal(bright) );
      }
         break;
         case 11:
         for(int i =0; i<= 12;i++){
      cube(x*sizeX, y*sizeX, sizeX*i,sizeX/2,colorVal(bright) );
      }
         break;
         
         
      }
      //rect(x*sizeX, y*sizeY,sizeX,sizeY);
      
    }
  }
  //updatePixels();
  
//  zoff += zincrement; // Increment zoff
  
  
}

int colorLen(){
return 11;
}
color colorVal(float val){
 
 
 switch((int)val){
   case 0: return color(255,255,0);//yellow
   case 1: return color(0,0,255);//darker blue
   case 2: return color(0,0,205);//blue
   case 3: return color(#814444);//brown shore
   case 4: return color(#897575);//brownish green shore I897575
   case 5: return color(#253E2A);//brownish green shore II
   case 6: return color(#126F2B);//darkest green
   case 7: return color(#578E5B);//darker green
   case 8: return color(#94CB98);//mid green
   case 9: return color(#94CB98);//green
   case 10: return color(255);//white
 
 }
 return color(255,0,0);
}

void cube(int x, int y, int z, int size, color col){

beginShape(QUADS);

  pushMatrix();
  translate(x,y,z);
  fill(col); vertex(-1*size,  1*size,  1*size);
  fill(col); vertex( 1*size,  1*size,  1*size);
  fill(col); vertex( 1*size, -1*size,  1*size);
  fill(col); vertex(-1*size, -1*size,  1*size);

  fill(col); vertex( 1*size,  1*size,  1*size);
  fill(col); vertex( 1*size,  1*size, -1*size);
  fill(col); vertex( 1*size, -1*size, -1*size);
  fill(col); vertex( 1*size, -1*size,  1*size);

  fill(col); vertex( 1*size,  1*size, -1*size);
  fill(col); vertex(-1*size,  1*size, -1*size);
  fill(col); vertex(-1*size, -1*size, -1*size);
  fill(col); vertex( 1*size, -1*size, -1*size);

  fill(col); vertex(-1*size,  1*size, -1*size);
  fill(col); vertex(-1*size,  1*size,  1*size);
  fill(col); vertex(-1*size, -1*size,  1*size);
  fill(col); vertex(-1*size, -1*size, -1*size);

  fill(col); vertex(-1*size,  1*size, -1*size);
  fill(col); vertex( 1*size,  1*size, -1*size);
  fill(col); vertex( 1*size,  1*size,  1*size);
  fill(col); vertex(-1*size,  1*size,  1*size);

  fill(col); vertex(-1*size, -1*size, -1*size);
  fill(col); vertex( 1*size, -1*size, -1*size);
  fill(col); vertex( 1*size, -1*size,  1*size);
  fill(col); vertex(-1*size, -1*size,  1*size);

  endShape();
  
  popMatrix(); 

}