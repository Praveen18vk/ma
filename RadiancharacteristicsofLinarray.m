clc;close all;clear all;
phi=(0:1:360).*(pi/180);
n=input('Enter the number of sources:');
d=input('Enter the spacing between the sources as fraction of wavelength Ex:half wavelength as 0.5:');
delta=input('Enter the  phase difference between the sources Ex:pi/2:');
psi=(2*pi*d*cos(phi))+delta;
E=(1/n)*(sin(n*psi/2)./sin(psi/2));
polarplot(phi,abs(E),'LineWidth',3);

%Observation table
%no.ofsources  spacinginlambdaunits  Phasediffinrad  Resultantpattern  Patternshape  HPBW   
%   2                 0.5                 0          broadsidearray                   60
%   2                 0.5                 pi         Endfirearray                     80
%   2                 0.5                 pi/2       Phasequadrature                  180
%   2                 0.25                pi/2        " withincreaseddiversity        180