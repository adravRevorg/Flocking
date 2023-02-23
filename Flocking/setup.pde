void setup(){
  
  //size(800,600);
  fullScreen();
  background(0);
  stroke(255);
  strokeWeight(3);
  textSize(15);
  initialise();
  add_UI();
  addObstacles();
}

void initialise(){
  x = new PVector[N];
  v = new PVector[N];
  a = new PVector[N];
  for(int i=0; i<N; i++){
    x[i] = new PVector(random(width*0.85),random(height));
    v[i] = PVector.random2D();  v[i].setMag(random(2,4));
    a[i] = new PVector(0,0);
  }
  
  bg = loadImage("water.jpg");
  
}

void addObstacles(){
  O = 10;
  xc = new PVector[O];
  R = new float[O];
  for(int i=0; i<O; i++){
    xc[i] = new PVector(random(width*0.75),random(height));
    R[i] = random(50,120);
  }
}
