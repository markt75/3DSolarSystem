class Star{
  
  float x, y, z;
  float radius;
  
  int initDist = 250;
  
  Star(){
    x = random(-initDist*11, initDist*11);
    y = random(-initDist*11, initDist*11);
    z = random(-initDist*11, initDist*11);
    radius = random(5, 8);
  }
  
  void display(){
    push();
    noStroke();
    fill(255);
    translate(x, y, z);
    sphere(radius);
    pop();
  }
  
  
  
  
  
}
