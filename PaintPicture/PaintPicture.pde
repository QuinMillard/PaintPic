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
  size(184,275);
  img = loadImage("tree.jpg");
  numColours = 3;
  comparator = 2293939;
  minIndex = 2;
  r = new float[numColours];
  g = new float[numColours];
  b = new float[numColours];
  c = new color[numColours];
  ratio = new float[numColours];
  for( int i = 0; i < numColours; i++){
    r[i] = 255;
    g[i] = 255;
    b[i] = 255;
  }
  
}
void draw(){
 image(img,0,0);
 noLoop();
 loadPixels(); 
  // Since we are going to access the image's pixels too  
  img.loadPixels();
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      for( int i = 0; i < numColours; i++){
        ratio[i] = abs(red(img.pixels[loc]) - r[i]) + abs(green(img.pixels[loc]) - g[i]) + abs(blue(img.pixels[loc]) - b[i]);
        if(comparator > ratio[i]){
          comparator = ratio[i];
          minIndex = i;
        }
      }
      r[minIndex] = (red(img.pixels[loc]) + r[minIndex])/2.0;
      g[minIndex] = (green(img.pixels[loc]) + g[minIndex])/2.0;
      b[minIndex] = (blue(img.pixels[loc]) + b[minIndex])/2.0;
    }
  }
  for (int i = 0; i < numColours; i++){
    c[i] = color(r[i],g[i],b[i]);
    println(r[i] + "," + g[i] + "," + b[i]);
  }
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      for( int i = 0; i < numColours; i++){
        ratio[i] = abs(red(img.pixels[loc]) - r[i]) + abs(green(img.pixels[loc]) - g[i]) + abs(blue(img.pixels[loc]) - b[i]);
        if(comparator > ratio[i]){
          comparator = ratio[i];
          minIndex = i;
        }
      }
      pixels[loc] = c[minIndex];
    }
  }
  updatePixels();
}