function [f_h] = f_hat(fsj)
%W Returns f_hat(x_{i+1/2}) from WENO approximation
f_h = w(fsj) * q(fsj);
%f_h = [1/10 3/5 3/10] * q(fsj);
end

function [qs]= q(fsj)
qs = zeros(3,1);
qs(1) = [2, -7, 11]/6  * fsj(1:3);
qs(2) = [-1, 5, 2]/6   * fsj(2:4);
qs(3) = [2,  5, -1]/6  * fsj(3:5);
end

function [w] = w(fsj)
%W Returns WENO weights for r=3
%   fsj - array(5x1). cooresponds to [f_{j-2}, f_{j-1}, ... f_{j+2}] 
r = (length(fsj)+1)/2;
alpha = zeros(1,r);
% Smoothness parameters
epsilon = 1e-6;
p = 2;
% Crk Coefficients
C3k = [1 6 3]/10;
S   = IS(fsj);
% Compute alpha
for i=1:r
  alpha(i) = C3k(i)/(epsilon + S(i))^p;
end  
% Compute weights
w = alpha/sum(alpha);
end

function [S] = IS(fsj)
%IS Returns smoothness indicators for r=3
%   fsj - array(5x1). cooresponds to [f_{j-2}, f_{j-1}, ... f_{j+2}]
IS1 = (13/12) * (fsj(1) - 2*fsj(2) + fsj(3))^2 + (1/4)*(fsj(1) - 4*fsj(2) + 3*fsj(3))^2;
IS2 = (13/12) * (fsj(2) - 2*fsj(3) + fsj(4))^2 + (1/4)*(fsj(2) - fsj(4))^2;
IS3 = (13/12) * (fsj(3) - 2*fsj(4) + fsj(5))^2 + (1/4)*(3*fsj(3) - 4*fsj(4) + fsj(5))^2;
S = [IS1, IS2, IS3];
end