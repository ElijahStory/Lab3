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

void setup(){
  size(800, 800);
  
}

void draw(){ 
  framesSeen++;
  println(i);
  background(r, g, b);

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