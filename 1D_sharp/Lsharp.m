function Ls = Lsharp(u,params)
%L Summary of this function goes here
%   Detailed explanation goes here

% Parameters
r = 3+1;
N = length(u);
u = reshape(u,N,1);
dx = params.dx;

Ls = zeros(N,1);
fu = params.f(u);
fu_bc = [fu(end-r+1:end); fu; fu(1:r)];

%pre-allocating
fhat_l = zeros(N+3,1); 
fhat_r = zeros(N+3,1);
alp = zeros(N+3,1);

c = zeros(N+1,1);

% fhat_l(1) =  f^l_{-1/2}
for i=1:N+3
    si = i + r;
    fhat_l(i) = f_hat(fu_bc(si-4:si),'L');
    fhat_r(i) = f_hat(fu_bc(si-3:si+1),'R');
    alp(i)    = alpha(fu_bc(si-3+1:si));
end

for i=1:N+1
    sifh = i+1;
    sifbc = i+r;
    c(i) = minmod([0.5*alp(i)*minmod([fhat_r(sifh)-fhat_l(sifh),fhat_r(sifh-1)-fhat_l(sifh-1)]),...
        fu_bc(sifbc+1)-fhat_l(sifh),fhat_r(sifh)-fu_bc(sifbc-1)]);
end

for i=1:N
    si = i + 1;    
    Ls(i) = (-1/dx)*(fhat_l(si+1)-fhat_l(si))-(1/dx)*(c(i+1)-c(i));
end



end