clear; clc; close all;

% Select Problem
problem_name = 'burgers';
cd(['problems/',problem_name]);
    init
cd ../../

% Set Parmeters
h = (tspan(2) - tspan(1))/Nt;
parameters = struct('dx',dx,'f',flux);

% timestep
for i=1:Nt
    y0 = rk3(@L,y0,h,parameters);
    plot(x,y0,'.-'); 
    axis([x(1) x(end) 0 4]);drawnow;
end

% error plot
if(exist('exact','var'))
    figure(2); title('error'); xlabel('x'); ylabel('y_{exact} - y_{numerical}'); plot(y0 - exact(x,tspan(end)));
end