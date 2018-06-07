//Proyecto 4 Edgar Arturo Yebra González
import processing.video.*;
import processing.sound.*;
int closestX,closestY;

Capture video;
SoundFile file;
SoundFile file2;
SoundFile file3;
SoundFile file4;
SoundFile file5;
SoundFile file6;
SoundFile file7;
SoundFile file8;

color trackColor; 
PImage LP, punto;
void setup() {
file=new SoundFile (this, "bombo.mp3");
file2=new SoundFile (this, "hihat.wav");
file3=new SoundFile (this,"snare.wav");
file4=new SoundFile (this,"clap.wav");
file5=new SoundFile (this,"ruido1.wav");
file6=new SoundFile (this, "ruido2.wav");
file7=new SoundFile (this, "ruido3.wav");
file8=new SoundFile (this,"ruido4.wav");

  size(640, 480);
  LP= loadImage("LP.png");
  punto = loadImage("no.png");
  video = new Capture(this, width, height);
  video.start();

  trackColor = color(255, 0, 0);
}

void captureEvent(Capture video) {
  video.read();
}


boolean pad1;
boolean pad2;
boolean pad3;
boolean pad4;
boolean pad5;
boolean pad6;
boolean pad7;
boolean pad8;

void draw() {
  video.loadPixels();
  image(video, 320, 240);
  imageMode(CENTER);
image(LP,320,240,560,350);
textSize(15);
fill(39,119,20);
text("Utiliza un objeto pequeño de algun color y da click sobre el",10,20);
text("para utilizarlo para presionar los pads",10,40);
  float worldRecord = 500; 
  int closestX = 0;
  int closestY = 0;

  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      float d = dist(r1, g1, b1, r2, g2, b2);

      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;}}}

  if (worldRecord < 10) { 

    fill(trackColor);
    strokeWeight(4.0);
    stroke(0);
    ellipse(closestX, closestY, 16, 16);
  }
if (closestX<260 && closestX>180 && closestY<203 && closestY>123){
  if (!pad1){
    file.play();
    pad1 = true;}
pad2 = false;
pad3 = false;
pad4 = false;
pad5 = false;
pad6 = false;
pad7 = false;
pad8 = false;}
if (closestX<360 && closestX>280 && closestY<203 && closestY>123){
  if (!pad2){
file2.play();
pad2 = true;}
pad1 = false;
pad3 = false;
pad4 = false;
pad5 = false;
pad6 = false;
pad7 = false;
pad8 = false;
}
if (closestX<462 && closestX>382 && closestY<203 && closestY>123){
  if (!pad3){
file3.play();
pad3 = true;}
pad1 = false;
pad2 = false;
pad4 = false;
pad5 = false;
pad6 = false;
pad7 = false;
pad8 = false;}
if (closestX<566 && closestX>486 && closestY<203 && closestY>123){
  if (!pad4){
file4.play();
pad4 = true;}
pad1 = false;
pad2 = false;
pad3 = false;
pad5 = false;
pad6 = false;
pad7 = false;
pad8 = false;}
if (closestX<260 && closestX>180 && closestY<350 && closestY>270){
  if (!pad5){
file5.play();
pad5 = true;}
pad1 = false;
pad2 = false;
pad3 = false;
pad4 = false;
pad6 = false;
pad7 = false;
pad8 = false;}
if (closestX<360 && closestX>280 && closestY<350 && closestY>270){
  if (!pad6){
file6.play();
pad6 = true;}
pad1 = false;
pad2 = false;
pad3 = false;
pad4 = false;
pad5 = false;
pad7 = false;
pad8 = false;}
if (closestX<462 && closestX>382 && closestY<350 && closestY>270){
  if (!pad7){
file7.play();
pad7 = true;}
pad1 = false;
pad2 = false;
pad3 = false;
pad4 = false;
pad5 = false;
pad6 = false;
pad8 = false;}
if (closestX<566 && closestX>486 && closestY<350 && closestY>270){
  if (!pad8){
file8.play();
pad8 = true;}
pad1 = false;
pad2 = false;
pad3 = false;
pad4 = false;
pad5 = false;
pad6 = false;
pad7 = false;}

}
void mousePressed() {
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}