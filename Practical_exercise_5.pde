
int dotWidth = 70;
int dotHeight = 70;
int frameHeight = 650;
int frameWidth = 650;

int circleRadius = 250;
int pointsInCircle = 12;
int OPACITY = 200;
float dinstanceBetween = 360/pointsInCircle;
int centerHeight = frameHeight/2;
int centerWidth = frameWidth/2;

color bgColor = color(255,255,255);
int notShownDotIndex = 0;

ArrayList<PImage> dots = new ArrayList<PImage>();

void settings() {  // can't call settings() after setup()
  size(frameWidth, frameHeight);
}

void setup() {  
  background(bgColor);
  
  tint(255, OPACITY);  // Set opacity
 
  float angle = 0; 
  
  for(int i = 0; i < pointsInCircle; i++) {
    PImage dot = loadImage("orange-dot.png");  // Load the dot  
    //dot.filter(BLUR, 10);
    drawDotInCircle(angle, dot);
    dots.add(dot);
    angle = angle + dinstanceBetween; 
  }
  
  filter(BLUR, 6);
  drawCross();
}

void draw() {
  background(bgColor);
  updateCircle();
  notShownDotIndex++;
  if(notShownDotIndex >= dots.size()) notShownDotIndex = 0;
  drawCross();
  delay(100);
}

void drawCross() {
  PImage cross = loadImage("cross.png");
  image(cross, centerWidth - 5, centerHeight - 5, 10, 10);  // Draw the cross 
}

void updateCircle() {
  float angle = 0;
  for(int i = 0; i < dots.size(); i++) {
    if(i != notShownDotIndex){
      PImage dot = dots.get(i);
      drawDotInCircle(angle, dot);
    }
    angle = angle + dinstanceBetween; 
  }
  filter(BLUR, 6);
}

void drawDotInCircle(float lastangle, PImage dot) {

    float x = centerWidth + circleRadius * cos(radians(lastangle));
    x = x - (dotWidth/2);
    
    float y = centerHeight + circleRadius * sin(radians(lastangle));
    y = y - (dotHeight/2);
    
    image(dot, x, y, dotWidth, dotHeight);  // Display at full opacity
}