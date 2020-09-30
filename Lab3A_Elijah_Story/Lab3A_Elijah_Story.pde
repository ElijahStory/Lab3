//Lab 3A - NMD211
//Elijah Story
//9-25-2020

//Color Cycle Lab
//Systematically looping through colors over frames
//  - change background over time
//  - change colors of a shape (not in sync with shape)
//  - change color of outline (can be in sync with shape)

int framesSeen = 0;
int backgroundRed = 0;

void setup(){
  size(800, 800);
  
}

void draw(){
  background(0, 0, 0);
  
  framesSeen++;
  
  if(framesSeen % 1000 > 500){
    background(backgroundRed, 255, 255); 
    redDownCycle();
  }else{
    background(backgroundRed, 0, 0); 
    redUpCycle();
  }
}

void redUpCycle(){
  if(backgroundRed < 255){
    backgroundRed++;
  }
}

void redDownCycle(){
  if(backgroundRed > 0){
    backgroundRed--;
  }
}
