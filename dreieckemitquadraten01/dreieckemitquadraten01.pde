//float x1, y1, x2, y2, x3, y3;
//float zufall = 400;


Tri my_triangle;
Quadrat my_quadrat;
void setup() {
  size(400, 400);
  PVector p1 = new PVector( random(width), random(height));
  PVector p2 = new PVector( random(width), random(height));

  my_triangle = new Tri(p1, p2);
  // now create a new Quadrat
  my_quadrat = new Quadrat(PVector _v1, PVector _v2, PVector _p1, PVector _p2, float _w1, float _w2);

  //PVector p3 = new PVector( random(width), random(height));
  //PVector p4 = new PVector( random(width), random(height));
  //my_triangle2 = new Tri(p3, p4);


  //println(my_triangle.p3.x);

  noFill();
  strokeWeight(4);
  frameRate(100);
  background(255);
  strokeWeight(5);
}

void draw() {
  my_triangle.display();
  // my_triangle2.display();
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

class Quadrat {
  PVector p4;
  float v1;
  float v2;
  PVector p5;
  float w1;
  float w2;
  PVector p1;
  PVector p2;


  Quadrat(PVector _v1, PVector _v2, PVector _p1, PVector _p2, float _w1, float _w2) {
    // this is not possible
    // you cant store two Pvector into one
    //  this.p4 =  _v1 ,_v2; <---ERROR
    this.v1 = _p1.x-(_p2.y- _p1.y);
    this.v2 = _p1.y+(_p2.x-_p1.x);
    //  this.p5 = _w1, _w2; <--ERROR see above
    this.w1 = _p2.x-(_p2.y-_p1.y);
    this.w2 = _p2.y+(_p2.x-_p1.x);
  }


  void display() {
    beginShape();
    vertex(p1.x, p1.y );
    vertex(p2.x, p2.y);
    vertex(p4.x, p4.y);
    vertex(p5.x, p5.y);
    endShape(CLOSE);
  }
}

