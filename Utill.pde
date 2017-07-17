class Utill {
  /* return Random Integer Numver */
  int randomFloor(int limit) {
    float outRandom = random(limit);

    return floor(outRandom);
  }

  int randomFloor(float limit) {  
    float outRandom = random(limit);

    return floor(outRandom);
  }
  
    /* Adjust coordinate with Scale size */
  int scaleUp(int rough, int size) {
    int modNum = rough % size;
    
    return rough - modNum;
  }
}