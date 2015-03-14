function [ a ] = alpha(f)
%ALPHA Summary of this function goes here
%   Detailed explanation goes here

a = 33*(abs(f(1)-2*f(2)+f(3))/(abs(f(3)-f(2))+abs(f(2)-f(1))))^2;
end