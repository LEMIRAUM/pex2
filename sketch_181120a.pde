int color_list[][] = {{77, 38, 0}, {185, 122, 87}, {255, 100, 100}, {255, 174, 201}, {255, 152, 83}, {255, 201, 14}, {255, 250, 140}, {229, 212, 120}, {181, 230, 29}, {186, 221, 197}, {0, 162, 232}, {153, 217, 234}, {163, 73, 164}, {200, 191, 231}, {255, 255, 255}};
int cnt, temp_mx, temp_my, mx_color, finish = 0, s_cnt = 0;

class Color_box
{
  int r, g, b, x, y;
  
  public Color_box(int _r, int _g, int _b, int _x, int _y) {
    r = _r;    g = _g;    b = _b;    x = _x;    y = _y;
  }
  public void colorDraw(int i)
  {
    fill(r, g, b, 100);
    rect((2 * i + 1) * 50 + x, y, 80, 80, 10, 10, 10, 10);
    fill(r, g, b, 180);
    rect((2 * i + 1) * 50 + x, y, 75, 75, 10, 10, 10, 10);
    fill(r, g, b, 255);
    rect((2 * i + 1) * 50 + x, y, 70, 70, 10, 10, 10, 10);
    
    return;
  }
  public void colorChange(int temp_c)
  {
    r = color_list[(int)((temp_c - 50) / 100)][0];  g = color_list[(int)((temp_c - 50) / 100)][1];  b = color_list[(int)((temp_c - 50) / 100)][2];
  }
}

class Wafers
{
  int x, y, xi, xj, yi, yj, yk, yc, base_c, cream1_c, cream2_c;
  float xa1, xa2, xb1, xb2, ya1, ya2, yb1, yb2, k, m;
  
