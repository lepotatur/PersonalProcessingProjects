float speedmult = 0.5;
ArrayList<unit> units = new ArrayList<unit>();
PVector campos = new PVector(width/2, height/2);
int reinfs = 0;
int red = 0;
float superFreq = 0.025;
int blue = 0;
void setup() {
  noStroke();
  //size(720, 500);
  fullScreen();
}
boolean wkey = false;
boolean skey = false;
boolean akey = false;
boolean dkey = false;
unit Player;
void draw() {
  translate(0,0);
  fill(255);
  rect(0,0,50,50);
  if (Player != null) {
    if (wkey) {
      Player.pos.y-=Player.speed;
    }
    if (skey) {
      Player.pos.y+=Player.speed;
    }
    if (akey) {
      Player.pos.x-=Player.speed;
    }
    if (dkey) {
      Player.pos.x+=Player.speed;
    }
    //PVector acceleration = PVector.sub(new PVector(mouseX-width/2, mouseY-height/2), Player.pos);/*new PVector(mouseX,mouseY),Player.pos*/
    //// Set magnitude of acceleration
    //acceleration.setMag(1);

    //// Velocity changes according to acceleration
    //Player.velocity.add(acceleration);
    //// Limit the velocity by topspeed
    //Player.velocity.limit(3);
    //// Location changes by velocity
    //Player.pos.add(Player.velocity);
    translate(width/2, height/2);
    scale(2);
    translate(-Player.pos.x, -Player.pos.y);
  } else {
    scale(1);
    translate(0, 0);
  }
  background(0, 70, 0);
  //translate(-campos.x,-campos.y);
  //ellipse(width/2,height/2,50,50);
  for (int i = 0; i < units.size(); i++) {
    units.get(i).update();
  }
  float r = random(2);
  //if (Player != null) {
  //  Player.update();
  //}
  if (units.size() < 400) {
    if (r < 1 ) {
      if (random(1) > superFreq) {
        units.add(new unit(-width*2, random(height), color(255, 0, 0), false, false));
        red++;
      } else {
        units.add(new unit(-width*2, random(height), color(255, 0, 0), true, false));
        red++;
      }
    } else if (r > 1 && r < 2) {
      if (random(1) > superFreq) {
        units.add(new unit(width*2, random(height), color(0, 0, 255), false, false));
        blue++;
      } else {
        units.add(new unit(width*2, random(height), color(0, 0, 255), true, false));
        blue++;
      }
    }//else{
  }
  if (blue == 0 && frameCount > 100) {
    for (int i = 0; i < 75; i++) {
      units.add(new unit(random(-50,50)+width*4,random(-50,50)+height/2, color(0, 0, 255), true, false));
      blue++;
    }

  }
  if (red == 0 && frameCount > 100) {
    for (int i = 0; i < 72; i++) {
      units.add(new unit(random(-50,50)+width*-4,random(-50,50)+height/2, color(255, 0, 0), true, false));
      red++;
    }
    
  }
  if (reinfs < 1) {
    Player = new unit(width/2, height/2, color(0, 255, 0), true, true);
    units.add(new unit(25+width/2, 25+height/2, color(0, 255, 0), true, true));
    units.add(new unit(-25+width/2, -25+height/2, color(0, 255, 0), true, true));
    units.add(new unit(25+width/2, -25+height/2, color(0, 255, 0), true, true));
    units.add(new unit(-25+width/2, 25+height/2, color(0, 255, 0), true, true));
    units.add(Player);
    reinfs++;
  }
  //strokeWeight(5);
  //stroke(255);
  //fill(255);
  //line(width/2,0,width/2,height);
  noFill();
  stroke(255);
  strokeWeight(3);
  //for (int i = 0; i < 10; i++) {
    //if(i==0) {
      rect(0,0,width,height);
    //}//else
    //{
    //  ellipse(-i*width,-i*height,width*(i+1),height*(i+i));
    //}
  //}
  rect(width/2,height/2,1,1);
  strokeWeight(1);
  noStroke();
}
//player Player = null;
//void mousePressed() {
//  if (mouseButton == CENTER && Player == null) {
//    Player = new player(width-10,random(height), color(0,0,255));
//    println("created new player at");
//    println(Player.pos.x);
//    println(Player.pos.y);
//  }
//}
/*
p5.collide2D was created by http://benmoren.com
Some functions and code modified version from http://www.jeffreythompson.org/collision-detection
Apache License 2.0 
Processing2DCollide Version 0.1 | July 16, 2017

Processing2DCollide made by @lepotatur on github
__________________________________________________________________________
\\.....................................................................//|
I do not claim rights to this code. Rights go to their respective owners.|
        All I did was convert p5.collide2D to Processing's Java.         |
\\.....................................................................//|
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/
//println("### processing collide ###")




//.....................................................................//
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
/////////////////////////________________________/////////////////////////
/////////////////////////| Calc Intersection is |/////////////////////////
/////////////////////////|      depricated      |////////////////////////
/////////////////////////| in the Java version. |////////////////////////
/////////////////////////¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//.....................................................................//

float undefinedF;
int undefinedI;
Boolean undefinedB;
Boolean _collideDebug = false;

void collideDebug(Boolean debugMode){
    _collideDebug = debugMode;
}

/*~++~+~+~++~+~++~++~+~+~ 2D ~+~+~++~+~++~+~+~+~+~+~+~+~+~+~+*/

