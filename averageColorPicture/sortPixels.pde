/////
//  Attempt to sort pixels
//
/////


void sortPixels(int picsAnalyzed) {
  //loadPixels();
  background(255);
  int loopsDone=0;
  while (!done) {
    int pixelMovements=0;
    for (int j=0; j<picsAnalyzed; j++) {
      for (int i=0; i<picsAnalyzed-1; i++) {
        if (hue(pixelVal[i])<hue(pixelVal[i+1])) {
          color tempC=color(pixelVal[i]); 
          pixelVal[i]=pixelVal[i+1];
          pixelVal[i+1]=tempC;
          pixelMovements++;
        }
        if (hue(pixelVal[i])==hue(pixelVal[i+1]) && saturation(pixelVal[i])<saturation(pixelVal[i+1])) {
          color tempC=color(pixelVal[i]); 
          pixelVal[i]=pixelVal[i+1];
          pixelVal[i+1]=tempC;
          pixelMovements++;
        }
        loopsDone++;
      }
    }
    if (pixelMovements==0) {
      done=true;
      println("loops ran: "+loopsDone);
    }
    for (int j=0; j<width-1; j++) {
      stroke(pixelVal[j]);
      line(j, 0, j, height);
    }
    println(millis());
    //updatePixels();
     saveFrame("ColorPallet.png");
  }
}