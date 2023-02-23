void draw(){
  
  image(bg,0,0);
  tint(255, 80);
  stroke(32,42,68);
  //stroke(16,42,42);
  fill(32,42,68);
  strokeWeight(4);
  for(int i=0; i<O;i++)
    circle(xc[i].x, xc[i].y, R[i]);
  //text("Framerate :" +int(frameRate), width*0.85,height*0.6);
  
  
  for(int i=0;i<N;i++){
    display(i);
    computeForces(i);
    updateState(i);
  }
  
  //saveFrame("frames/####.tga");
}

void display(int i){
    point(x[i].x,x[i].y);
  
}



void updateState(int i){
  x[i].add(v[i]);
  keepWithin(i);
  v[i].add(a[i]);
  collisionResponseIfAny(i);
  v[i].limit(maxSpeed);
}

void keepWithin(int i){
  if (x[i].x<0 )  x[i].x = width*0.85;
  else if (x[i].x>width*0.85)  x[i].x = 0;
  
  if (x[i].y<0 )  x[i].y = height;
  else if (x[i].y>height)  x[i].y = 0;
}


void collisionResponseIfAny(int i){
  
  for(int j=0; j<O; j++){
    PVector normal = PVector.sub(xc[j],x[i]);
    if (normal.mag()<R[j]/2){
      //collision 
      PVector vN = normal.copy();
      normal.normalize();
      vN.setMag(v[i].dot(normal));
      PVector vT = PVector.sub(v[i],vN);
      vN.mult(-1);
      v[i] = vN.copy();
      v[i].add(vT);
      return;
    }
  }
}
      
  
  
  
