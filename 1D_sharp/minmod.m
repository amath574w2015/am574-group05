function [res] = minmod(a)
% minmod Returns minmod of vector
res= 0;
if (length(a) == abs(sum(sign(a))))
    res = sign(a(1))*min(abs(a));
end
end