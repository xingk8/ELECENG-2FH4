clc; %clear command line 
clear; %remove previuos variables 

%initialize
V = 0; %initialize volume of closed surface to 0 
S1 = 0; %initialize the area of the S1 to 0 
S2 = 0; %initialize the area of the S2 to 0
S3 = 0; %initialize the area of the S3 to 0
S4 = 0; %initialize the area of the S4 to 0
S5 = 0; %initialize the area of the S5 to 0

%lower bounds of r, phi and theta
r = 0;  
phi = pi/4; 
theta = pi/4;

Number_of_r_Steps=1000; %initialize the r discretization
Number_of_phi_Steps=1000;%initialize the phi discretization
Number_of_theta_Steps=1000;%initialize the theta discretization


dr = (2-0)/Number_of_r_Steps; %r increment 
dphi = (pi/2-pi/4)/Number_of_phi_Steps; %phi increment 
dtheta = (pi/2-pi/4)/Number_of_theta_Steps; %theta increment 


%volume of the enclosed surface 
%volume starts at starting, sweeps along theta upwards, rotates around phi,
%increases r and repeats
for K=1:Number_of_r_Steps
    for j=1:Number_of_phi_Steps
        for i=1:Number_of_theta_Steps
             V=V+r^2*sin(theta)*dr*dtheta*dphi;%fixed r and phi
             
        end %increment theta since for a fixed r and theta, volume elements are stacked from the bottom to the top of the shell
    theta = theta + dtheta;
    end
    r = r +dr; %adds a new "thin spherical shell" to the volume
    theta = pi/4; %ensure theta starts from correct lower bound
end

r = 0; 

%surface area of enclosed shape

%S2
r =2; 
for k = 1:Number_of_theta_Steps
    for i = 1:Number_of_phi_Steps
        S2 = S2+(r^2*sin(theta)*dtheta*dphi); 
    end
    theta = theta +dtheta; 
end
theta = pi/4; 

%S5
for k=1:Number_of_r_Steps
    for j=1:Number_of_theta_Steps
        S5=S5 + r*dr*dtheta;
        r = r +dr;
    end 
    r = 0 ;
end 
S6 = S5 ; %S6

%S3 

for k=1:Number_of_r_Steps
    for j=1:Number_of_phi_Steps
        S3=S3 + r*sin(pi/4)*dr*dphi;
        r = r+dr;
    end 
    r =0;
end
S3;

%S4 

for k=1:Number_of_r_Steps
    for j=1:Number_of_phi_Steps
        S4=S4 + r*sin(pi/2)*dr*dphi;
        r = r+dr;
    end 
    r =0;
end
S4;

S = S1+S2+S3+S4+S5+S6;

disp(V);
disp(S);








   










