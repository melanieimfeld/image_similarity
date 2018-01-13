//----------------------------COLOR EXTRACTION FUNCTION as Pvector---------------------------------
//extract red, green and blue values, store as array 
PVector [] extractCols(PImage pin) {
  float [][] cols;

  allVectors = new PVector[pin.pixels.length];
  cols = new float[pin.pixels.length][3];

  for (int i=0; i< pin.pixels.length; i++) {

    //this is a faster way to extract reds
    cols[i][0]=(pin.pixels[i] >> 16) & 0xFF;

    // extract greens
    cols[i][1]=(pin.pixels[i] >> 8) & 0xFF;

    //extract blues
    cols[i][2]=pin.pixels[i] & 0xFF;

    //COMPRESS
    //make a rgb - vector for each pixel
    rgbVector = new PVector(cols[i][0], cols[i][1], cols[i][2]);

    //append each rgb vector to an array???
    allVectors[i] = rgbVector;
  }
  return allVectors;
}