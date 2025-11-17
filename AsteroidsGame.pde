Spaceship bob;
ArrayList <Asteroids> asteroids = new ArrayList <Asteroids>();
Star[] stars = new Star[100];
boolean forward;
boolean turnLeft;
boolean turnRight;
boolean hyper;

public void setup() 
{
  size(500,500);
  for(int i=0; i<stars.length; i++){
    stars[i]=new Star();
  }
  for(int i=0; i<20; i++){
    asteroids.add(new Asteroids());
  }
  bob = new Spaceship();
}
public void draw() 
{
  fill(0);
  rect(-200,-200,2000,2000);
  noFill();
  if (forward) bob.accelerate(.05);
  if (turnLeft) bob.turn(-3);
  if (turnRight) bob.turn(3);
  if (hyper){
    bob.setXspeed(0);
    bob.setYspeed(0);
    bob.setX((int)(Math.random()*width));
    bob.setY((int)(Math.random()*height));
    bob.setPointDirection((int)(Math.random()*360));
    hyper=false;
  }
  for(int i=0; i<stars.length; i++){
    stars[i].show();
  }
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroids roid = asteroids.get(i);
    roid.show();
    roid.move();
  }
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroids roid = asteroids.get(i);
    if (dist(roid.getX(), roid.getY(), bob.getX(), bob.getY()) < 20 * roid.getMySize()) {
      if(roid.getMySize()>.5){
        asteroids.add(new Asteroids(roid.getX(),roid.getY(),roid.getMySize()/2));
        asteroids.add(new Asteroids(roid.getX(),roid.getY(),roid.getMySize()/2));
      }
      asteroids.remove(i);
      break;
    }
  }
  bob.move();
  bob.show();
}
public void keyPressed(){
  if (key == 'w'){
    forward=true;
  }
  if (key == 'a'){
    turnLeft=true;
  }
  if (key == 'd'){
    turnRight=true;
  }
}
public void keyTyped(){
  if (key == 'h'){
    hyper=true;
  }
}

public void keyReleased(){
  if (key == 'w'){
    forward=false;
  }
  if (key == 'a'){
    turnLeft=false;
  }
  if (key == 'd'){
    turnRight=false;
  }
}
