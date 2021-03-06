float x1, y1, x2, y2, x3, y3,x4,y4,y5,x5,x6, y6, x7, y7, x8, y8,x9,y9,y10,x10,d;
float zufall = 400;

void setup(){
  size(1000,500);
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
  d=dist(x1,y1,x2,y2);
  x3 = x1 + (cos(atan2(y2-y1,x2-x1)-PI/3) * d);
  y3 = y1 + (sin(atan2(y2-y1,x2-x1)-PI/3) * d);
  x4=x1-(y2-y1);
  y4=y1+(x2-x1);
  x5=x2-(y2-y1);
  y5=y2+(x2-x1);
  triangle(x1,y1,x2,y2,x3,y3);
  quad(x1, y1, x2,y2, x5,y5, x4,y4);
  x6=x1-(y1-y3);
  y6=y1+(x1-x3);
  x7=x3-(y1-y3);
  y7=y3+(x1-x3);
  line(x1,y1,x6,y6);
  line(x3,y3,x7,y7);
  quad(x1, y1, x3,y3, x7,y7, x6,y6);
  
  x8=x2-(y3-y2);
  y8=y2+(x3-x2);
  x9=x3-(y3-y2);
  y9=y3+(x3-x2);
  line(x1,y1,x6,y6);
  line(x3,y3,x7,y7);
  quad(x2, y2, x3,y3, x9,y9, x8,y8);
  //dreieck ende
  noLoop();
}



void mousePressed(){
  redraw();
}
