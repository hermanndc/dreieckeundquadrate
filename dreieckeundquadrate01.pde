float x1, y1, x2, y2, x3, y3;
float zufall = 400;

void setup(){
  size(400,400);
  noFill();
  strokeWeight(4);
  frameRate(100);
  background(255);
  strokeWeight(5);
  
}

void draw(){
  //dreieck
  x1 = random(zufall);
  y1 = random(zufall);
  x2 = random(zufall);
  y2 = random(zufall);
  x3 = x1 + (cos(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
  y3 = y1 + (sin(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
  triangle(x1,y1,x2,y2,x3,y3);
  //dreieck ende
  noLoop();
}

void mousePressed(){
  redraw();
}