  public Wafers(int _x, int _y, int _xi, int _xj, int _yi, int _yj, int _yk, int _yc) {
    x = _x;  y = _y;  xi = _xi;  xj = _xj;  yi = _yi;  yj = _yj;  yk = _yk;  yc = _yc;  base_c = 14;  cream1_c = 14;  cream2_c = 14;
  }
  public void base()
  {
    fill(color_list[base_c][0], color_list[base_c][1], color_list[base_c][2], 255);
    quad(x - xj, y - yk, x, y, x, y + yi, x - xj, y + yi - yk);
    quad(x, y, x + xi, y - yj, x + xi, y + yi - yj, x, y + yi);  
    fill(color_list[base_c][0] - 10, color_list[base_c][1] - 10, color_list[base_c][2] - 10, 255);
    quad(x - xj, y - yk, x + xi - xj, y - yj - yk, x + xi, y - yj, x, y);
    fill(color_list[base_c][0], color_list[base_c][1], color_list[base_c][2], 255);
    quad(x - xj, y - yk + yi + yc, x, y + yi + yc, x, y + yi / 3 * 5 + yc, x - xj, y + yi / 3 * 5 - yk + yc);
    quad(x, y + yi + yc, x + xi, y - yj + yi + yc, x + xi, y + yi / 3 * 5 - yj + yc, x, y + yi / 3 * 5 + yc);
    fill(color_list[base_c][0], color_list[base_c][1], color_list[base_c][2], 255);
    quad(x - xj, y - yk + yi / 3 * 5 + yc * 2, x, y + yi / 3 * 5 + yc * 2, x, y + yi / 3 * 8 + yc * 2, x - xj, y + yi / 3 * 8 - yk + yc * 2);
    quad(x, y + yi / 3 * 5 + yc * 2, x + xi, y - yj + yi / 3 * 5 + yc * 2, x + xi, y + yi / 3 * 8 - yj + yc * 2, x, y + yi / 3 * 8 + yc * 2);
    
    return;
  }
  public void cream1()
  {   
    fill(color_list[cream1_c][0], color_list[cream1_c][1], color_list[cream1_c][2], 245);
    quad(x - xj, y - yk + yi, x, y + yi, x, y + yi + yc, x - xj, y + yi - yk + yc);
    quad(x, y + yi, x + xi, y - yj + yi, x + xi, y + yi - yj + yc, x, y + yi + yc);  
    
    return;
  }
  public void cream2()
  {
    fill(color_list[cream2_c][0], color_list[cream2_c][1], color_list[cream2_c][2], 245);
    quad(x - xj, y - yk + yi / 3 * 5 + yc, x, y + yi / 3 * 5 + yc, x, y + yi / 3 * 5 + yc * 2, x - xj, y + yi / 3 * 5 - yk + yc * 2);
    quad(x, y + yi / 3 * 5 + yc, x + xi, y - yj + yi / 3 * 5 + yc, x + xi, y + yi / 3 * 5 - yj + yc * 2, x, y + yi / 3 * 5 + yc * 2);
    
    return;
  }
  public void stripe()
  {
    k = 0.1;
    for(m = -3230; m < -1130; m += 250)
    {
      m -= 30;      xa1 = f1(m);      if(fb(xa1) < fb(f2(m)))      xa1 = f2(m);      ya1 = fb(xa1);
      xb1 = f4(m);      if(fb(xb1) > fb(f3(m)))      xb1 = f3(m);      yb1 = fb(xb1);
      m += 60;      xa2 = f1(m);      if(fb(xa2) < fb(f2(m)))      xa2 = f2(m);      ya2 = fb(xa2);
      xb2 = f4(m);      if(fb(xb2) > fb(f3(m)))      xb2 = f3(m);      yb2 = fb(xb2);      m -= 30;
      fill(0, 0, 0, 150);
      quad(xa1, ya1, xb1, yb1, xb2, yb2, xa2, ya2);
    }
    k = -1.2;
    for(m = 905; m < 1655; m += 80)
    {
      m -= 10;      xa1 = f1(m);      if(fb(xa1) > fb(f4(m)))        xa1 = f4(m);      ya1 = fb(xa1);
      xb1 = f2(m);      if(fb(xb1) < fb(f3(m)))      xb1 = f3(m);      yb1 = fb(xb1);
      m += 20;      xa2 = f1(m);      if(fb(xa2) > fb(f4(m)))      xa2 = f4(m);      ya2 = fb(xa2);
      xb2 = f2(m);      if(fb(xb2) < fb(f3(m)))      xb2 = f3(m);      yb2 = fb(xb2);      m -= 10;
      fill(0, 0, 0, 150);
      quad(xa1, ya1, xb1, yb1, xb2, yb2, xa2, ya2);
    }
    k = 0.1;
    for(m = -3200; m < -1100; m += 250)
    {
      m -= 30;      xa1 = f1(m);      if(fb(xa1) < fb(f2(m)))      xa1 = f2(m);      ya1 = fb(xa1);
      xb1 = f4(m);      if(fb(xb1) > fb(f3(m)))      xb1 = f3(m);      yb1 = fb(xb1);
      m += 60;      xa2 = f1(m);      if(fb(xa2) < fb(f2(m)))      xa2 = f2(m);      ya2 = fb(xa2);
      xb2 = f4(m);      if(fb(xb2) > fb(f3(m)))      xb2 = f3(m);      yb2 = fb(xb2);      m -= 30;
      fill(color_list[base_c][0], color_list[base_c][1], color_list[base_c][2], 255);
      quad(xa1, ya1, xb1, yb1, xb2, yb2, xa2, ya2);
    }
    k = -1.2;
    for(m = 900; m < 1650; m += 80)
    {
      m -= 10;      xa1 = f1(m);      if(fb(xa1) > fb(f4(m)))        xa1 = f4(m);      ya1 = fb(xa1);
      xb1 = f2(m);      if(fb(xb1) < fb(f3(m)))      xb1 = f3(m);      yb1 = fb(xb1);
      m += 20;      xa2 = f1(m);      if(fb(xa2) > fb(f4(m)))      xa2 = f4(m);      ya2 = fb(xa2);
      xb2 = f2(m);      if(fb(xb2) < fb(f3(m)))      xb2 = f3(m);      yb2 = fb(xb2);      m -= 10;
      fill(color_list[base_c][0], color_list[base_c][1], color_list[base_c][2], 255);
      quad(xa1, ya1, xb1, yb1, xb2, yb2, xa2, ya2);
    }
    
    return;
  }
  public void change_color(int temp_c, int c_p) {
    if(c_p == 0)
      base_c = (int)((temp_c - 50) / 100);
    if(c_p == 1)
      cream1_c = (int)((temp_c - 50) / 100);
    if(c_p == 2)
      cream2_c = (int)((temp_c - 50) / 100);
  }
  public float fb(float xt){
    return k * (xt - m);
  }
  public float f1(float mt){
    return (yk * x - xj * (y + k * mt)) / (yk - k * xj);
  }
  public float f2(float mt){
    return (yj * (x - xj) + xi * (y - yk + k * mt)) / (k * xi + yj);
  }
  public float f3(float mt){
    return (yk * (x + xi) - xj * (y - yj + k * mt)) / (yk - k * xj);
  }
  public float f4(float mt){
    return (yj * x + xi * (y + k * mt)) / (k * xi + yj);
  }
}

class Point
{
  int x, y;
  public int current_point;
  public Point() {
    x = 190;  y = 620;  current_point = 0;
  }
  public void pointdraw()
  {
    fill(240, 240, 240);
    triangle(x, y, x + 15, y + 20, x - 15, y + 20);
    
    return;
  }
}

