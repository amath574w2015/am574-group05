function [x,y0,tspan,Nt,flux,exact] = init(Nx)

% === Spatial Domain ===
xspan = [0 2*pi]; 
x = linspace(xspan(1), xspan(2),Nx+1).';
    x(end) = []; %periodic

% === Temporal Domain ===
tspan = [0 1.99];
Nt = 200;

% === Initial Condition ===
y0 = initcond(x);

% === Flux ===
flux = @f;

% === Exact Solution ===
exact = @exactsoln; 
end

function y0 = initcond(x)
    y0 = zeros(size(x));
    y0(x>0 & x<1) = 2;
end

function ytrue = exactsoln(x,t)
    e = exp(1);
    tstar = 2/(e^2+1);
    ytrue = zeros(size(x));
    if (t <= tstar)
        ind = (t <= x/(e^2) & t >= x-1);
        ytrue(ind)=2;
        ind = (t <= x & t >= x/(e^2));
        ytrue(ind) = log(x(ind)/t);
    else
        ind = (t <= x & t <= 2-lambertw((2-t)/(e*t))*x);
        ytrue(ind) = log(x(ind)/t);
    end
        
end