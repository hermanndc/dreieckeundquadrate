// init the objects globally
Tri my_triangle;
Tri next_triangle;
// like an array but more dynamic
ArrayList<Quadrat> quadrate;
PFont font; // just for some overlays


void setup() {
  // will be prsent on most systems
  font = createFont("Arial", 12);
  textFont(font);
  textAlign(CENTER, CENTER);
  size(600, 600);
  // init the arraylist
  quadrate = new ArrayList<Quadrat>();
  // init one triangle and 3 quads
  // could be packed into a new class
  my_triangle = new Tri(new PVector(width/3, height - height/3), new PVector(width - width/3, height - height/3));
  quadrate.add(new Quadrat(my_triangle.p1, my_triangle.p2));
  quadrate.add(new Quadrat(my_triangle.p2, my_triangle.p3));
  quadrate.add(new Quadrat(my_triangle.p3, my_triangle.p1));
  //  now you could get the points for drawing another triangle
  next_triangle = new Tri(quadrate.get(2).p5,quadrate.get(2).p4);
}

void draw() {
  noStroke();
  fill(255);
  rect(0, 0, width, height);
  my_triangle.display();
  for (int i = 0; i < quadrate.size (); i++) {
    quadrate.get(i).display();
  }
  next_triangle.display();
}

void mousePressed() {
}

class Tri {
  PVector p1;
  PVector p2;
  PVector p3;
  Tri(PVector _p1, PVector _p2 ) {
    this.p1 = _p1;// new PVector( random(width), random(height));
    this.p2 = _p2;// new PVector( random(width), random(height));
    float x3 = this.p1.x + (cos(atan2(this.p2.y-this.p1.y, this.p2.x-this.p1.x)-PI/3) * dist(this.p1.x, this.p1.y, this.p2.x, this.p2.y));
    float y3 = this.p1.y + (sin(atan2(this.p2.y-this.p1.y, this.p2.x-this.p1.x)-PI/3) * dist(this.p1.x, this.p1.y, this.p2.x, this.p2.y));
    this.p3 = new PVector(x3, y3);
  }

  void display() {
    noFill();
    stroke(0);
    strokeWeight(5);
    strokeJoin(ROUND);
    beginShape();
    vertex(this.p1.x, this.p1.y);
    vertex(this.p2.x, this.p2.y);
    vertex(this.p3.x, this.p3.y);
    endShape(CLOSE);
  }
}
// class names should always we capitalized
class Quadrat {

  PVector p1;
  PVector p2;
  PVector p3;

  PVector p4;
  PVector p5;

  Quadrat(PVector _p1, PVector _p2) {
    this.p1 = _p1;
    this.p2 = _p2;
    p4 = new PVector( (_p1.x-(_p2.y- _p1.y)), (_p1.y+(_p2.x-_p1.x)) );
    p5 = new PVector( (_p2.x-(_p2.y-_p1.y)), (_p2.y+(_p2.x-_p1.x)) );
  }

  private void show_point(PVector p, String name) {
    // just to see where the points are
    fill(0);
    text(name, p.x + 35, p.y);
    strokeWeight(2);
    noFill();
    ellipse(p.x, p.y, 30, 30);
  }

  void display() {
    noFill();
    stroke(0);
    strokeWeight(5);
    strokeJoin(ROUND);
    beginShape();
    vertex(p1.x, p1.y);
    vertex(p4.x, p4.y);
    vertex(p5.x, p5.y);
    vertex(p5.x, p5.y);
    vertex(p2.x, p2.y);    
    endShape(CLOSE);
    this.show_point(p5, "p5");
  }
}

