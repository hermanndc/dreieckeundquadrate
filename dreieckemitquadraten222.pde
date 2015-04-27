Tri my_triangle;


void setup() {
  size(600,600);
  noFill();
  strokeWeight(4);
  frameRate(100);
//  background(255);
  strokeWeight(5);
}

void draw() {
  my_triangle = new Tri();
 

  noFill();
  strokeWeight(4);
  frameRate(100);
  // background(255);
  strokeWeight(5);
  my_triangle.display();
 

  noLoop();
}

void mousePressed() {
  redraw();
}

class Tri {
  PVector p1;
  PVector p2;
  PVector p3;
  quadrat my_quadrat;
     

  Tri() {
    this.p1 = new PVector( random(width), random(height));
    this.p2 = new PVector( random(width), random(height));
    float x3 = this.p1.x + (cos(atan2(this.p2.y-this.p1.y, this.p2.x-this.p1.x)-PI/3) * dist(this.p1.x, this.p1.y, this.p2.x, this.p2.y));
    float y3 = this.p1.y + (sin(atan2(this.p2.y-this.p1.y, this.p2.x-this.p1.x)-PI/3) * dist(this.p1.x, this.p1.y, this.p2.x, this.p2.y));
    this.p3 = new PVector(x3, y3);
    
    my_quadrat = new quadrat(this.p1, this.p2, this.p3);
  }
  
  void display() {
    
    my_quadrat.display();
    beginShape();
    vertex(this.p1.x, this.p1.y);
    vertex(this.p2.x, this.p2.y);
    vertex(this.p3.x, this.p3.y);
    endShape(CLOSE);
  }
}

class quadrat {

  PVector p1;
  PVector p2;
  PVector p3;

  PVector p4;
  PVector p5;
  
  PVector p6;
  PVector p7;
  
  PVector p8;
  PVector p9;


  quadrat(PVector _p1, PVector _p2, PVector _p3) {
    this.p1 = _p1;
    this.p2 = _p2;
    this.p3 = _p3;
    
    p4 = new PVector( (_p1.x-(_p2.y- _p1.y)), (_p1.y+(_p2.x-_p1.x)) );
    p5 = new PVector( (_p2.x-(_p2.y-_p1.y)), (_p2.y+(_p2.x-_p1.x)) );
    
    p6 = new PVector( (_p2.x-(_p3.y- _p2.y)), (_p2.y+(_p3.x-_p2.x)) );
    p7 = new PVector( (_p3.x-(_p3.y-_p2.y)), (_p3.y+(_p3.x-_p2.x)) );
    
    p8 = new PVector( (_p3.x-(_p1.y- _p3.y)), (_p3.y+(_p1.x-_p3.x)) );
    p9 = new PVector( (_p1.x-(_p1.y-_p3.y)), (_p1.y+(_p1.x-_p3.x)) );

  }


  void display() {
    
    beginShape();
    vertex(p1.x, p1.y);
    vertex(p4.x, p4.y);
    vertex(p5.x, p5.y);
    vertex(p5.x, p5.y);
    vertex(p2.x, p2.y);    
    endShape(CLOSE);
    
    beginShape();
    vertex(p2.x, p2.y);
    vertex(p6.x, p6.y);
    vertex(p7.x, p7.y);
    vertex(p7.x, p7.y);
    vertex(p3.x, p3.y);    
    endShape(CLOSE);

   beginShape();
   vertex(p3.x, p3.y);
   vertex(p8.x, p8.y);
   vertex(p9.x, p9.y);
   vertex(p9.x, p9.y);
   vertex(p1.x, p1.y);    
   endShape(CLOSE);
    
   
  }
}
