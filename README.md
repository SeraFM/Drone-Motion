# Drone Motion

### We study the drone shown in Figure 1.
### The motion of the drone is controlled by the 4 motors as shown in Figure 2.
<br/>

![alt text](https://i.ibb.co/9GTmVwN/drone.png)
Figure 1

<br/>

![alt text](https://i.ibb.co/6vPmfW9/drone-motion.png)
Figure 2

<br/>

### A simplified mathematical model of the drone is described by the following differentials equations:
![alt text](https://i.ibb.co/LPvKrRt/eq.png)

<br/>

### Explanation of symbols in the equations
#### $z:$ movement of drone in the z axis
#### $ψ$: orientation of the drone with respect to the z axis
#### $M$: drone mass
#### $g$: acceleration of gravity
#### $I_z$: drone moment of inertia
#### $f_z$: total force from the four motors on the z axis
#### $τ_z$: total torque from the four motors with respect to the z axis
#### $C_z$: air resistance coefficient in the z axis
#### $C_ψ$: air resistance coefficient with respect to the z axis


### Numerical values of parameters in the equations:
#### $M=1 kg$
#### $I_z=0.08 kg m^2$
#### $g=9.81 m/s^2$
<br/>
<br/>

## Code
> ### question_1b.m: Implements the following formulas, for step h = 0.001, in the interval t ∈ [0, 30] and exports plots.
![alt text](https://i.ibb.co/ZzJJtNR/formulas.png)

<br/>
<br/>

> ### question_1d.m: Implements the following formulas, for step h = 0.001, in the interval t ∈ [0, 30] and exports plots.
![alt text](https://i.ibb.co/7jYJtsk/formulas2.png)
