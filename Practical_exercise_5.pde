PImage dot;
int dotWidth = 70;
int dotHeight = 70;
int frameHeight = 650;
int frameWidth = 650;

int circleRadius = 250;
int pointsInCircle = 12;

void settings() {  // can't call settings() after setup()
  size(frameWidth, frameHeight);
}

void setup() {  
  color bgcolor = color(255,255,255);
  background(bgcolor);
  
  dot = loadImage("orange-dot.png");  // Load the dot
  dot.filter(BLUR, 50);
  
  int centerheight = frameHeight/2;
  int centerwidth = frameWidth/2;
  
  PImage cross = loadImage("cross.png");
  image(cross, centerwidth - 5, centerheight - 5, 10, 10);  // Draw the cross
 
  float dinstancebetween = 360/pointsInCircle;
  float angle = 0; 
  
  for(int i = 0; i < pointsInCircle; i++) {
    
    float x = centerwidth + circleRadius * cos(radians(angle));
    float y = centerheight + circleRadius * sin(radians(angle));
    
    x = x - (dotWidth/2);
    y = y - (dotHeight/2);
    
    image(dot, x, y, dotWidth, dotHeight);  // Display at full opacity
    angle = angle + dinstancebetween;
   
  }

}

void draw() { 

  
}