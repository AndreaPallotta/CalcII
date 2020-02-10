load('contactLensData.mat');

% name: Andrea Pallotta
% date: 11/27/2019
% email: ap4534@rit.edu

%% Biomedical application of trapezoidal rule for volume approximation 
%{
    Script that calculates the approximation of contact lens volume
    starting from real data. After importing the vectors from the .mat
    file, the volume is calculated by taking the average of the left and
    right riemann approximations.
%}



x1 = x( 2: 1: end);
x2 = x( 1: 1: end - 1);
 
% calculate delta x
 Dx = x1 - x2;

% calculate right riemann sum
 R1 = 2 * pi * sum(x1.*yFront(2:1:end).*Dx);
 R2 = 2 * pi * sum(x1.*yBack(2:1:end).*Dx);

% calculate Area from right riemann sum
 Area1 = R2 - R1;

% calculate left riemann sum
 R2 = 2 * pi * sum(x1.*yFront(1:1:end - 1).*Dx);
 R3 = 2 * pi * sum(x1.*yBack(1:1:end - 1).*Dx);
 
% calculate Area from left riemann sum
 Area2 = R3 - R2;
 
% calculate volume from trapezoidal rule
 VolumeTrapzRule = (Area1 + Area2) / 2;
 
% print out area
 disp("Volume of contact lens using trapezoidal rule: " + VolumeTrapzRule + 'mm');

% create figure and display plot
figure('Name', sprintf('Volume of contact eye: %g mm', VolumeTrapzRule), 'NumberTitle', 'off');
plot(x, yBack);
hold on
plot(x, yFront);
title('Volume of contact eye');
xlabel('length (mm)');
ylabel('height (mm)');
hold off;

