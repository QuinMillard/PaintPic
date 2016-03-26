PImage img;
float[] r;
float[] g;
float[] b;
float[] ratio;
color[] c;
float comparator;
int minIndex;
int numColours;
void setup(){
  size(504,332);
  img = loadImage("camel1.jpg");
  numColours = 9;
  comparator = 2293939;
  minIndex = 2;
  r = new float[numColours];
  g = new float[numColours];
  b = new float[numColours];
  c = new color[numColours];
  ratio = new float[numColours];
  r[0] = 237;
  g[0] = 28;
  b[0] = 36;
  
  r[1] = 255;
  g[1] = 255;
  b[1] = 255;
  
  r[2] = 0;
  g[2] = 0;
  b[2] = 0;
  
  r[3] = 255;
  g[3] = 127;
  b[3] = 39;
  
  r[4] = 0;
  g[4] = 162;
  b[4] = 232;
  
  r[5] = 0;
  g[5] = 255;
  b[5] = 242;
  
  r[6] = 34;
  g[6] = 177;
  b[6] = 76;
  
  r[7] = 63;
  g[7] = 72;
  b[7] = 204;
  
  r[8] = 163;
  g[8] = 73;
  b[8] = 164;
  
}
void draw(){
 image(img,0,0);
 noLoop();
 loadPixels(); 
  // Since we are going to access the image's pixels too  
  //img.loadPixels();
  
  /*for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y * width;
      for (int i = 0; i < numColours; i++){
        ratio[i] = abs(red(img.pixels[loc]) - r[i]) + abs(green(img.pixels[loc]) - g[i]) + abs(blue(img.pixels[loc]) - b[i]);
      }
      for (int i = numColours - 1; i >= 0; i--){
        if(ratio[i] < comparator){
          minIndex = i;
          comparator = ratio[i];
        }
      }
      r[minIndex] = (red(img.pixels[loc]) + r[minIndex])/2.0;
      g[minIndex] = (green(img.pixels[loc]) + g[minIndex])/2.0;
      b[minIndex] = (blue(img.pixels[loc]) + b[minIndex])/2.0;
    }
  }*/
  for (int i = 0; i < numColours; i++){
    c[i] = color(r[i],g[i],b[i]);
    println(r[i] + "," + g[i] + "," + b[i]);
  }
  
  comparator = 334234;
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      for( int i = 0; i < numColours; i++){
        ratio[i] = abs(red(img.pixels[loc]) - r[i]) + abs(green(img.pixels[loc]) - g[i]) + abs(blue(img.pixels[loc]) - b[i]);
      }
      comparator = min(min(ratio[0],ratio[1],ratio[2]),ratio[3],min(ratio[4],ratio[5],min(ratio[6],ratio[7],ratio[8])));
      if(comparator == ratio[0]){
        minIndex = 0;
      }
      else if(comparator == ratio[1]){
        minIndex = 1;
      }
      else if(comparator == ratio[2]){
        minIndex = 2;
      }
      else if(comparator == ratio[3]){
        minIndex = 3;
      }
      else if(comparator == ratio[4]){
        minIndex = 4;
      }
      else if(comparator == ratio[5]){
        minIndex = 5;
      }
      else if(comparator == ratio[6]){
        minIndex = 6;
      }
      else if(comparator == ratio[7]){
        minIndex = 7;
      }
      else if(comparator == ratio[8]){
        minIndex = 8;
      }
      pixels[loc] = c[minIndex];
    }
  }
  updatePixels();
  
}