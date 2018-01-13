//----------------------------EUCLIDIAN ARRAY FUNCTION---------------------------------
// makes a 1d array for each difference (test-image[i])
final float [] euclidArray(PVector [] values) {
  float [] distlist; 
  distlist = new float[targetvalues.length];
  float dist;

  for ( int i=0; i<=targetvalues.length-1; i++) {     

    //vector for each pixel in target-image
    p1 = targetvalues[i];

    //vector for each pixel in test-image
    p2 = values[i];

    //euclidian distance with vectors
    dist = PVector.dist(p1, p2);

    distlist[i] = dist;
  }
  return distlist;
}

//----------------------------COSINE ARRAY FUNCTION---------------------------------
// makes a 1d array for each difference (test-image[i])
final float [] cosineArray(PVector [] values) {
  float [] distlist; 
  distlist = new float[targetvalues.length];
  //float cos = 0;
  float dot;

  for ( int i=0; i<=targetvalues.length-1; i++) {     

    //vector for each pixel in target-image
    p1 = targetvalues[i];

    //vector for each pixel in test-image
    p2 = values[i];

    //make the sum of all dot products,divide it by the magnitude
    dot = PVector.dot(p1, p2)/(p1.mag()*p2.mag());

    //print(dot," // ", frameCount, "//");

    //frameCount++;

    distlist[i] = dot;
  }
  return distlist;
}

//----------------------------VARIANCE--------------------------------- 
float variance(float [] distList) {
  float sum1 = 0;
  float average = sum(distList)/distList.length;

  for (int i=0; i<=distList.length-1; i++) {
    sum1 += pow(distList[i] - average, 2);
  }

  float variance = sum1 / distList.length;
  //print(variance);

  return variance;
}

//----------------------------SUM---------------------------------
// this simply calculates the total of all rgb values in an array
float sum(float [] distList) {
  float sum = 0;
  for (int i=0; i<distList.length-1; i++) {
    sum+=distList[i];
  }

  return sum;
}