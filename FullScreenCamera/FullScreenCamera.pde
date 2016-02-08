  

import processing.video.*;
//Global Variables
Capture cam;
int numberCam=14;
String[] cameras = Capture.list();

void setup() {
  // size of the window
  //size(640, 480);
fullScreen();
 //size(displayWidth, displayHeight);
  
   int width=1280;
  int height=720; 
  //size(1280,720);

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    println("Working camera:");
    println(cameras[numberCam]);
    //cam = new Capture(this, width,height,"Front Camera,size=1280x720,fps=30");
        cam = new Capture(this, width,height,cameras[numberCam]);
    cam.start();     
  }      
}



void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam,0,0,1280,720); // without the resolution automatic adjust to the size of the origin image
    //image(cam,0,0,width,height); 
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}

// function to switch from frontal camera to rear camera and viceversa
//void mouseReleased() { 
//  // check which camera is avaible and change it
//  if(numberCam==14){
//  numberCam=6;
//  }
//  else
// {
// numberCam=  14;
// }
// // stop the actual camera
// cam.stop();
// // changing the new camera
//  cam = new Capture(this, cameras[numberCam]);
//      println(cameras[numberCam]);

//    cam.start();    
  
  
  
//}