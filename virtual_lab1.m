clear all;
clc;
%Defining a time vector tvec
tvec = linspace(0,50,1000)
%Defining a vector uvec with element 1 to represent the step input
uvec = ones(1000,1)
%Commands for generating time response of the system
options = odeset('AbsTol',1e-9,'RelTol',1e-8)
[t,y] = ode45(@motor_model,tvec,[0;0],options,uvec,tvec)
%Seperating the y matrix to get angular velocity and rotation angle
rotation_angle = y(:,1)
angular_velocity = y(:,2)
%Plotting the graphs to estimate parameters through graph
figure(1)
plot(t,rotation_angle)
figure(2)
plot(t,angular_velocity)