Boolean collideRectRect(float x, float y, float w, float h, float x2, float y2, float w2, float h2) {
  //2d
  //add in a thing to detect ellipseMode CENTER
  if (x + w >= x2 &&    // r1 right edge past r2 left
      x <= x2 + w2 &&    // r1 left edge past r2 right
      y + h >= y2 &&    // r1 top edge past r2 bottom
      y <= y2 + h2) {    // r1 bottom edge past r2 top
        return true;
  }
  return false;
};

Boolean collideRectCircle(float rx, float ry, float rw, float rh, float cx, float cy, float diameter) {
  //2d
  // temporary variables to set edges for testing
  float testX = cx;
  float testY = cy;

  // which edge is closest?
  if (cx < rx){         testX = rx;       // left edge
  }else if (cx > rx+rw){ testX = rx+rw;  }   // right edge

  if (cy < ry){         testY = ry ;      // top edge
  }else if (cy > ry+rh){ testY = ry+rh ;}   // bottom edge

  // // get distance from closest edges
  float distance = dist(cx,cy,testX,testY);

  // if the distance is less than the radius, collision!
  if (distance <= diameter/2) {
    return true;
  }
  return false;
};

Boolean collideCircleCircle(float x, float y, float d, float x2, float y2, float d2) {
//2d
  if( dist(x,y,x2,y2) <= (d/2)+(d2/2) ){
    return true;
  }
  return false;
};

Boolean collidePointCircle(float x, float y, float cx, float cy, float d) {
//2d
if( dist(x,y,cx,cy) <= d/2 ){
  return true;
}
return false;
};

Boolean collidePointRect(float pointX, float pointY, float x, float y, float xW, float yW) {
//2d
if (pointX >= x &&         // right of the left edge AND
    pointX <= x + xW &&    // left of the right edge AND
    pointY >= y &&         // below the top AND
    pointY <= y + yW) {    // above the bottom
        return true;
}
return false;
};

Boolean collidePointLine( float px, float py, float x1, float y1, float x2, float y2, float buffer){
  // get distance from the point to the two ends of the line
float d1 = dist(px,py, x1,y1);
float d2 = dist(px,py, x2,y2);

// get the length of the line
float lineLen = dist(x1,y1, x2,y2);

// since floats are so minutely accurate, add a little buffer zone that will give collision
if (buffer == undefinedF){ buffer = 0.1; }   // higher # = less accurate

// if the two distances are equal to the line's length, the point is on the line!
// note we use the buffer here to give a range, rather than one #
if (d1+d2 >= lineLen-buffer && d1+d2 <= lineLen+buffer) {
  return true;
}
return false;
}

