class Rectangle{
  float posx, posy;
  float speed, defaultSpeed;
  PShape rect;
  boolean alive;
  int counter;
  float rand;
  
  Rectangle(float height, float width, float speed, float posx, float posy, boolean alive){
    rect = createShape(RECT, 0, 0, width, height);
    rect.setFill(0);
    rect.setStroke(false);
    this.speed = speed;
    this.defaultSpeed = speed;
    this.posx = posx;
    this.posy = posy;
    this.alive = alive;
    counter = 0;
  }
  
  void draw(){
    shape(rect, posx, posy);
  }
  
  void update(){
    this.posy += speed;
    this.draw();
    if(posy > 800){
      alive = false;
    }
  }
  
  void increaseSpeed(float speed){
    this.speed = defaultSpeed + speed;  
  }
  
  void spawnRand(int low, int high){
    rand = random(low, high);
  }
  
  void increaseCounter(){
    this.counter++; 
  }
  
  void setAlive(boolean alive){
    this.alive = alive;
    this.posy = -100;
  }
  
  void setCounter(int counter){
    this.counter = counter;
  }
  
  float getRand(){
    return rand;
  }
  
  int getCounter(){
    return counter;  
  }
  
  boolean getAlive(){
    return alive; 
  }
  
  float getPosY(){
    return posy; 
  }
}
