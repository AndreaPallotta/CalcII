load('pvOutput.mat');

diary on;
% name: Andrea Pallotta
% date: 12/06/2019
% email: ap4534@rit.edu

% draw and show graph
% @param: timeIndex (x-values)
% @param: PVoutput (y-values)
 scatter(timeIndex, PVoutput, 'Marker', 's', 'MarkerEdgeColor', 'y', 'MarkerFaceColor', 'r')

% convert days to seconds
time = timeIndex * 86400;

% convert kilowatt to joules
PV_joules = PVoutput/1000;

% execute trapezoidal function
% to approximate the integral
answer = trapz(timeIndex, PVoutput);

% print out the answer
disp("Energy approximation: " + answer + " joules/second");
disp("--------------");

% calculate lightbulb energy time
LightBulb = answer / 60;

% print out the answer 
disp("It can generate light for: " + LightBulb + " seconds");

diary off;


