clc;
clear;

O = [0 0 0];
A = [1 2 3];
B = [3 2 1];

R1 = A - O;
R2 = B - O;

R1_dot_R2 = dot(R1, R2);
R2_dot_R2 = dot(R2, R2);

Proj_R1_ON_R2 = (R1_dot_R2/R2_dot_R2)*R2;

Mag_R1 = norm(R1);
Mag_R2 = norm(R2);

COS_theta = R1_dot_R2/(Mag_R1*Mag_R2);

theta = acos(COS_theta);
