class World {
  
  ArrayList<Tile> worldArray;
  int entireWidth;
  int entireHeight;

  World(int _width, int _height, int _stepSize) {
    entireWidth = _width / _stepSize;
    entireHeight = _height / _stepSize;

    // Create Two dimention Array
    for(int w = 0; w < entireWidth; w++) {
        for(int h = 0; h < entireHeight; h++) {
            // worldArray[w][h] = new Tile();
        }
    }

  } 

}