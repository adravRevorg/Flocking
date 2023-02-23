void computeForces(int i){
  
  //zero accelaration, or, reset acceleration
  a[i] = new PVector(0,0);
  
  PVector steer = new PVector(0,0);  //for matching velocity
  PVector center = new PVector(0,0);
  PVector avoid = new PVector(0,0);
  
  float close = 0;
  
  
  for(int j=0; j<N; j++){
    float distSq = (PVector.sub(x[j],x[i])).magSq();
    if (distSq>rad*rad || i==j)  continue;    //if this object is far, no point - not considering this boid
    
    steer.add(v[j]);
    center.add(x[j]);
    
    PVector tmp = PVector.sub(x[i],x[j]);
    tmp.div(distSq);
    avoid.add(tmp);
    
    close++;
  }
  
  if (close==0) return;
  
  a[i].add(computeSteer(steer, i, close).mult(ks));
  a[i].add(computeSeparation(avoid, i, close).mult(ka));
  a[i].add(computeCentering(center, i, close).mult(kc));
  a[i].add(computeAvoidObstacle(i).mult(k_obs));
  a[i].limit(maxForce);
}


//Compute the steering force needed to attain the average loca velocity
PVector computeSteer(PVector steer, int i, float close){
  steer.mult(1/close);      //average local velocity of this boid, ence the desired velocity
  steer.setMag(maxSpeedSteer);  //just get average direction, and have magnitude as per us
  steer.sub(v[i]);
  steer.limit(maxForceSteer);
  return steer;
}

//Compute force required to avoid collision with other boids
PVector computeSeparation(PVector avoid, int i, float close){
  avoid.div(close);
  avoid.setMag(maxSpeedAvoid);
  avoid.sub(v[i]);
  avoid.limit(maxForceAvoid);
  return avoid;
}

//compute force required to reach average local position
PVector computeCentering(PVector center, int i, float close){
  center.mult(1/close);      //average local position of this boid, ence the desired position
  center.sub(x[i]);
  center.setMag(maxSpeedCenter);
  center.sub(v[i]);
  center.limit(maxForceCenter);
  return center;
}

PVector computeAvoidObstacle(int i){
  
 
 PVector avoidObs = new PVector(0,0);
 
 for(int j=0;j<O;j++){
    PVector v_i = PVector.sub(xc[j],x[i]).normalize();
    
    PVector vi = PVector.mult(v_i, v[i].dot(v_i));
    PVector vt = PVector.sub(v[i],vi);
    PVector v_t = vt.copy(); v_t.normalize();
    
    float d = PVector.sub(xc[j],x[i]).mag();
    float t = abs(d-R[j])/vi.mag();
    
    if (v_i.dot(PVector.sub(xc[j],x[i]))<0)  
      {avoidObs = new PVector(0,0); return avoidObs;}
    
    if (t<=time_concern){
      float req_dist = R[j] - t*vt.mag();
      float req_a = 2*req_dist/(t*t);
      avoidObs.add(PVector.mult(v_t,req_a));
    }
   }
   avoidObs.limit(maxForceAvoidObs);
   return avoidObs;
}
  
