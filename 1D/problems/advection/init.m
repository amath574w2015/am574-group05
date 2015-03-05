% === Spatial Domain ===
xspan = [0 2*pi]; 
Nx = 200;
x = linspace(xspan(1), xspan(2),Nx+1).';
    x(end) = [];
dx = x(2) - x(1);

% === Temporal Domain ===
tspan = [0 2];
Nt = 200;

% === Initial Condition ===
y0 = exp(sin(x));

% === Flux ===
flux = @f;

% === Exact Solution ===
exact = @(x,t) exp(sin(x - t)); 