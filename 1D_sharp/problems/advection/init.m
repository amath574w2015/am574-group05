function [x,y0,tspan,Nt,flux,exact] = init(Nx)

% === Spatial Domain ===
xspan = [-1 1]; 
x = linspace(xspan(1), xspan(2),Nx+1).';
    x(end) = []; %periodic

% === Temporal Domain ===
tspan = [0 8];
Nt = 200;


% === Exact Solution ===
exact = @exactsoln;%@(x,t) exp(sin(x-t));

% === Initial Condition ===
y0 = exact(x,0);

% === Flux ===
flux = @f;
end

function [ytrue] = exactsoln(x,t)
    ytrue = zeros(size(x))+0.1;
    ytrue(-.4+t <= x & x <= -0.2+t) = 1.1;    
end