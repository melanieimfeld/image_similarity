//----------------------------FUNCTION TO FIND INDEX (min)--------------------------------- 
int indexPosMin( float [] values) {
  int pos=0;
  float min = min(values);

  for (int i=0; i<values.length-1; i++)
  {
    if (values[i]== min) {
      pos=i;
    }
  }
  return pos;
}


//----------------------------FUNCTION TO FIND INDEX (max)--------------------------------- 
int indexPosMax( float [] values) {
  int pos=0;
  float max = max(values);

  for (int i=0; i<values.length-1; i++)
  {
    if (values[i]== max) {
      pos=i;
    }
  }
  return pos;
}