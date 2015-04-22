//float x1, y1, x2, y2, x3, y3;
//float zufall = 400;

Tri my_triangle;
Tri my_triangle2;

void setup() {
  size(400, 400);
  PVector p1 = new PVector( random(width), random(height));
  PVector p2 = new PVector( random(width), random(height));
  
  my_triangle = new Tri(p1, p2);
  
    PVector p3 = new PVector( random(width), random(height));
  PVector p4 = new PVector( random(width), random(height));
  my_triangle2 = new Tri(p3, p4);
  
  
  println(my_triangle.p3.x);
  
  noFill();
  strokeWeight(4);
  frameRate(100);
  background(255);
  strokeWeight(5);
  
}

void draw() {
  my_triangle.display();
  my_triangle2.display();
  //dreieck
//  x1 = random(zufall);
//  y1 = random(zufall);
//  x2 = random(zufall);
//  y2 = random(zufall);
//  x3 = x1 + (cos(atan2(y2-y1, x2-x1)-PI/3) * dist(x1, y1, x2, y2));
//  y3 = y1 + (sin(atan2(y2-y1, x2-x1)-PI/3) * dist(x1, y1, x2, y2));
//  triangle(x1, y1, x2, y2, x3, y3);
  //dreieck ende
 noLoop();
}

void mousePressed() {
  redraw();
}

class Tri {
  PVector p1;
  PVector p2;
  PVector p3;
  
  Tri(PVector _p1, PVector _p2) {
    
    this.p1 = _p1;
    this.p2 = _p2;
    float x3 = this.p1.x + (cos(atan2(this.p2.y-this.p1.y, this.p2.x-this.p1.x)-PI/3) * dist(this.p1.x, this.p1.y, this.p2.x, this.p2.y));
    float y3 = this.p1.y + (sin(atan2(this.p2.y-this.p1.y, this.p2.x-this.p1.x)-PI/3) * dist(this.p1.x, this.p1.y, this.p2.x, this.p2.y));
    this.p3 = new PVector(x3, y3);
    
  }
  void display() {
    beginShape();
    vertex(this.p1.x, this.p1.y);
    vertex(this.p2.x, this.p2.y);
    vertex(this.p3.x, this.p3.y);
    endShape(CLOSE);
  }
}
//
//class Quadrat {
//  Quadrat() {
//  }
//  void display() {
//  }
//}