Boolean collideLineCircle( float x1,  float y1,  float x2,  float y2,  float cx,  float cy,  float diameter) {
  // is either end INSIDE the circle?
  // if so, return true immediately
  Boolean inside1 = this.collidePointCircle(x1,y1, cx,cy,diameter);
  Boolean inside2 = this.collidePointCircle(x2,y2, cx,cy,diameter);
  if (inside1 || inside2) return true;

  // get length of the line
  float distX = x1 - x2;
  float distY = y1 - y2;
  float len = sqrt( (distX*distX) + (distY*distY) );

  // get dot product of the line and circle
  float dot = ( ((cx-x1)*(x2-x1)) + ((cy-y1)*(y2-y1)) ) / pow(len,2);

  // find the closest point on the line
  float closestX = x1 + (dot * (x2-x1));
  float closestY = y1 + (dot * (y2-y1));

  // is this point actually on the line segment?
  // if so keep going, but if not, return false
  Boolean onSegment = collidePointLine(closestX,closestY,x1,y1,x2,y2,0);
  if (!onSegment) return false;

  // draw a debug circle at the closest point on the line
  if(_collideDebug){
    ellipse(closestX, closestY,10,10);
  }

  // get distance to closest point
  distX = closestX - cx;
  distY = closestY - cy;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  if (distance <= diameter/2) {
    return true;
  }
  return false;
}

Boolean collideLineLine(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {

  //Boolean intersection;

  // calculate the distance to intersection point
  float  uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  float  uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

  // if uA and uB are between 0-1, lines are colliding
  if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
    float intersectionX = 0;
    float intersectionY = 0;
    if(_collideDebug){
      // calc the point where the lines meet
      intersectionX = x1 + (uA * (x2-x1));
      intersectionY = y1 + (uA * (y2-y1));
    }

    if(_collideDebug){
      ellipse(intersectionX,intersectionY,10,10);
    }

    return true;
    
  }
  
  return false;
}

Boolean collideLineRect(float x1, float y1, float x2, float y2, float rx, float ry, float rw, float rh) {

  // check if the line has hit any of the ellipseangle's sides. uses the collideLineLine function above
  Boolean left, right, top, bottom;

  
  //return booleans
  left =   collideLineLine(x1,y1,x2,y2, rx,ry,rx, ry+rh);
  right =  collideLineLine(x1,y1,x2,y2, rx+rw,ry, rx+rw,ry+rh);
  top =    collideLineLine(x1,y1,x2,y2, rx,ry, rx+rw,ry);
  bottom = collideLineLine(x1,y1,x2,y2, rx,ry+rh, rx+rw,ry+rh);
  

  // if ANY of the above are true, the line has hit the ellipseangle
  if (left || right || top || bottom) {
    return true;
  }
  return false;
}


Boolean collidePointPoly(float px, float py, PVector vertices[]) {
  Boolean collision = false;

  // go through each of the vertices, plus the next vertex in the list
  float  next = 0;
  for (float  current=0; current<vertices.length; current++) {

    // get next vertex in list if we've hit the end, wrap around to 0
    next = current+1;
    if (next == vertices.length) next = 0;

    // get the PVectors at our current position this makes our if statement a little cleaner
    PVector  vc = vertices[(int)current];    // c for "current"
    PVector  vn = vertices[(int)next];       // n for "next"

    // compare position, flip 'collision' variable back and forth
    if (((vc.y > py && vn.y < py) || (vc.y < py && vn.y > py)) &&
         (px < (vn.x-vc.x)*(py-vc.y) / (vn.y-vc.y)+vc.x)) {
            collision = !collision;
    }
  }
  return collision;
}

