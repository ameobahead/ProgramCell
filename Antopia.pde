/* TODO LIST */
/*
Make World Class
two dimension array
land, soil, path, sleep room, ... class
*/

// Setting Parameter
Setting st;

// Utill Library
Utill ut;

// global
int WORLD_WIDTH = 800;
int WORLD_HEIGHT = 600;
int ANT_SIZE = 20;
// Object
Worker wAnt;
KtxA3 ktxObj;

ArrayList<Food> foodList;

PVector moveSpeed;

void setup() {
  size(800, 600);
  frameRate(10);
  
  st = new Setting(ANT_SIZE);
  ut = new Utill();

  wAnt = new Worker(width / 2, height / 2, ANT_SIZE);

  foodList = new ArrayList();
  foodList.add(new Food(ut.randomFloor(width), ut.randomFloor(height), ANT_SIZE));
  
  // KTX Object
  ktxObj = new KtxA3(ut.randomFloor(width), ut.randomFloor(height));
}

void draw() {
  background(230); 

  gridTest();

  wAnt.update();
  wAnt.show();

  for (int i = foodList.size() - 1; i >=0; i--) {
    Food food = foodList.get(i);
    food.show();
    
    if(wAnt.eatFood(food)) {
      foodList.remove(i);
      
      // delete memory
      food = null;
    }
  }
  
  ktxObj.show();
}


void gridTest() {

  for (int i = 0; i <= width; i += ANT_SIZE) {
    stroke(240);
    line(i, 0, i, height);
  }
  for (int j = 0; j <= height; j += ANT_SIZE) {
    stroke(240);
    line(0, j, width, j);
  }
}

void mouseClicked() {
  // foodList.add(new Food(floor(mouseX), floor(mouseY), ANT_SIZE));
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      moveSpeed = new PVector(0, -1);
      wAnt.applySpeed(moveSpeed);
    } else if (keyCode == DOWN) {
      moveSpeed = new PVector(0, 1);
      wAnt.applySpeed(moveSpeed);
    } else if (keyCode == LEFT) {
      moveSpeed = new PVector(-1, 0);
      wAnt.applySpeed(moveSpeed);
    } else if (keyCode == RIGHT) {
      moveSpeed = new PVector(1, 0);
      wAnt.applySpeed(moveSpeed);
    }

    // wAnt.update();
  }
}