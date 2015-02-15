import ddf.minim.*;
AudioPlayer player;
Minim minim;


void setup() {
  size(500, 500, P2D);
  background(220, 220, 220);

  minim = new Minim(this);

  //  player = minim.loadFile("/Users/alexfrench/Desktop/proc/08 Warning Sign.mp3", 2048);
    player = minim.loadFile("/Users/alexfrench/Desktop/proc/Spitfire _Original Mix_ - Porter Robinson _HD_.mp3", 2048);
  //  player = minim.loadFile("/Users/alexfrench/Desktop/proc/Wonder.mp3", 2048);
  //  player = minim.loadFile("/Users/alexfrench/Desktop/proc/01 Be Ok.mp3", 2048);
  //  player = minim.loadFile("/Users/alexfrench/Desktop/proc/01 Intro.mp3", 2048);
  //  player = minim.loadFile("/Users/alexfrench/Desktop/proc/Back to the Beginning.mp3", 2048);
  player.play();
}

float x = 0;
float y = 0;
float z = 2 * PI;
float c = .006956525;
float z2 = 0;
float r = 0;
float z3 = PI/100;
float BPM = 200;
float calc2 = BPM / 4;
float calc3 = calc2 / 2;
float r2 = 0;
int count = 0;
float pulse = BPM / 4;


void draw() {
  x = x + c;
  y = y + c;
  //background(201,200,200);
  fill(220, 10);
  rect(-5, -5, width + 5, height + 5);
  for (int i = 0; i < player.left.size()-1; i++)
  {
    if (x > z2) {
      z2 = z2 + PI/calc3;
      r2 = random(0, 150);
      stroke(r2, r2, r2);
      r = random(50, 450);


      line(0, r, ((player.left.get(i)*700)), r);
      
      switch(count) {
      case 1:
        count += 1;
        for (float j = pulse; j > 0; j-= .1) {
          noStroke();
          fill(255 - (3 * j), 255 - (3 * j), 255 - (3 * j));
          rect(0, r, 2 * width - 30, j);
          rect(0, r + 100, 2 * width - 30, j);
        }
      case 3:
        count -= 3;
        for (float j = pulse; j > 0; j-= .1) {
          noStroke();
          fill(255 - (3 * j), 255 - (3 * j), 255 - (3 * j));
          rect(0, r, 2 * width - 30, j);
          rect(0, r + 100, 2 * width - 30, j);
          rect(0, r - 100, 2 * width - 30, j);
        }  
      default:
        count += 1;
        for (float j = pulse; j > 0; j -= .1) {
          noStroke();
          fill(255 - (3 * j), 255 - (3 * j), 255 - (3 * j));
          rect(0, r, 2 * width - 50, j);
        }
      }
    }
  }
}






//Saving pictures
void keyPressed() {
  if (key == 's') {
    saveFrame("####.png");
  }
}


//Cessation housekeeping
void stop()
{
  player.close();
  minim.stop();

  super.stop();
}