// POLYGON/CIRCLE
Boolean collideCirclePoly(float cx, float cy, float diameter, PVector vertices[], Boolean interior) {

  if (interior == undefinedB){
    interior = false;
  }

  // go through each of the vertices, plus the next vertex in the list
  float  next = 0;
  for (float  current=0; current<vertices.length; current++) {

    // get next vertex in list if we've hit the end, wrap around to 0
    next = current+1;
    if (next == vertices.length) next = 0;

    // get the PVectors at our current position this makes our if statement a little cleaner
    PVector  vc = vertices[(int)current];    // c for "current"
    PVector  vn = vertices[(int)next];       // n for "next"

    // check for collision between the circle and a line formed between the two vertices
    Boolean collision = this.collideLineCircle(vc.x,vc.y, vn.x,vn.y, cx,cy,diameter);
    if (collision) return true;
  }

  // test if the center of the circle is inside the polygon
  if(interior == true){
    Boolean centerInside = this.collidePointPoly(cx,cy, vertices);
    if (centerInside) return true;
  }

  // otherwise, after all that, return false
  return false;
}

Boolean collideRectPoly( float rx, float ry, float rw, float rh, PVector vertices[], Boolean interior) {
  if (interior == undefinedB){
    interior = false;
  }

  // go through each of the vertices, plus the next vertex in the list
  float next = 0;
  for (float current=0; current<vertices.length; current++) {

    // get next vertex in list if we've hit the end, wrap around to 0
    next = current+1;
    if (next == vertices.length) next = 0;

    // get the PVectors at our current position this makes our if statement a little cleaner
    PVector vc = vertices[(int)current];    // c for "current"
    PVector vn = vertices[(int)next];       // n for "next"

    // check against all four sides of the ellipseangle
    Boolean collision = this.collideLineRect(vc.x,vc.y,vn.x,vn.y, rx,ry,rw,rh);
    if (collision) return true;

    // optional: test if the ellipseangle is INSIDE the polygon note that this iterates all sides of the polygon again, so only use this if you need to
    if(interior == true){
      Boolean inside = this.collidePointPoly(rx,ry, vertices);
      if (inside) return true;
    }
  }

  return false;
}

Boolean collideLinePoly(float x1, float y1, float x2, float y2, PVector vertices[]) {

  // go through each of the vertices, plus the next vertex in the list
  float  next = 0;
  for (float  current=0; current<vertices.length; current++) {

    // get next vertex in list if we've hit the end, wrap around to 0
    next = current+1;
    if (next == vertices.length) next = 0;

    // get the PVectors at our current position extract X/Y coordinates from each
    float  x3 = vertices[(int)current].x;
    float  y3 = vertices[(int)current].y;
    float  x4 = vertices[(int)next].x;
    float  y4 = vertices[(int)next].y;

    // do a Line/Line comparison if true, return 'true' immediately and stop testing (faster)
    Boolean hit = this.collideLineLine(x1, y1, x2, y2, x3, y3, x4, y4);
    if (hit) {
      return true;
    }
  }
  // never got a hit
  return false;
}

Boolean collidePolyPoly(PVector p1[], PVector p2[], Boolean interior) {
  if (interior == undefinedB){
    interior = false;
  }

  // go through each of the vertices, plus the next vertex in the list
  float  next = 0;
  for (float  current=0; current<p1.length; current++) {

    // get next vertex in list, if we've hit the end, wrap around to 0
    next = current+1;
    if (next == p1.length) next = 0;

    // get the PVectors at our current position this makes our if statement a little cleaner
    PVector  vc = p1[(int)current];    // c for "current"
    PVector  vn = p1[(int)next];       // n for "next"

    //use these two points (a line) to compare to the other polygon's vertices using polyLine()
    Boolean collision = this.collideLinePoly(vc.x,vc.y,vn.x,vn.y,p2);
    if (collision) return true;

    //check if the 2nd polygon is INSIDE the first
    if(interior == true){
      collision = this.collidePointPoly(p2[0].x, p2[0].y, p1);
      if (collision) return true;
    }
  }

  return false;
}

