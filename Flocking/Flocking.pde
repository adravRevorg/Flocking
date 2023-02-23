/*Submitted by Varda Grover for HW3
Contains flocking simulation
- with 4 types of forces (steer, avoid each other, avoid obstacle, and centering force
- the maxForce in these, and their coefficients can be changed by the user
to generate different flocks
- there is steering against obstacle
- and collision in case steering force isnt sufficient
- Time of concern and radius of concern can also be changed
*/

int N=1000;

//States
PVector[] x,v,a;



float maxSpeedSteer = 4;
float maxSpeedAvoid = 4;
float maxSpeedCenter = 4;
float maxSpeed = 4;

float maxForceSteer = 0.2;      //steering
float maxForceAvoid = 0.2;      //collision avoidance among themselves
float maxForceCenter = 0.2;     //centering
float maxForceAvoidObs = 3;     //avoiding obstacle
float maxForce = 0.2;           //sum of all

float time_concern = 0.5;

int rad = 100; //distance of neighbourhood

//multipliers for avoid, centering, steering, avoiding obstacle
float ka = 1, kc = 1, ks = 1, k_obs = 1;   


//Obstacle
int O;
PVector[] xc;// = new PVector(500, 300);
float[] R;//= 90;

PImage bg;
