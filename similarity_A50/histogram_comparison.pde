//----------------------------COLOR EXTRACTION FUNCTION as array---------------------------------
//extract rgb values
int [][] extractColArray(PImage pin) {
  int [][] cols;

  cols = new int[pin.pixels.length][3];

  for (int i=0; i< pin.pixels.length; i++) {

    //extract reds
    cols[i][0]=(pin.pixels[i] >> 16) & 0xFF;

    // extract greens
    cols[i][1]=(pin.pixels[i] >> 8) & 0xFF;

    //extract blues
    cols[i][2]=pin.pixels[i] & 0xFF;
  }
  return cols;
}

//-----------------------------CREATE HISTOGRAM------------------------------
float [][] hist(int [][] values) {
  float [][]histogram = new float [256][3];
  for (int i=0; i<300; i++) { 
    //go through all blues 0-255, r=0, r=1....r=255
    for (int j=0; j<=255; j++) {
      // count reds. all all values that contain i=0,i=1, i=2... 
      if (values[i][0] == j) {
        histogram[j][0]+=1;
      }
      //green counter
      if (values[i][1] == j) {
        histogram[j][1]+=1;
      }
      //blues counter
      if (values[i][2] == j) {        
        histogram[j][2]+=1;
      }
    }
  } 
  return histogram;
}

//----------------------------CHI SQUARED DISTANCE--------------------------------- 
// calculate chi-squared distance for one channel
float chi(float [][] histogramT, float [][] histogramI) {    
  float sum =0;
  for (int j=0; j<3; j++) {
    for (int i=0; i<=255; i++) {
      histogramT[i][j]=map(histogramT[i][j], 0, 256, 1, 10);
      histogramI[i][j]=map(histogramI[i][j], 0, 256, 1, 10);
      float chi = sq(histogramT[i][j]-histogramI[i][j])/(histogramT[i][j]+histogramI[i][j]);
      sum+=chi;
    }
  }
  float chiTot = 0.5*sum;
  return chiTot;
}