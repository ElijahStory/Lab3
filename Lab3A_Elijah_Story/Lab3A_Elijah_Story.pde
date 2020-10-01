//Lab 3A - NMD211
//Elijah Story
//9-25-2020

//Color Cycle Lab
//Systematically looping through colors over frames
//  - change background over time
//  - change colors of a shape (not in sync with shape)
//  - change color of outline (can be in sync with shape)

float framesSeen = 0;           //used to know how many frames passed
float r = 0, g = 0, b = 0;      //controls rgb vlaue for background
int i = 0;                      //index counter to loop colorSpeed

//nessted array that holds speed to change color
float[][] colorSpeed = {{1,0,0},{0,1,0},{0,0,1},{0.29,0.08,0.45}};
Ball[] ballArray = new Ball[20]; //holds all Ball objects

void setup(){
  size(800, 800);
  
  //sets up ball objects with random values
  for(int j = 0; j < ballArray.length; j++){
    ballArray[j] = new Ball(random(width), random(height), random(15,50));
  }
} 

//ball class
class Ball{
  int i;  //index for colorSpeed

  //variables used by the class
  float x, y, r, red, green, blue, xSpeed, ySpeed;
  Ball(float x, float y, float r){  //sets up variables from passed in values
    this.x = x;
    this.y = y;
    this.r = r;
    red = 0;
    green = 0;
    blue = 0;
    i = floor(random(1,colorSpeed.length)); //picks a start color thats not red
    xSpeed = random(0.3, 1.5);
    ySpeed = random(0.3, 1.5);
  }

//runs all the functions for the object
  void run(){
    colorChange();
    display();
    move();
  }

//draws the ball based on the variables
  void display(){
    stroke(red,green,blue);
    fill(red,green,blue);
    ellipse(x, y, r, r);
  }

//makes the ball bounce off the walls
  void move(){
    //updates the x and y
    x += xSpeed;
    y += ySpeed;

    if(x > width || x < 0){ //if the ball hits the side wall, change direction
      xSpeed *= -1;
    }

    if(y > height || y < 0){//if the ball hits the floor or ceiling, change direction
      ySpeed *= -1;
    }
  }

//changes the color of the ball based on the framesSeen
  void colorChange(){
    if(framesSeen % 510 == 0){  //once it has shown that color, move to next in array
      i++;
    }

    if(i == colorSpeed.length){ //at the end of array, start over
      i = 0;
    }

    if(framesSeen % 510 < 255){//makes the color come in
      red += colorSpeed[i][0];
      green += colorSpeed[i][1];
      blue += colorSpeed[i][2];
    }else{                    //makes the color go out(back to black)
      red -= colorSpeed[i][0];
      green -= colorSpeed[i][1];
      blue -= colorSpeed[i][2];
    }
  }
}

void draw(){ 
  framesSeen++; //updates the framesSeen
  background(r, g, b);  //draws background based on values

  for(int j = 0; j < ballArray.length; j++){  //calls run for all the ball objects
    ballArray[j].run();
  }

  if(framesSeen % 510 == 0){  //once it has shown that color, move to next in array
    i++;
  }

  if(i == colorSpeed.length){ //at the end of array, start over
    i = 0;
  }


  if(framesSeen % 510 < 255){ //makes the color come in
    r += colorSpeed[i][0];
    g += colorSpeed[i][1];
    b += colorSpeed[i][2];
  }else{                     //makes the color go out(back to black)
    r -= colorSpeed[i][0];
    g -= colorSpeed[i][1];
    b -= colorSpeed[i][2];
  }
}