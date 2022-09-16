import peasy.*;

PeasyCam cam;

ArrayList<Planet3D> planets;

ArrayList<Star> stars;

int initialDistance = 250;

void setup(){
  size(1000, 1000, P3D);  
  cam = new PeasyCam(this, 3000);
  
  planets = new ArrayList<Planet3D>();
  
  planets.add(new Planet3D("Sun", 150, 0, "sun.jpg", 0, 0));
  planets.add(new Planet3D("Mercury", 20, initialDistance, "mercury.jpg", 1, 0));
  planets.add(new Planet3D("Venus", 45, initialDistance*2, "venus.jpg", 0.9, 0));
  planets.add(new Planet3D("Earth", 50, initialDistance*3, "earth.jpg", 0.5, 1));
  planets.add(new Planet3D("Mars", 25, initialDistance*4, "mars.jpg", 0.3, 2));
  planets.add(new Planet3D("Jupiter", 100, initialDistance*5, "jupiter.jpg", 0.2, 5));
  planets.add(new Planet3D("Saturn", 90, initialDistance*6.5, "saturn.jpg", 0.1, 6));
  planets.add(new Planet3D("Uranus", 70, initialDistance*8, "uranus.jpg", 0.08, 4));
  planets.add(new Planet3D("Neptune", 70, initialDistance*10, "neptune.jpg", 0.06, 3));
  
  stars = new ArrayList<Star>();
  
  for (int i = 0; i < 150; i++){
    stars.add(new Star());
  }

}

void draw(){
  background(0);
  lights();
  
  for (Star star : stars){
    star.display();
  }
   
   
  // Sun
  planets.get(0).display();
  planets.get(0).orbit();
  
  for (int i = 1; i < planets.size(); i++){
    Planet3D temp = planets.get(i);
    temp.display();
    temp.orbitDisplay();
    temp.orbit();
    temp.displayMoons();
  }
  
  
}