Boolean collidePointTriangle(float px, float py, float x1, float y1, float x2,float  y2, float x3, float y3) {

  // get the area of the triangle
  float areaOrig = abs( (x2-x1)*(y3-y1) - (x3-x1)*(y2-y1) );

  // get the area of 3 triangles made between the point and the corners of the triangle
  float area1 = abs( (x1-px)*(y2-py) - (x2-px)*(y1-py) );
  float area2 = abs( (x2-px)*(y3-py) - (x3-px)*(y2-py) );
  float area3 = abs( (x3-px)*(y1-py) - (x1-px)*(y3-py) );

  // if the sum of the three areas equals the original, we're inside the triangle!
  if (area1 + area2 + area3 == areaOrig) {
    return true;
  }
  return false;
}

Boolean collidePointPoint(float x,float y,float x2,float y2, float buffer) {
    if(buffer == undefinedF){
      buffer = 0;
    }

    if(dist(x,y,x2,y2) <= buffer){
      return true;
    }

  return false;
};

Boolean collidePointArc(float px, float py, float ax, float ay, float arcRadius, float arcHeading, float arcAngle, float buffer) {

  if (buffer == undefinedF) {
    buffer = 0;
  }
  // point
  PVector point = new PVector(px, py);
  // arc center point
  PVector arcPos = new PVector(ax, ay);
  // arc radius vector
  PVector radius = new PVector(arcRadius, 0).rotate(arcHeading);

  PVector pointToArc = point.copy().sub(arcPos);

  if (point.dist(arcPos) <= (arcRadius + buffer)) {
    float dot = radius.dot(pointToArc);
    float angle = radius.angleBetween(pointToArc,radius);
    if (dot > 0 && angle <= arcAngle / 2 && angle >= -arcAngle / 2) {
      return true;
    }
  }
  return false;
}//void mousePressed() {
 
//  if (mouseButton == LEFT){
//    if (Player != null) {
//      speedmult *= 2;
//    }
//  }else if (mouseButton == RIGHT) {
//    if (Player != null) {
//      speedmult *= 0.5;
//    }
//  }
//}

void keyPressed() {
  if (key == 'w') {
    wkey = true;
  }
  if (key == 's') {
    skey = true;
  }
  if (key == 'a') {
    akey = true;
  }
  if (key == 'd') {
    dkey = true;
  }
}void keyReleased() {
  if (key == 'w') {
    wkey = false;
  }
  if (key == 's') {
    skey = false;
  }
  if (key == 'a') {
    akey = false;
  }
  if (key == 'd') {
    dkey = false;
  }
}
class unit {
  color Team;
  PVector pos;
  PVector velocity = new PVector(0,0);
  float dmg = 5;
  float health = 100;
  float maxhealth = 100;
  boolean sup = false;
  float speed = (3+random(2))*speedmult;
  boolean plyr = false;
  float accuracy = 0.34*speedmult;
  unit Target;
  unit me;
  unit(float x, float y, color team, boolean superSoldier, boolean isPly) {
    //units.add(this);
    pos = new PVector(x,y);
    plyr = isPly;
    Team = team;
    sup = superSoldier;
    if(superSoldier) {
      accuracy = 0.67*speedmult;
      health = 400;
      maxhealth = health;
      dmg = 40;
      speed = 7*speedmult;
    }
    if (isPly) {
      health = 800;
      accuracy = 1*speedmult;
      maxhealth = health;
      dmg = 99;
      speed = 9*speedmult;
      
    }
    me = this;
  }
  
