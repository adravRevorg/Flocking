import controlP5.*;

ControlP5 cp5;

int slider_length;
int slider_height;
float xpos;

boolean reset = true;

void add_UI(){
  cp5 = new ControlP5(this);
  
  slider_length = floor(width*0.1);
  slider_height = 15;
  xpos = width*0.85;
  int p = 120, g = 22;
  
  cp5.setColorForeground(color(32,42,68));      //16,42,42
  cp5.setColorCaptionLabel(color(32,42,68));
  cp5.setColorBackground(color(53,81,92));
  
  
  cp5.addSlider("maxForceSteer")
     .setPosition(xpos,p)
     .setRange(0,5)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ; p+=g;
     
  cp5.addSlider("maxForceAvoid")
     .setPosition(xpos,p)
     .setRange(0,5)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ; p+=g;
     
  cp5.addSlider("maxForceCenter")
     .setPosition(xpos,p)
     .setRange(0,5)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ; p+=g;
     
  cp5.addSlider("maxForceAvoidObs")
     .setPosition(xpos,p)
     .setRange(0,20)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ; p+=g;
     
 cp5.addSlider("maxForce")
     .setPosition(xpos,p)
     .setRange(0,20)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ; p+=g;
  
  cp5.addSlider("ka")
     .setPosition(xpos,p)
     .setRange(0,5)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ;  p+=g;
  
  
   
  cp5.addSlider("kc")
     .setPosition(xpos,p)
     .setRange(0,5)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ; p+=g; 
    
  cp5.addSlider("ks")
     .setPosition(xpos,p)
     .setRange(0,5)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ;  p+=g;
     
  cp5.addSlider("k_obs")
     .setPosition(xpos,p)
     .setRange(0,15)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ;  p+=g;
     
  cp5.addSlider("maxSpeedSteer")
     .setPosition(xpos,p)
     .setRange(0,5)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ;  p+=g;
     
  cp5.addSlider("maxSpeedCenter")
     .setPosition(xpos,p)
     .setRange(0,5)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ;  p+=g;
  
  cp5.addSlider("maxSpeedAvoid")
     .setPosition(xpos,p)
     .setRange(0,5)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ;  p+=g;
     
  cp5.addSlider("maxSpeed")
     .setPosition(xpos,p)
     .setRange(0,10)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ;  p+=g;
     
  cp5.addSlider("time_concern")
     .setPosition(xpos,p)
     .setRange(0,10)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ;  p+=g;
     
 cp5.addSlider("rad")
     .setPosition(xpos,p)
     .setRange(0,200)
     .setWidth(slider_length)
     .setHeight(slider_height)
     ;  p+=2*g;
     
  cp5.addButton("reset")
     .setValue(0)
     .setPosition(xpos,p)
     .setSize(100,slider_height)
     ; p+=g;
     
}

void reset(){
   if (reset)  {reset = false; return;}
  initialise();
}
