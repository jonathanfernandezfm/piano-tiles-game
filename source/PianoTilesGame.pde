
PShape backgroundRect;  // The PShape object

Rectangle rect1;
Rectangle rect2;
Rectangle rect3;
Rectangle rect4;
Rectangle rect5;
Rectangle rect6;
Rectangle rect7;
Rectangle rect8;

int rectangleHeight = 150;
int rectangleWidth = 100;
float defaultSpeed = 4.0;

float rand1 = 0, rand2 = 0, rand3 = 0, rand4 = 0, rand5 = 0, rand6 = 0, rand7 = 0, rand8 = 0;
int spawnRatioLow = 30;
int spawnRatioHigh = 100;

int gameScore = 0;
int level = 0;
float speed = defaultSpeed;

gameStates GAMESTATE = gameStates.START;

void drawLinesBackground(){
  line(120, 0, 120, 800);
  stroke(243, 242, 254);
  strokeWeight(4);
  
  line(240, 0, 240, 800);
  stroke(243, 242, 254);
  strokeWeight(4);
  
  line(360, 0, 360, 800);
  stroke(243, 242, 254);
  strokeWeight(4);
  
  line(480, 0, 480, 800);
  stroke(243, 242, 254);
  strokeWeight(4);
}

void setup(){
  size(600, 800);
  frameRate(60);
  rect1 = new Rectangle(rectangleHeight, rectangleWidth, defaultSpeed, 70, -100, false);
  rect2 = new Rectangle(rectangleHeight, rectangleWidth, defaultSpeed, 70, -100, false);
  rect3 = new Rectangle(rectangleHeight, rectangleWidth, defaultSpeed, 190, -100, false);
  rect4 = new Rectangle(rectangleHeight, rectangleWidth, defaultSpeed, 190, -100, false);
  rect5 = new Rectangle(rectangleHeight, rectangleWidth, defaultSpeed, 310, -100, false);
  rect6 = new Rectangle(rectangleHeight, rectangleWidth, defaultSpeed, 310, -100, false);
  rect7 = new Rectangle(rectangleHeight, rectangleWidth, defaultSpeed, 430, -100, false);
  rect8 = new Rectangle(rectangleHeight, rectangleWidth, defaultSpeed, 430, -100, false);
  
  backgroundRect = createShape(RECT, 0, 0, width, 200);
  backgroundRect.setFill(color(220, 220, 245));
  backgroundRect.setStroke(false);
}

void draw(){
  if(GAMESTATE == gameStates.LOST){
    background(0);
    textSize(80);
    fill(255, 255, 255);
    text("YOU", 280, 300);
    text("LOST", 280, 400);
  }else{
    //BACKGROUND
    background(220, 200, 245);
    
    //CLICKABLE ZONE
    shape(backgroundRect, 0, 600);
    
    //LINES
    drawLinesBackground();
    
    //UPDATES
    update(rect1);
    update(rect2);
    update(rect3);
    update(rect4);
    update(rect5);
    update(rect6);
    update(rect7);
    update(rect8);
    
    //TEXT GAME SCORE AND LEVEL
    textSize(25);
    fill(0, 102, 153);
    text("Game Score: " + gameScore, 20, 40);
    text("Level: " + level, 20, 65);
    
    //LEVEL AND SPEED
    level = gameScore/25;
    speed = level/3;
  
  }
  print(GAMESTATE);

  //DEBUGG
  textSize(10);
  text(mouseX + " " + mouseY, 10, 500);
}

void update(Rectangle rect){
  if(!rect.getAlive()){
    if(rect.getCounter() == 0){
      rect.spawnRand(spawnRatioLow, spawnRatioHigh);
      rect.increaseCounter();
    }else if(rect.getCounter() > rect.getRand()){
      rect.setAlive(true);
      rect1.setCounter(1);
      rect2.setCounter(1);
      rect3.setCounter(1);
      rect4.setCounter(1);
      rect5.setCounter(1);
      rect6.setCounter(1);
      rect7.setCounter(1);
      rect8.setCounter(1);
    }else{
      rect.increaseCounter(); 
    }
  }
  
  rect.increaseSpeed(speed);
  
  if(rect.getAlive()){
    rect.update();
  }
  
  if(rect.getPosY() > 800){
    GAMESTATE = gameStates.LOST;
  }
}

void mousePressed(){
  if(mouseX > 70 && mouseX < 170){
    if(rect1.getAlive()){
      if(mouseY < rect1.getPosY()+150 && mouseY > rect1.getPosY() && mouseY > 600){
        rect1.setAlive(false);
        gameScore++;
      }
    }
    if(rect2.getAlive()){
      if(mouseY < rect2.getPosY()+150 && mouseY > rect2.getPosY() && mouseY > 600){
        rect2.setAlive(false);
        gameScore++;
      }
    }
  }
  
  if(mouseX > 190 && mouseX < 290){
    if(rect3.getAlive()){
      if(mouseY < rect3.getPosY()+150 && mouseY > rect3.getPosY() && mouseY > 600){
        rect3.setAlive(false);
        gameScore++;
      }
    }
    if(rect4.getAlive()){
      if(mouseY < rect4.getPosY()+150 && mouseY > rect4.getPosY() && mouseY > 600){
        rect4.setAlive(false);
        gameScore++;
      }
    }
  }
  
  if(mouseX > 310 && mouseX < 410){
    if(rect5.getAlive()){
      if(mouseY < rect5.getPosY()+150 && mouseY > rect5.getPosY() && mouseY > 600){
        rect5.setAlive(false);
        gameScore++;
      }
    }
    if(rect6.getAlive()){
      if(mouseY < rect6.getPosY()+150 && mouseY > rect6.getPosY() && mouseY > 600){
        rect6.setAlive(false);
        gameScore++;
      }
    }
  }
  
  if(mouseX > 430 && mouseX < 530){
    if(rect7.getAlive()){
      if(mouseY < rect7.getPosY()+150 && mouseY > rect7.getPosY() && mouseY > 600){
        rect7.setAlive(false);
        gameScore++;
      }
    }
    if(rect8.getAlive()){
      if(mouseY < rect8.getPosY()+150 && mouseY > rect8.getPosY() && mouseY > 600){
        rect8.setAlive(false);
        gameScore++;
      }
    }
  }
}
