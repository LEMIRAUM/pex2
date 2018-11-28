import ddf.minim.*;

float x_p = 0, x_p2 = 0, m_p = 0, fm_p = 0;  int frame = 0, scene = 0, v_count = 0;  boolean key_check = false;

class Main_male{
  boolean i_max = false;
  int i = 0;
  float j = -0.2, x_m = 0.5, y_m = 0;
  void dr_move(){
    fill(254, 241, 226);    ellipse(427+m_p, 180+y_m, 80, 80);    rect(427+m_p, 225+y_m, 20, 15);  //face
    hair(y_m);
    fill(0);    arc(447+m_p, 180+y_m, 40, 57, -1*PI/16, PI/16);    fill(255);    triangle(447+m_p, 180+y_m, 462+m_p, 185+y_m, 462+m_p, 175+y_m);  //eye
    fill(255);    ellipse(427+m_p, 265+y_m, 80, 80);    rect(427+m_p, 325+y_m, 80, 120);    fill(254, 241, 226);    ellipse(421+x_m*i+m_p, 357+y_m, 25, 25);
    fill(250);    quad(417+m_p, 240+y_m, 437+m_p, 240+y_m, 431+x_m*i+m_p, 350+y_m, 411+x_m*i+m_p, 350+y_m);  //upper body
    fill(0, 142, 202);    quad(397+m_p, 385+y_m, 457+m_p, 385+y_m, 451+x_m*i+m_p, 483+y_m, 391+x_m*i+m_p, 483+y_m);    fill(0, 162, 232);    quad(397+m_p, 385+y_m, 457+m_p, 385+y_m, 463-x_m*i+m_p, 483+y_m, 403-x_m*i+m_p, 483+y_m);  //leg
    if(i == 0 && i_max){  j *= -1;  i_max = false;  }
    else if(i == 12)      j *= -1;
    else if(i == 24){     j *= -1;  i_max = true;  }
    if(i_max)      i--;    else      i++;
    y_m += j;
  }
  void hair(float y_m){
    stroke(0);    strokeWeight(5);
    noFill();
    for(int count = 8; count >= 0; count--)
      arc(427+m_p, 180+y_m, 10*count, 80, PI+0.3, (float)3/2*PI);
    for(int count = 0; count <= 8; count++)
      arc(427+m_p, 180+y_m, 10*count, 80, (float)3/2*PI, 2*PI-0.3);   
    noStroke();
  }
}

class Main_female{
  boolean i_max = false;
  int i = 0;
  float j = -0.2, x_m = 0.5, y_m = 0;
  void dr_move(){
    fill(254, 241, 226);    ellipse(427+fm_p, 180+y_m, 80, 80);    rect(427+fm_p, 225+y_m, 20, 15);  //face
    fill(0);    arc(407+fm_p, 180+y_m, 40, 57, PI*15/16, PI*17/16);    fill(255);    triangle(407+fm_p, 180+y_m, 392+fm_p, 185+y_m, 392+fm_p, 175+y_m);  //eye
    fill(255, 174, 201);    ellipse(427+fm_p, 265+y_m, 80, 80);    rect(427+fm_p, 325+y_m, 80, 120);    fill(254, 241, 226);    ellipse(421+x_m*i+fm_p, 357+y_m, 25, 25);
    fill(255, 153, 186);    quad(417+fm_p, 240+y_m, 437+fm_p, 240+y_m, 431+x_m*i+fm_p, 350+y_m, 411+x_m*i+fm_p, 350+y_m);  //upper body
    hair(y_m);
    fill(0, 142, 202);    quad(397+fm_p, 385+y_m, 457+fm_p, 385+y_m, 451+x_m*i+fm_p, 483+y_m, 391+x_m*i+fm_p, 483+y_m);    fill(0, 162, 232);    quad(397+fm_p, 385+y_m, 457+fm_p, 385+y_m, 463-x_m*i+fm_p, 483+y_m, 403-x_m*i+fm_p, 483+y_m);  //leg
    if(i == 0 && i_max){  j *= -1;  i_max = false;  }
    else if(i == 12)      j *= -1;
    else if(i == 24){     j *= -1;  i_max = true;  }
    if(i_max)      i--;    else      i++;
    y_m += j;
  }
  void hair(float y_m){
    stroke(0);    strokeWeight(5);
    noFill();
    for(int count = 8; count >= 0; count--)
      arc(427+fm_p, 180+y_m, 10*count, 80, PI+0.3, (float)3/2*PI);
    for(int count = 0; count <= 8; count++){
      arc(427+fm_p, 180+y_m, 10*count, 80, (float)3/2*PI, 2*PI-0.3);
      line(427+5*count-2+fm_p, 170+y_m, 427+5*count-2+fm_p, 240+y_m);
    }
    noStroke();
  }
}