class Button extends Point
{
  public void button_draw()
  {
    fill(255);
    for(cnt = 0; cnt < 3; cnt++)
      rect((2 * cnt + 1) * 50 + 1600, 950, 80, 80, 10, 10, 10, 10);
    fill(0);
    triangle(1630, 950, 1670, 930, 1670, 970);
    triangle(1770, 950, 1730, 930, 1730, 970);
    quad(1830, 950, 1845, 960, 1845, 970, 1830, 960);
    quad(1845, 960, 1870, 930, 1870, 940, 1845, 970);
    
    return;
  }
  public void restore_draw()
  {
    fill(255);    rect(1850, 950, 80, 80, 10, 10, 10, 10);
    fill(0);    arc(1850, 951, 50, 50, (float)3 / 4 * PI, (float)9 / 4 * PI);
    fill(255);    ellipse(1850, 951, 35, 35);
    fill(0);
    pushMatrix();  translate(1850, 951);  rotate((int)(-1 / 4 * PI));
    triangle(-21.25, 10, -31.25, 0, -11.25, 0);  popMatrix();
  }
  public void press_check(int temp_x)
  {
    if(temp_x >= 1610 && temp_x < 1690)
      change_point(-100);
    else if(temp_x >= 1710 && temp_x < 1790)
      change_point(100);
    else if(temp_x >= 1810 && temp_x < 1890) {
      if(finish == 0)
        finish = 1;
      else {
        finish = 0;        
        s_cnt = 0;
        setup();
      }      
    }
    
    return;
  }
  public void change_point(int locate)
  {
    if(locate < 0) {
      if(current_point > 0) {
        current_point--;
        x += locate;
      }
    }
    else {
      if(current_point < 2) {
        current_point++;
        x += locate;
      }
    }
      
      return;
  }
}

class Snow
{
  float x, y, vx, vy, v, r;
  
  public Snow() {
    x = (int)random(2000) + 50;  y = -20;  vx = random(0.5) + 0.1;  vy = random(1) + 0.5;  v = (int)random(100) + 125;  r = (int)random(10) + 20;
  }
  public void snow_draw()
  {
    fill(255, 255, 255, v);
    ellipse(x, y, r, r);
  }
  public void move()
  {
    if(y > 1085) {
      x = (int)random(2000) + 50;  y = -20;  vx = random(0.1) + 0.1;  vy = random(1) + 0.5;  v = (int)random(100) + 125;
      snow_draw();
      return;
    }    
    x -= vx;
    y += vy;
    snow_draw();
    
    return;
  }
}

void mousePressed()
{
  temp_mx = mouseX;  temp_my = mouseY;
  if(temp_my > 910 && temp_my < 990)
  {
    for(cnt = 0; cnt < 15; cnt++)
    {
      if(temp_mx >= (2 * cnt + 1) * 50 + 10 && temp_mx < (2 * cnt + 1) * 50 + 90)
      {
        wafers.change_color(temp_mx, button.current_point);
        current_color[button.current_point].colorChange(temp_mx);
        return;
      }
    }
    button.press_check(temp_mx);
  }
}

Color_box[] color_box = new Color_box[15];
Color_box[] current_color = new Color_box[3];
Wafers wafers;
Button button;
Snow[] snow = new Snow[100];

void setup()
{
  size(1920, 1080);
  noStroke();
  rectMode(CENTER);
  for(cnt = 0; cnt < 15; cnt++)
    color_box[cnt] = new Color_box(color_list[cnt][0], color_list[cnt][1], color_list[cnt][2], 50, 950);
  for(cnt = 0; cnt < 3; cnt++)
    current_color[cnt] = new Color_box(color_list[14][0], color_list[14][1], color_list[14][2], 140, 550);
  wafers = new Wafers(830, 420, 600, 250, 90, 80, 110, 50);
  button = new Button();
  for(cnt = 0; cnt < 100; cnt++)
    snow[cnt] = new Snow();
}

void draw()
{
  if(finish == 0)
  {
    background(0);
    for(cnt = 0; cnt < 15; cnt++)
      color_box[cnt].colorDraw(cnt);
    wafers.base();
    wafers.stripe();
    wafers.cream1();
    wafers.cream2();
    for(cnt = 0; cnt < 3; cnt++)
      current_color[cnt].colorDraw(cnt);
    button.pointdraw();
    button.button_draw();
  }
  else
  {
    background(0);
    if(s_cnt < 1200)
    {
      if(s_cnt % 12 == 0)
      {
        snow[s_cnt / 12].snow_draw();
      }
      s_cnt++;
    }
    for(cnt = 0; cnt < s_cnt / 12; cnt++)
    {
        snow[cnt].move();
        snow[cnt].snow_draw();
    }
    wafers.base();
    wafers.stripe();
    wafers.cream1();
    wafers.cream2();
    button.restore_draw();
  }
}
