function u_np1 = rk4(L,u_n,h,params)
%RK3 Summary of this function goes here
%   Detailed explanation goes here
k1 = L(u_n,params);
k2 = L(u_n + h/2*k1,params);
k3 = L(u_n + h/2*k2,params);
k4 = L(u_n + h*k3,params);
u_np1 = u_n + (h/6)*(k1 + 2 * k2 + 2 * k3 + k4);
end