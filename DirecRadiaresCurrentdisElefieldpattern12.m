clc;close all;clear all;
format long;
A=input('Enter radius of loop in wavelengths:');
eta=120*pi;
I0=1;
theta=(1:180)*(pi/180);
dth=theta(2)-theta(1);
F=besselj(1,(2.0*pi*A*sin(theta)));
U=A^2*(2*pi)^2*F.^2*eta/8;

Prad=sum(2*pi*U.*sin(theta)*dth);

%Directivity
D=(4.0*pi*max(U))/Prad;
D_db=10*log10(D);

%Radiation resistance
Rr=2.0*Prad;

%Elevation pattern
r=10;
lambda=1;
k=(2*pi)/lambda;
H_theta=-A*k*I0*exp(-1j*k*r)*besselj(1,k*A*sin(theta))/(2*r);
Hdb=20*log10(abs(H_theta)/max(abs(H_theta)));
Hdb=[Hdb fliplr(Hdb)];
theta=[theta,theta+pi];
figure(1),polarplot(theta,Hdb);
title('Normalised far field elevation pattern');
rlim([-40 0]);

fprintf('Max radiated power:%f Watts\n',Prad);
fprintf('Max directivity:%f (dimensionless)\n',D);
fprintf('Max directivity:%f dB\n',D_db);
fprintf('Radiation rresistance:%f Ohms\n',Rr);
