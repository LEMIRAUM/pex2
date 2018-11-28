int score = 0;
int additional_score = 0;
boolean gamestart = false;
boolean gameover = false;

class Platform
{
  float angle = 0;
  float max_angle = PI/4;
  boolean x_l = false;
  boolean x_r = false;
  
  void move(int x)
  {
    fill(255, 174, 201, 50);  rect(300, 600, 800, 5);  
    pushMatrix();    translate(x, 600);    rotate(angle);    rectMode(CENTER);    fill(153, 217, 234);    noStroke();    rect(0, 0, 100, 5);    fill(63, 72, 204);    rect(0, 0, 30, 5);    rotate(-angle);    fill(255);    popMatrix();
  }
  void al(){  if(angle > -max_angle)  angle -= 0.02;  }
  void ar(){  if(angle < max_angle)  angle += 0.02;  }
  boolean impulse()
  {
    if(ball.x >= mouseX-50*cos(angle) && ball.x <= mouseX+50*cos(angle))
    {
       if(ball.y+10*cos(angle) >= ((ball.x-10*sin(angle)) - (mouseX - 50*cos(angle)))*tan(angle) + (600 - 5 - 50*sin(angle)) && ball.y+10*cos(angle) < ((ball.x-10*sin(angle)) - (mouseX - 50*cos(angle)))*tan(angle) + (600 - 5 - 50*sin(angle)) + 40)
       {
         if(ball.x >= mouseX-15*cos(angle) && ball.x <= mouseX+15*cos(angle))  ball.vy *= 1.4;
         return true;
       }
    }
    return false;
  }
}

class Ball
{
  int R = 0;  int G = 0;  int B = 0;
  float x = width/2;  float y = height/4;
  float v = 0;  float vx = 0;  float vy = 0;
  float x_drag = 0.01;  float g = 0.15;  float e = 0.8;
  boolean ceiling_impulse = false;
  
  void move()
  { 
    fill(R, G, B);    x += vx;    y += vy;    ellipse(x, y, 20, 20);    fill(255);    vy += g;
    if(vx < 0)  vx += x_drag;
    if(vx > 0)  vx -= x_drag;
  }
  void platform_impulse()
  {
    v = sqrt(vx*vx + vy*vy);
    v *= e;
    vx += v*sin(platform.angle);
    vy = -1*v*cos(platform.angle);
    additional_score = 0;
  }
  void wall_impulse()
  {
    if(x-10 <= 0 || x+10 >= width){  vx *= -1;  additional_score += 1;  }
    if(y-10 <= 0 && !ceiling_impulse){  vy *= -1*e;  ceiling_impulse = true;  }
    else if(y-10 > 0)  ceiling_impulse = false;
  }
}

class Goalpost
{
  float x = 250;
  float y = height/4-20;
  boolean goalpost_impulse = false;
  
  void dr()
  {
    rectMode(CENTER);    fill(128);    rect(x, y, 40, 5);    fill(255);
  }
  void impulse()
  {
    if((y-10 <= ball.y && y+10 >= ball.y) && !goalpost_impulse)
      if(x+20 >= ball.x && x-20 <= ball.x)
      {
        score += (1+additional_score);
        goalpost_impulse = true;
        x = (int)random(width-100) + 50;   y = (int)random(height/2 - 100) + 50;
        ball.R = (int)random(250);  ball.G = (int)random(250);  ball.B = (int)random(250);
      }
    if(y-10 > ball.y || y+10 < ball.y)  goalpost_impulse = false;
  }
}

void keyPressed()
{
  if(keyCode == 65){
    platform.x_l = true;
  }
  if(keyCode == 68){
    platform.x_r = true;
  }
  if(keyCode == 32){
    gamestart = true;
  }
}

void keyReleased()
{
  if(keyCode == 65){
    platform.x_l = false;
  }
  if(keyCode == 68){
    platform.x_r = false;
  }
}

Platform platform;
Ball ball;
Goalpost goalpost;
PImage img;

void setup(){
  size(500, 700);
  platform = new Platform();
  ball = new Ball();
  goalpost = new Goalpost();
  img = loadImage("background.jpg");  //https://vertufineart.com/artists/damien-hirst/
  image(img, 0, 0, 500, 700);
  fill(0);  textSize(40);  text("Color Ball", 150, 180);  textSize(20);  text("Press SpaceBar", 180, 470);
}

void draw(){
  if(gamestart)
  {
    background(255);
    textSize(30);  fill(0);  text(score, width/2-10, 70);  fill(255);
    goalpost.dr();
    platform.move(mouseX); 
    ball.move();
    if(ball.y > height)  gameover = true;
    goalpost.impulse();
    ball.wall_impulse();
    if(platform.impulse())  ball.platform_impulse();
    if(platform.x_l)  platform.al();
    if(platform.x_r)  platform.ar();
  }
  if(gameover)
  {
    image(img, 0, 0, 500, 700);
    fill(0);
    textSize(40);  text("Game Over", 140, 180);  textSize(20); text("Score : ", 120, 540);  text(score, 200, 540);
  }
}
