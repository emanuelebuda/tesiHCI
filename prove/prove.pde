/* @pjs preload="micro.jpg"; */

PImage img;
String[] logs = new String[3];
String[] oldCodeList = new String[1];
String[] lines;

/*
PrintWriter output; 
import processing.sound.*;
SoundFile click;
String clickName = "click.mp3";
String path;*/



int mx = mouseX;
int my = mouseY;

int cX1 = 222, cY1 = 263; 
int cX2 = 304, cY2 = 263;
int goX = 263, goY=419, goD = 60;
int cD = 34;
color cH, cc;
boolean cO1 = false, cO2 = false;
boolean gO = false;

String code;
int count;

String list[];
String finalLogs[];
String oldCode = "";

void setup(){
  img = loadImage("micro.jpg");
  size(600,800);
  cH = color(0,0,0,0);
  /*output = createWriter("logs.txt"); */
  code = "";
  count = 0;
  strokeWeight(4);
  /*path = sketchPath(clickName);
  click = new SoundFile(this, path);*/
  //String oldCodeList[] = new String[1];
  String lines[] = loadStrings("https://emanuelebuda.github.io/tesiHCI/prove/logs.txt");
  for (int i=0; i < lines.length; i++) {
    oldCode = oldCode + lines[i] + "\n";
  }
  oldCodeList[0] = oldCode;
  
}

void draw(){
  image(img,0,0); 
  /*println(mouseX + " : " + mouseY);*/
  //println(count);
  
  
  update(mouseX, mouseY);
  if (cO1) {
    fill(cH);
  fill(255,0,0,0);
  stroke(204, 102, 0);
  ellipse(cX1, cY1, cD, cD);
  }
  if (cO2) {
    fill(cH);
  fill(255,0,0,0);
  stroke(204, 102, 0);
  ellipse(cX2, cY2, cD, cD);
  }
  if (gO) {
  fill(cH);
  fill(255,0,0,0);
  stroke(204, 102, 0);
  ellipse(goX, goY, goD, goD);
  }
  
  if(count == 3) {
    String [] finalLogs = concat(oldCodeList, logs);
    saveStrings("logs.txt", finalLogs);
    println("saved");
    keyPressed();
  }
  
}

void update(int x, int y) {
  if ( overCircle(cX1, cY1, cD) ) {
    cO1 = true;
  }else if( overCircle(cX2, cY2, cD) ) {
    cO2 = true;
  }else if( overCircle(goX, goY, goD) ) {
    gO = true;
  }else {
    cO1 = false;
    cO2 = false;
    gO = false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {
  if (cO1) {
    cH = color(0);
    /*click.play();*/
    code = code + hour() + "_" + minute() + "_" + second() + "_" + millis() + " " + "A,";  
}
  if (cO2) {
    cH = color(0);
    /*click.play();*/
    code = code + (hour() + "_" + minute() + "_" + second() + "_" + millis() + " " + "B,");
  }
  if (gO) {
    cH = color(0);
    /*click.play();*/
    /*output.println(code);*/
    logs[count] = code;
    code = "";
    count = count + 1;
    }
}

void keyPressed() {
  /*output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file*/
  background(255);
}
