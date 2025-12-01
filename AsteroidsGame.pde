Spaceship bob; 
ArrayList <Spaceship> vlives = new ArrayList <Spaceship>();
ArrayList <Asteroids> asteroids = new ArrayList <Asteroids>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
Star[] stars = new Star[100];
Particles[] p = new Particles[10];
boolean forward;
boolean turnLeft;
boolean turnRight;
boolean hyperspace;
boolean shooting;
boolean dying;
boolean invul;
int ls;
int lmillis;
int score;
int lives=3;
int llives=3;
int lastShot = 0;
int shotCooldown = 150;
int dStart;
int dLength=1000;
int iStart;
int iDuration=2000;
PFont font;

public void setup() 
{
  size(500,500);
  font = createFont("ARCADECLASSIC.TTF", 128);
  textFont(font);
  for(int i=0; i<stars.length; i++){
    stars[i]=new Star();
  }
  for(int i=0; i<12; i++){
    asteroids.add(new Asteroids());
  }
  for(int i=0; i<lives; i++){
    vlives.add(new Spaceship());
  }
  for(int i=0; i<10; i++){
    p[i]=new Particles(-10,-10);
  }
  bob = new Spaceship();
  invul=true;
  iStart =millis();

}
public void draw() 
{
  fill(0);
  rect(-200,-200,2000,2000);
  noFill();
  if(second()!=ls ){
    asteroids.add(new Asteroids());
    ls=second();
  }
  if (forward) bob.accelerate(.02);
  if (turnLeft) bob.turn(-3);
  if (turnRight) bob.turn(3);
  if (shooting && lives>0 && !dying) {
    if (millis() - lastShot >= shotCooldown) {
      bullets.add(new Bullet(bob));
      lastShot = millis();
    }
  }
  if (hyperspace){
    bob.setXspeed(0);
    bob.setYspeed(0);
    bob.setX((int)(Math.random()*width));
    bob.setY((int)(Math.random()*height));
    bob.setPointDirection((int)(Math.random()*360));
    hyperspace=false;
  }
  for(int i=0; i<stars.length; i++){
    stars[i].show();
  }
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroids roid = asteroids.get(i);
    roid.show();
    roid.move();
    if (!dying && !invul && dist(roid.getX(), roid.getY(), bob.getX(), bob.getY()) < 20 * roid.getMySize()) {
      if(roid.getMySize()>.5){
        asteroids.add(new Asteroids(roid.getX(),roid.getY(),roid.getMySize()/2));
        asteroids.add(new Asteroids(roid.getX(),roid.getY(),roid.getMySize()/2));
      }
      asteroids.remove(i);
      lives--;
      for(int j=0; j<10; j++){
        p[j].setX(bob.getX());
        p[j].setY(bob.getY());
        p[j].setAngle(Math.random()*PI*2);
        p[j].setOpac(255);
      }
      dying=true;
      dStart=millis();
      shooting=false;
    }
  }
  if (lives>0){
    if(dying){
      int t = millis() - dStart;
      shooting = false;
      if (millis() - lmillis >= 1) {
        lmillis = millis();
        for (int i = 0; i < p.length; i++) {
          p[i].move();
          p[i].show();
        }
      }
      if (t >= dLength) {
        bob.setX(width/2);
        bob.setY(height/2);
        bob.setXspeed(0);
        bob.setYspeed(0);
        bob.setPointDirection(0);
        dying = false;
        invul = true;
        iStart = millis();
      }
    }
    else{
      bob.move();
      if(invul){
        int blink = (int)((millis() - iStart) / 150) % 2;
        if (blink==0){
          bob.show();
          bob.thruster();
        }
        if (millis()-iStart>=iDuration){
          invul = false;
        }
      }
      else{
        bob.show();
        bob.thruster();
      }
    }
  }
  else{
    shooting=false;
  }
  for(int i=bullets.size()-1; i>=0;i--){
    bullets.get(i).move();
    Bullet bull = bullets.get(i);
    bullets.get(i).show();
    for (int j = asteroids.size() - 1; j >= 0; j--) {
      Asteroids roid = asteroids.get(j);
      if (dist(roid.getX(), roid.getY(),bull.getX(), bull.getY()) < 20 * roid.getMySize()) {
        if(roid.getMySize()>.5){
          asteroids.add(new Asteroids(roid.getX(),roid.getY(),roid.getMySize()/2));
          asteroids.add(new Asteroids(roid.getX(),roid.getY(),roid.getMySize()/2));
          score+=20;
        }
        else if(roid.getMySize()>.25){
          score+=50;
        }
        else if(roid.getMySize()>.1){
          score+=100;
        }
        asteroids.remove(j);
        bullets.remove(i);
        break;
      }
    }
  }
  textSize(32);
  fill(255);
  text(score, 10, 55); 
  for (int i = 0; i < lives; i++) {
    vlives.get(i).setPointDirection(270);
    vlives.get(i).setX(25+30*i);
    vlives.get(i).setY(80);
    vlives.get(i).show();
  }
}
public void keyPressed(){
  if (key == 'w'){
    forward=true;
    bob.setThrusting(true);
  }
  if (key == 'a'){
    turnLeft=true;
  }
  if (key == 'd'){
    turnRight=true;
  }
  if (key == ' ' && lives>0){
    shooting=true;
  }
}
public void keyTyped(){
  if (key == 'h'){
    hyperspace=true;
  }
}

public void keyReleased(){
  if (key == 'w'){
    forward=false;
    bob.setThrusting(false);
  }
  if (key == 'a'){
    turnLeft=false;
  }
  if (key == 'd'){
    turnRight=false;
  }
  if (key == ' '){
    shooting=false;
  }
}
