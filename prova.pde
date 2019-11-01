/* @pjs preload="micro.jpg"; */

PImage img;
void setup() {
  size(800, 600);
  img = loadImage("micro.jpg");
}

/*void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}*/

void draw(){
  image(img, 0, 0);
}