class Particle{
  float R, G, B, V;  float x, y;  float vx, vy;  float W, H;
  
  Particle(float mx, float my)  {    x = mx;  y = my;
    switch(scene){
       case 1:
         R = 255;  G = 242;  B = 0;  V = 255;  vx = random(5)/10 - 2;  vy = random(1, 10)/10;  W = 25;  H = 25;  break;
       case 2:
         R = 34;  G = 177;  B = 76;  V = 255;  vx = random(5, 10)/10;  vy = random(10, 20)/10; W = 10;  H = 20;  break;
       case 3:
         R = 255;  G = 255;  B = 255;  V = random(55, 255);  vx = 0.1*-1;  vy = 0;  W = random(10, 20);  H = W;  break;
       case 4:
         R = 255;  G = 255;  B = 255;  V = random(55, 255);  vx = 0.1;  vy = 0;  W = random(10, 20);  H = W;  break;
       case 5:
         R = random(100, 255);  G = random(100, 255);  B = random(100, 255); V = random(55, 255);  vx = 0;  vy = 0;  W = random(10, 20);  H = W;  break;
    }
  }  
  void dr_move()  {
     fill(R, G, B, V);  ellipse(x, y, W, H);  x += vx;  y += vy;
  }
}

void scene1()
{
  int i;
  fill(255);  ellipse(100-x_p, 100, 80, 40);  ellipse(500-x_p, 130, 80, 40);  ellipse(700-x_p, 70, 80, 40);  //cloud
  fill(181, 230, 29);  rect(427-x_p, 380, 1200, 200);  //ground
  fill(239, 228, 176);  rect(700-x_p, 240, 180, 80);  fill(192, 201, 35);  arc(700-x_p, 200, 80, 80, PI, 2*PI);  fill(230, 211, 128);  triangle(700-x_p, 220, 670-x_p, 240, 730-x_p, 240);  rect(675-x_p, 260, 10, 40);  rect(725-x_p, 260, 10, 40);  //main hall
  for(i = 1; i < 20; i++)  {
    fill(34, 177, 76);  rect(70*i-x_p, 460, 10, 40);  rect(70*i-x_p, 460, 30, 10);  fill(255, 242, 0);  ellipse(70*i-x_p, 420, 40, 40);  fill(255, 201, 14);  ellipse(70*i-x_p, 420, 20, 20);  //flower
  }
}

void scene2()
{
  int i;
  fill(239, 228, 176);  rect(427+x_p2, 320, 1200, 320);  fill(181, 230, 29);  rect(427+x_p2, 120, 1200, 80);  //bush and wall
  for(i = 0; i < 5; i++)  {
    fill(126, 79, 52);  rect(200*i + x_p2, 240, 80, 480);  //tree
  }
  fill(0);  rect(500+x_p2, 450, 20, 60);  rect(700+x_p2, 450, 20, 60);  fill(223, 201, 68);  rect(600+x_p2, 410, 220, 20);  //bench
}

void scene3()
{
  fill(255);  ellipse(100-x_p, 100, 80, 40);  ellipse(400-x_p, 350, 80, 40);  ellipse(700-x_p, 270, 80, 40);  //cloud
  fill(100, 134, 204);  rect(650-x_p, 450, 200, 60);  rect(700-x_p, 400, 50, 40);  //global plaza
  fill(255);  textSize(15);  text("GLOBAL PLAZA", 555-x_p, 440);
}

void scene4()
{
  fill(255);  ellipse(50+x_p2, 100, 60, 30);  ellipse(150+x_p2, 80, 60, 30);  ellipse(700+x_p2, 50, 60, 30);  //cloud
  fill(140, 236, 217);  arc(400+x_p2, 550, 800, 400, PI, 2*PI);  //far mountain
  fill(34, 177, 76);  arc(100+x_p2, 550, 800, 450, PI, 2*PI);  arc(700+x_p2, 550, 700, 350, PI, 2*PI);  //close mountain  
}

