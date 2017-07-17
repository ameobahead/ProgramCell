class KtxA3 {
  Core coreA3;
  ArrayList<Liquid> liquidA3;
  int liquidSize = 5;

  KtxA3(int _x, int _y) {
    coreA3 = new Core(_x, _y);
    liquidA3 = new ArrayList();
    
    for(int i = 0; i < liquidSize; i++) {
      liquidA3.add(new Liquid(coreA3));
    }
    
  }
  
  // Entire KtxA3 Class Show
  void show() {
    // core show
    coreA3.show();
    
    // liquid ArrayList show
    for(Liquid l1 : liquidA3) {
      l1.show();
    }
  }
  
}

// Core
class Core {
  PVector local;
  int stepSize;
  
  Core(int _x, int _y) {
    stepSize = Setting.getStepSize();
    
    Utill ut = new Utill();
    local = new PVector(ut.scaleUp(_x, stepSize), ut.scaleUp(_y, stepSize));
    
  }
  
  // Show Core
  void show() {
    fill(0);
    noStroke();
    rect(local.x, local.y, stepSize, stepSize);
  }
}

// Liquid
// Sticky around Core
class Liquid {
  PVector local;
  int stepSize;
  
  // Liquid location is located Random Gaussian
  Liquid(Core _core) {
    stepSize = Setting.getStepSize();
    
    Utill ut = new Utill();
    
    int fixX = ut.scaleUp((int)_core.local.x + int(randomGaussian()) * stepSize, stepSize);
    int fixY = ut.scaleUp((int)_core.local.y + int(randomGaussian()) * stepSize, stepSize);

    local = new PVector(fixX, fixY); 
    
    println(local);
    
    
  }
  
  // show liquid
  void show() {
    fill(100, 200, 50);
    noStroke();
    rect(local.x, local.y, stepSize, stepSize);
  }
}