PImage [] images;
PImage target;
PImage display;
PImage selectionEucVar;
PImage selectionEucSum;
PImage selectionChi;
PImage selectionCosSum;

PVector [] targetvalues;
PVector [] displayvalues;
PVector [] allVectors;
PVector [] testset;
PVector p1;
PVector p2;
PVector rgbVector;

float [] eucVarList;
float [] cosVarList;
float [] eucList;
float [] cosList;
float [] chiList;
float [][] histTarg;
float [][] histTest;

int counter=0;
int [][] targetvalues2;
int [][] testvalues2;

void setup() {
  colorMode(RGB);
  size(450, 300);
  //-------------------------------LOAD TARGET IMAGE & EXTRACT COLORS---------------------------

  //load target image and resize
  target = loadImage("LDN.jpg");

  target = customresize(target, 40);
  //built-in: target.resize(20, 15);

  // outputs PVector [] arrays to bin the colors
  targetvalues = extractCols(target);

  //extract colors as array for histogram comparison
  targetvalues2 = extractColArray(target);
  histTarg = new float[256][3];
  histTarg = hist(targetvalues2);

  //-------------------------------LOAD TARGET DISPLAY IMAGES---------------------------
  display = loadImage("LDN.jpg");

  //-------------------------------LOAD TESTSET---------------------------

  //get the path of the data folder
  //file is class
  File dir = new File(dataPath(""));
  //make an array with 
  String[] directory = dir.list();

  images = new PImage[directory.length-2];
  eucList = new float[directory.length-2];
  cosList = new float[directory.length-2];
  eucVarList = new float[directory.length-2];
  cosVarList = new float[directory.length-2];
  chiList = new float[directory.length-2];

  for (int i=0; i<directory.length-2; i++) { 
    //load image bulk
    images[i] = loadImage("Image_"+(i+1)+".jpg");

    images[i]= customresize(images[i], 40);
    //built-in: images[i].resize(20,15);

    //compute PVector color array for each image
    testset = extractCols(images[i]);

    //compute simple array for each image and make histogram
    testvalues2 = extractColArray(images[i]);
    histTest = hist(testvalues2);

    // simple sum of rgb vector
    eucList[i] = sum(euclidArray(testset));

    //variance of rgb vector
    eucVarList[i] = variance(euclidArray(testset));

    //cosine distance of rgb vector
    cosList[i] = sum(cosineArray(testset));

    //cosine distance of rgb vector
    cosVarList[i] = variance(cosineArray(testset));

    //chi squared distance of a chosen channel (0,1,2)
    chiList[i] = chi(histTarg, histTest);
  }

  //smallest euc-variance is most similar
  print(" Most similar image according to Variance of Euclidian distance:", min(eucVarList), "is image", indexPosMin(eucVarList)+1, "/");

  //smallest euc-sum is most similar
  print(" Most similar image according to Sum of Euclidian distance:", min(eucList), "is image", indexPosMin(eucList)+1, "/" );

  //largest cos-sum is most similar i.e. sum equal to pixel-length of target
  print(" Most similar image according to Sum of Cos distance:", max(cosList), "is image", indexPosMax(cosList)+1, "/" );

  //smallest cos-variance is most similar
  print(" Most similar image according to Variance of Cos distance:", min(cosVarList), "is image", indexPosMin(cosVarList)+1, "/" );

  //smallest chi-squared most similar
  print(" Most similar image according to histogram comparison:", min(chiList), "is image", indexPosMin(chiList)+1, "/" );
}

void draw() {
  //----------------------------DRAW WINNER IMAGES---------------------------------
  //target image
  display.resize(width/2, height/2);
  image(display, 0, 0);

  //euclidean variance
  selectionEucVar = loadImage("Image_"+(indexPosMin(eucVarList)+1)+".jpg");
  selectionEucVar.resize(width/2, height/2);
  image(selectionEucVar, 0, 0);

  //euclidean sum
  selectionEucSum = loadImage("Image_"+(indexPosMin(eucList)+1)+".jpg");
  selectionEucSum.resize(width/2, height/2);
  image(selectionEucSum, width/2, 0);

  //cosine sum
  selectionCosSum = loadImage("Image_"+(indexPosMax(cosList)+1)+".jpg");
  selectionCosSum.resize(width/2, height/2);
  image(selectionCosSum, 0, height/2);

  //histogram comparison
  selectionChi = loadImage("Image_"+(indexPosMin(chiList)+1)+".jpg");
  selectionChi.resize(width/2, width/2);
  image(selectionChi, width/2, height/2);
}