void scene5()
{
  fill(140, 236, 217);  arc(500, 480, 800, 400, PI, 2*PI);  fill(34, 177, 76);  arc(300, 480, 800, 450, PI, 2*PI);  arc(800, 480, 700, 350, PI, 2*PI);  //mountain
  fill(181, 230, 29);  rect(427, 480, 854, 200);  //ground
  fill(100, 134, 204);  rect(150, 240, 150, 280);  //gloabl palza
  fill(255);  rect(200, 330, 200, 100);    fill(128, 255, 255);  rect(200, 320, 180, 40);  //library
  fill(127);  rect(700, 300, 50, 160);  fill(255);  rect(800, 310, 150, 140);  //it center
  fill(239, 228, 176);  rect(500, 340, 180, 80);  fill(192, 201, 35);  arc(500, 300, 80, 80, PI, 2*PI);  fill(230, 211, 128);  triangle(500, 320, 470-x_p, 340, 530-x_p, 340);  rect(475-x_p, 360, 10, 40);  rect(525, 360, 10, 40);  //main hall
  fill(0);  rect(327+x_p2, 450, 20, 60);  rect(527+x_p2, 450, 20, 60);  fill(223, 201, 68);  rect(427+x_p2, 410, 220, 20);  //bench
  fill(126, 79, 52);  rect(820, 240, 80, 480);  fill(34, 177, 76);  arc(860, 0, 500, 400, PI/2, PI);  //tree;
}

Main_male male;
Main_female female;
Minim minim;
AudioPlayer song;

ArrayList<Particle> particles;

void mousePressed(){
  particles.add(new Particle(mouseX, mouseY));  //mouse event
}

void keyPressed(){
  if(keyCode == 32 && !key_check){
    scene = 1;
    song.play();
    key_check = true;
  }
}

void setup(){
  size(854, 480);
  noStroke();
  male = new Main_male();
  female = new Main_female();
  minim = new Minim(this);
  particles = new ArrayList<Particle>();
  song = minim.loadFile("Flim.mp3");  //play music
  frameRate(24);
  rectMode(CENTER);
  
}

void draw(){
  background(183, 240, 255);
  switch(scene)  {
    case 0:
      fill(255);
      textSize(50);  text("Walking", 100, 150);
      textSize(20);  text("Press space bar to start animation", 100, 300);  text("Tip : try click on screen while playing the animation", 100, 350);
      break;
    case 1:
      scene1();
      male.dr_move();
      frame++;
      x_p += 0.1;
      break;
    case 2:
      scene2();
      female.dr_move();
      frame++;
      x_p2 += 0.1;
      break;
    case 3:
      scene3();
      male.dr_move();
      frame++;
      x_p += 0.1;
      break;
    case 4:
      scene4();
      female.dr_move();
      frame++;
      x_p2 += 0.1;
      break;
    case 5:
      scene5();
      male.dr_move();
      female.dr_move();
      frame++;
      if(frame < 3108){
        m_p++;
        fm_p--;
      }
      else if(frame >= 3108){
        male.j = 0;  male.i = 12;  female.j = 0;  female.i = 12;
      }
      break;
  }
  for (int i = particles.size()-1; i >=0; i--){
    Particle particle = particles.get(i);
    particle.dr_move();  //mouse event
  }  
  if(frame > 3360){
    fill(255, 255, 255, v_count);  rect(427, 240, 854, 480);
    fill(0, 0, 0, v_count);  textSize(20);  text("Created by Jae-Young Lee", 300, 240);
    if(v_count < 200)
      v_count++;
  }

  if(frame == 720)
  {
    scene = 2;
    x_p = 0;
    for(int i = particles.size()-1; i >= 0; i--)      particles.remove(i);
  }
  else if(frame == 1440)
  {
    scene = 3;
    x_p2 = 0;
    for(int i = particles.size()-1; i >= 0; i--)      particles.remove(i);
  }
  else if(frame == 2160)
  {
    scene = 4;
    x_p = 0;
    for(int i = particles.size()-1; i >= 0; i--)      particles.remove(i);
  }
  else if(frame == 2880)
  {
    scene = 5;
    x_p2 = 0;
    for(int i = particles.size()-1; i >= 0; i--)      particles.remove(i);
    m_p = -1*460;
    fm_p = 460;
  }
}
