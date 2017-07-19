import queasycam.*;

QueasyCam cam; // Allows users to move the mouse to look and use WSAD to move. Do not modify anything that
//                has cam at the start. Doing so may break something.
/*CONFIG*/
 Boolean flooding = true; // Causes water level to slowly rise.
 float a = 100; // 100 is good for an islandlike world. Don't go below 50, it gets really uneventful. Default: 100
 float d = 0.006; // How zoomed in the world is. 0.006 is a very good value. Default: 0.006
 int range = 16; // Sight range. Numbers above 16 will be laggy for older PCs. Default: 16
 float waveHeight = 5; //Can become buggy if modified. Does not impact performance. Default: 1
 float waveSpeed = 0.15; // Modifies speed of the water waves. Does not impact performance. Default: 0.15
 float waterHeight = 0.62; // a number between 0 and 1. 0 means no water, 1 means all water. 0.62 is good for islands. Default: 0.62
 float blockSize = 1; // DO NOT GO LOWER THAN 1--IT MAY CAUSE INSTABILITY. Default: 1
 float camSpeed = 4; // Changes speed of the camera. Not recommended to change it above 6 or below 2. Default: 4
 float camSens = 2; // Sensitivity of the camera. Change at your own discretion. Default:2
 float floodSpeed = 0.001; // 0.001 is the recommended value (and default)
/*Other*/
float wNO = 0; // Does nothing cool when modified by user. A value used by scripts to control water wave animation. Default: 0


/*Actual code*/
void setup(){
  println();
  //box = createShape(BOX,1,20,1);
  size(900, 675, P3D);
  //fullScreen(P3D);
  cam = new QueasyCam(this);
  cam.speed = camSpeed;              // default is 3
  cam.sensitivity = camSens;      // default is 2
  cam.friction = 0.1;
  
}

void draw(){
  if(flooding && mouseButton == LEFT && mousePressed){
    //wIV = wIV * 1.001;
    waterHeight+=floodSpeed;
   
  }else if(flooding&&mouseButton==RIGHT&&mousePressed){
    waterHeight-=floodSpeed;
  }
  
  //cam.position.y = a*noise(cam.position.x*d,0,cam.position.z*d)-13;//noise(cam.position.x*d,0,cam.position.z*d) < 1-waterHeight ? a*noise(cam.position.x*d,0,cam.position.z*d)-13 : a*(1-waterHeight);
  noCursor();
  //directionalLight(255, 255, 255, 0, 1000000, 1000000);
  wNO+=waveSpeed;
  background(135,206,250);
  for (int xa = (int)cam.position.x-range; xa < range+cam.position.x; xa+=blockSize){
    for (int za = (int)cam.position.z-range; za < range+cam.position.z; za+=blockSize){
      float x = round(xa / blockSize)*blockSize;
      float z = round(za / blockSize)*blockSize;
      pushMatrix();
      float n = a*noise((x+(blockSize/2))*d,0,(z+(blockSize/2))*d);
      float nprim = noise((x+(blockSize/2))*d,0,(z+(blockSize/2))*d);
      if(nprim > 1-waterHeight){fill(0,100,255);stroke(0,50,205);n=(1.0-waterHeight)*a+(waveHeight*map(noise((x+wNO)*d*5,0,(z+wNO)*d*5),0,1,-0.2,1));}
      if(nprim < 1-waterHeight && nprim > 0.96-waterHeight){fill(255,150,0);stroke(205,100,0);}
      if(nprim<0.96-waterHeight){fill(0,180,0);stroke(0,120,0);}
      //noStroke();
      translate(x,n,z);
      box(blockSize,20,blockSize);
      //box.setStroke(0);
      //texture(grass);
      //shape(box);
      popMatrix();
    }
  }
  //pushMatrix();
  //camera();
  //textSize(16);
  //fill(0);
  //text("WH="+(waveHeight),30,30);
  //popMatrix();
}
