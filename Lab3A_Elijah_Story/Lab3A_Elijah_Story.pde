//Lab 3A - NMD211
//Elijah Story
//9-25-2020

//Color Cycle Lab
//Systematically looping through colors over frames
//  - change background over time
//  - change colors of a shape (not in sync with shape)
//  - change color of outline (can be in sync with shape)

float framesSeen = 0;
float r = 0, g = 0, b = 0;
int i = 0;
float[][] colorSpeed = {{1,0,0},{0,1,0},{0,0,1},{0.29,0.08,0.45}};
Ball[] ballArray = new Ball[20];

void setup(){
  size(800, 800);
  
  for(int j = 0; j < ballArray.length; j++){
    ballArray[j] = new Ball(random(width), random(height), random(15,50));
  }
} 

class Ball{
  int i;
  float x, y, r, red, green, blue, xSpeed, ySpeed;
  Ball(float x, float y, float r){
    this.x = x;
    this.y = y;
    this.r = r;
    red = 0;
    green = 0;
    blue = 0;
    i = floor(random(1,colorSpeed.length));
    xSpeed = random(0.3, 1.5);
    ySpeed = random(0.3, 1.5);
  }

  void run(){
    colorChange();
    display();
    move();
  }

  void display(){
    stroke(red,green,blue);
    fill(red,green,blue);
    ellipse(x, y, r, r);
  }

  void move(){
    x += xSpeed;
    y += ySpeed;

    if(x > width || x < 0){
      xSpeed *= -1;
    }

    if(y > height || y < 0){
      ySpeed *= -1;
    }
  }

  void colorChange(){
    if(framesSeen % 510 == 0){
      i++;
    }

    if(i == colorSpeed.length){
      i = 0;
    }

    if(framesSeen % 510 < 255){
      red += colorSpeed[i][0];
      green += colorSpeed[i][1];
      blue += colorSpeed[i][2];
    }else{
      red -= colorSpeed[i][0];
      green -= colorSpeed[i][1];
      blue -= colorSpeed[i][2];
    }
  }
}

void draw(){ 
  framesSeen++;
  println(i);
  background(r, g, b);

  for(int j = 0; j < ballArray.length; j++){
    ballArray[j].run();
  }

  if(framesSeen % 510 == 0){
    i++;
  }

  if(i == colorSpeed.length){
    i = 0;
  }


  if(framesSeen % 510 < 255){
    r += colorSpeed[i][0];
    g += colorSpeed[i][1];
    b += colorSpeed[i][2];
  }else{
    r -= colorSpeed[i][0];
    g -= colorSpeed[i][1];
    b -= colorSpeed[i][2];
  }
}