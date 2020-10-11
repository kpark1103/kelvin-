 PImage light;
import processing.video.*;
Particle[] particles;

Movie video;

void setup() {
  size(1280, 720);
 video=new Movie(this,"traffic.mp4");
 video.loop();
  colorMode(HSB, 100);
  colorMode(RGB, 100);
  for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
}
  loadPixels();
  particles = new Particle [2000];
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  background(0);
  String[] cameras = Capture.list();
  
  if(cameras.length == 0){
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for(int i = 0; i< cameras.length; i++){
      println(cameras[i]);
    }
  }
}

void movieEvent(Movie video){
  video.read();
}
int value = 0;


void draw() {
  light = loadImage("light.png");
  colorMode(HSB);
  image(light,500,200);
  noStroke();
  fill(62);
  ellipse(30,60,30,30);
  
}
void keyPressed(){
  
  if (value == 5){
    value = 1000;
  } else {
    value = 5;
  }
  
  for (int i = 0; i < particles.length; i++) {
    particles[i].display();
    particles[i].move();
  }
  save("traffic1.mp4");
  save("traffic2.mp4");
  save("traffic3.mp4");
  save("traffic4.mp4");
  save("traffic5.mp4");
}
