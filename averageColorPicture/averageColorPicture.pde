
String path="/Users/SebastianRev1/Dropbox/Camera Uploads";
boolean done=false;
color[] pixelVal;
void setup() {
  size(2000, 500);
  folderAnalize();
  noLoop();
}

void draw() {
  //image(pics,0,0);
  
}

void folderAnalize() {
  println(millis());
  int photoN=0;
  int nonPhotoN=0;
  File dir = new File(path);
  String[] list = dir.list();
  PImage[] pics;
  pics=new PImage[list.length];
  pixelVal=new color[list.length];

  if (list == null) {
    println("Folder does not exist or cannot be accessed.");
  } 
  else {
    println("Analizing "+list.length+" images.");
  } 
  //loadPixels();
  for (int i=0; i<list.length; i++) {
    try {
      pics[i]=loadImage(path+"/"+list[i]);
      int rGroup=0;
      int gGroup=0;
      int bGroup=0;
      pics[i].loadPixels();
      for (int x=0; x<pics[i].width; x++) {
        for (int y=0; y<pics[i].height; y++) {
          rGroup+=red(pics[i].pixels[y*pics[i].width+x]);
          gGroup+=green(pics[i].pixels[y*pics[i].width+x]);
          bGroup+=blue(pics[i].pixels[y*pics[i].width+x]);
        }
      }
      int rAv=int(rGroup/pics[i].pixels.length);
      int gAv=int(gGroup/pics[i].pixels.length);
      int bAv=int(bGroup/pics[i].pixels.length);
      pics[i].updatePixels();
      pixelVal[i]=color(rAv,gAv,bAv);
      //stroke(rAv,gAv,bAv);
      //line(photoN,0,photoN,height);
      pics[i]=null;
      photoN++;
    }
    catch(Exception e) {
      nonPhotoN++;
      //println("error, lets keep going "+ e);
    }
  }
  //updatePixels();
  println("Photos Found: "+photoN);
  println("Non Photos Found: "+nonPhotoN);
  sortPixels(photoN);
}