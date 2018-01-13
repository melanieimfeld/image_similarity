//--------------------------------RESIZING-----------------------------------
PImage customresize(PImage pin, int factor) {

  //for the index
  int counter = 0;

  // prepare an image half as large (factor x) as the orginal to fill in averaged colors
  PImage reduc = createImage(pin.width/factor, pin.height/factor, RGB);

  //prepare a list for the colors
  color [] colorList;
  colorList = new color[reduc.pixels.length];

  // iteraterate through the orginial
  for (int y=0; y<=(pin.height-factor)/factor; y++) {
    for (int x=0; x<=(pin.width-factor)/factor; x++) {

      //set segments
      PImage seg = pin.get(x*factor, y*factor, factor, factor);

      // find color for each segment
      color col = averageCols(seg);  

      //put color in a list
      colorList[counter]= col;

      counter++;
    }
  }
  //fill new image with colors
  for (int i=0; i<reduc.pixels.length; i++) {
    reduc.pixels[i] = colorList[i];
  }

  return reduc;
}

//--------------------------------AVERAGES COLORS -----------------------------------
color averageCols(PImage pin) {
  color average;
  float r =0;
  float g =0;
  float b=0;

  //grab colors
  for (int i=0; i< pin.pixels.length; i++) {
    //this is a faster way to extract reds
    float rin =(pin.pixels[i] >> 16) & 0xFF;
    // extract greens
    float gin=(pin.pixels[i] >> 8) & 0xFF;
    //extract blues
    float bin =pin.pixels[i] & 0xFF;
    r+=rin;
    g+=gin;
    b+=bin;
  }
  //make average
  average = color(r/pin.pixels.length, g/pin.pixels.length, b/pin.pixels.length);
  return average;
}