  void update() {
    if(health<=0) {units.remove(this);if(Player==me){reinfs--;}if(Team == color(255,0,0)){red--;}else if(Team == color(0,0,255)){blue--;}return;} // if the player is dead, respawn
    if(sup){
      if (Team == Player.Team) {
        textSize(8);
        fill(255);
        textAlign(CENTER);
        text("Health: "+round(health)+"/"+round(maxhealth),pos.x,pos.y-5);
      }
      if (health < maxhealth) {
        health+=0.5;
      }
    }
    //
    
    
    if (health < maxhealth && sup == false) {
      accuracy = -abs(accuracy);
      
    }else if(!sup && health >= maxhealth){accuracy = abs(accuracy);}
    if (health <= maxhealth/2 && sup) {
      accuracy = -abs(accuracy);
      
    }else if(sup && health > maxhealth/2){accuracy = abs(accuracy);}
    
    
    
    if (!sup && !plyr) {
      if (health < maxhealth) {
        health+=0.25;
      }
    }
    //
    if(Player == me) {
      textSize(8);
      fill(0,0,255);
      textAlign(CENTER);
      text(blue,pos.x+50,pos.y-10);
      fill(255,0,0);
      textAlign(CENTER);
      text(red,pos.x-50,pos.y-10);
      //fill(255);
      //textAlign(CENTER);
      //text(speedmult,pos.x+5,pos.y-20);
      
    }
    if (me != Player) {// am I not a player?
      Target = null;
      for (int i = 0; i < units.size(); i++){
        unit enemy = units.get(i);
        if (Target !=null) {
          if (Target.pos.dist(pos) > enemy.pos.dist(pos) && enemy.Team != Team) {
            Target = enemy;
          }
        }else{
          if (enemy.Team != Team) {
            Target = enemy;
          }
        }
        
        /// this part registers damage
        if (enemy.Team != Team) {
          if (collideRectRect(pos.x,pos.y,10,10,enemy.pos.x,enemy.pos.y,10,10)) {
            enemy.health -= dmg;
          }
        }
      }
      
      if (Target != null) {
      // Compute a vector that points from location to mouse
        
        PVector acceleration = PVector.sub(Target.pos,pos);
        // Set magnitude of acceleration
        acceleration.setMag(accuracy);
        
        // Velocity changes according to acceleration
        velocity.add(acceleration);
        // Limit the velocity by topspeed
        velocity.limit(speed);
        // Location changes by velocity
        pos.add(velocity);
      }
      fill(Team);
      //if (Target!=null) {
      //  stroke(Team);
      //  line(pos.x,pos.y,Target.pos.x,Target.pos.y);
      //  noStroke();
      //}
      if (sup) {stroke(255);
      rect(pos.x,pos.y,10,10);}else{ellipse(pos.x,pos.y,10,10);}
      noStroke();
    }else { // otherwise, if the unit IS the player, then do:
      for (int i = 0; i < units.size(); i++){
        unit enemy = units.get(i);
        /// this part registers damage
        if (enemy.Team != Team) {
          if (collideRectRect(pos.x,pos.y,10,10,enemy.pos.x,enemy.pos.y,10,10)) {
            enemy.health -= dmg;
          }
        }
      }
      
      // Getting the target so we can draw a line from the player to the closest target. Just so the player knows
      // where to go if they get lost.
      Target = null;
      for (int i = 0; i < units.size(); i++){
        unit enemy = units.get(i);
        if (Target !=null) {
          if (Target.pos.dist(pos) > enemy.pos.dist(pos) && enemy.Team != Team) {
            Target = enemy;
          }
        }else{
          if (enemy.Team != Team) {
            Target = enemy;
          }
        }
      }
      fill(Team);
      strokeWeight(1);
      stroke(0,180,0);
      if(Target!=null){
        line(pos.x+5,pos.y+5,Target.pos.x+5,Target.pos.y+5);
      }
      //if (Target!=null) {
      //  stroke(Team);
      //  line(pos.x,pos.y,Target.pos.x,Target.pos.y);
      //  noStroke();
      //}
      if(sup){
        rect(pos.x,pos.y,10,10);
      }else{
        ellipse(pos.x,pos.y,10,10);
      }
      noStroke();
    }
  }
}
