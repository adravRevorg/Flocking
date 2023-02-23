# Flocking
Modeled a flocking simulation based on Craig Reynold's Boids Algorithm to simulate the flocking behaviour of birds.
The code has four types of forces [steer, avoid each other, avoid obstacle, and centering]
The max force in these, and their coefficients can be changed by the user, to generate different flocks.
There is steering against obstacle, and also collision in case steering force isn't sufficient to deviate the boids.
Time of concern and radius of concern can also be changed. 
Playing with different parameters provided would give different boid behaviour realtime.

Demo video: https://youtu.be/WhCrEeRHLqs

Credit : For UI controllers, I used an external library for Processing named controlP5
