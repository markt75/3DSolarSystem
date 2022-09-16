class Planet3D{
 
  String name;
  float radius;
  float distance;
  float orbitspeed;
  String skinStr;
  int moons;
  
  float rotate = 0;
  float moonrot = 0;
  
  PImage wrap, moonWrap = loadImage("moon2.jpg");
  PShape globe, moon;
  
  ArrayList<PVector> moonVectors;
  
  Planet3D(String name, float radius, float distance, String skinStr, float orbitspeed, int moons){
    this.name = name;
    this.radius = radius;
    this.distance = distance;
    this.skinStr = skinStr;
    this.orbitspeed = orbitspeed;
    this.moons = moons;
    
    moonVectors = new ArrayList<PVector>();
    
    noStroke();
    
    createMoons();
    
    wrap = loadImage(skinStr);
    globe = createShape(SPHERE, radius);
    globe.setTexture(wrap);
  }
  
  String getName(){return name;}
  int getMoons(){return moons;}
  
  void orbit(){
    rotate += this.orbitspeed;
  }
  
  void display(){
    push();
    
    rotateY(radians(rotate)); 
    translate(distance, 0, 0);
    rotateY(radians(rotate)); 
    noStroke();
    noFill();
    shape(globe);
    
    pop();
  }
  
  void orbitDisplay(){
    push();
    noFill();
    stroke(150);
    rotateX(PI/2);
    ellipse(0, 0, distance*2, distance*2);
    pop();
  }
  
  void moonorbit(){
    moonrot+=0.3;
  }
  
  void createMoons(){
    for (int i = 0; i < this.getMoons(); i++){
      PVector v = PVector.random3D();  // creates random vectors for each frame
      v.mult(this.radius*2);
      
      moon = createShape(SPHERE, random(radius/6, radius/4));
      moon.setTexture(moonWrap);
      
      moonVectors.add(v);
    }
  }
  
  void displayMoons(){
    for (int i = 0; i < this.moonVectors.size(); i++){
      push();
      moonorbit();
      rotateY(radians(rotate));  // rotates allong with planet
      translate(this.distance, 0, 0);
      rotateY(radians(moonrot)); // rotates around planet

      var x = moonVectors.get(i).x;
      var y = moonVectors.get(i).y;
      var z = moonVectors.get(i).z;
      
      translate(x, y, z);
      
      rotateY(radians(moonrot));
      noFill();
      noStroke();
      shape(moon);
      
      pop();
    }
    
  }
  
}
