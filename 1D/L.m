function Ls = L(u,params)
%L Summary of this function goes here
%   Detailed explanation goes here

% Parameters
r = 3;
N = length(u);
u = reshape(u,N,1);
dx = params.dx;

Ls = zeros(N,1);
fu = params.f(u);
fu_bc = [fu(end-r+1:end); fu; fu(1:r)];

for i=1:N
    si = i + r;
    Ls(i) = (1/dx)*(f_hat(fu_bc(si-3:si+1)) - f_hat(fu_bc(si-2:si+2)));
end

% Approved By: Krithika Manohar Friday

end