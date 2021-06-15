clear all;
clc;
%Defining time from 0 to 5
time_given = linspace(0,5,1000)
%Defining first order system
sys2 = tf([166.7],[1 2])
%Defining signal system
v = (exp(-time_given.^2).*cos(3*time_given))
figure(1)
lsim(sys2,v,time_given)
%Defining second order system
sys1 = tf([166.7],[1 2 0])
%Plotting the graph for second order system
figure(2)
lsim(sys1,v,time_given)
%Commands for generating the time response of the system
options = odeset('AbsTol',1e-9,'RelTol',1e-8)
[t1,y1] = ode45(@motor_model,time_given,[0;0],options,v,time_given)
rotation_angle = y1(:,1)
angular_velocity = y1(:,2)
%Plotting graphs again to verify my estimated values
figure(3)
plot(time_given,rotation_angle)
figure(4)
plot(time_given,angular_velocity)

