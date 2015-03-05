function u_np1 = rk3(L,u_n,h,params)
%RK3 Summary of this function goes here
%   Detailed explanation goes here
k1 = L(u_n,params);
k2 = L(u_n + h*k1,params);
k3 = L(u_n + h/4*k1 + h/4*k2,params);
u_np1 = u_n + h*( 1/6 * k1 + 1/6 * k2 + 2/3 * k3);
end

