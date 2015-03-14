clear; close all; clc

% Select Problem
problem_name = 'advection';
tic;

Nx = 200:5:225; E = zeros(size(Nx)); Dx = zeros(size(Nx));
for i=1:length(Nx)
    
    cd(['problems/',problem_name]);
    [x,y0,tspan,Nt,flux,exact] = init(Nx(i));
    
    cd ../../
    % Set Parameters
    dx = x(2)-x(1);
    
    %Nt = round((tspan(2)-tspan(1))/(dx^(5/4)));    
    Nt = 20*Nx(i);
    h = (tspan(2) - tspan(1))/Nt;
    

    cfl = h/dx
    parameters = struct('dx',dx,'f',flux);
    
    % timestep
    for j=1:Nt
        y0 = rk3(@Lsharp,y0,h,parameters);        
        plot(x,y0,'o-',x,exact(x,tspan(1)+j*h),'r');
        title(num2str(tspan(1)+j*h))
        axis([x(1) x(end) -0.1 3.1]); drawnow
    end
    
    %ind = x>2.5 & x<5;
    ind = x > 5 & x < 7; %sqrtflux
    % error plot
    if(exist('exact','var'))
        %figure(2); title('error'); xlabel('x'); ylabel('y_{exact} - y_{numerical}'); plot(y0 - exact(x,tspan(end)));
        err = y0 - exact(x,tspan(2));
        E(i) = norm(err,2)./sqrt(Nx(i)); %grid norm scaling
        Dx(i) = dx;
    end
    
end
toc
error_loglog(Dx,E);
error_table(Dx,E);

figure;
plot(x,y0,'.-',x,exact(x,tspan(2)),'r');
xlabel('x'); ylabel('u'); 
legend('WENO-5','True solution')
grid on
axis([x(1) x(end) 0 3])

cd advection
solution
cd ..
error_loglog(Dx,errclaw);