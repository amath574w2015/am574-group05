function [x,y0,tspan,Nt,flux,exact] = init(Nx)

% === Spatial Domain ===
xspan = [-1 10]; 
x = linspace(xspan(1), xspan(2),Nx+1).';
    x(end) = []; %periodic

% === Temporal Domain ===
tspan = [0 12];
Nt = 200;

% === Initial Condition ===
y0 = initcond(x);

% === Flux ===
flux = @f;

% === Exact Solution ===
exact = @exactsoln; 
end

function y0 = initcond(x)
    y0 = ones(size(x));
    y0(x>0 & x<1) = 4;
end

function ytrue = exactsoln(x,t)
    ytrue = ones(size(x));
    ind = (t <= 3*x & t >=4*(x-1));
    ytrue(ind)=4;
    ind = (t <= 4*(x-1) & t >= 2*(x-1));
    ytrue(ind) = (t./(2*(x(ind)-1))).^2;
        
end