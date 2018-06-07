% This code is meant to solve problem 1
clear;
%% Part (a)
% Initial Value
delta_square = 0.001; dx = 5e-3; dt = 5e-7; x0 = 0.4; C = 1;
phi = @(x) exp(-(x-x0).^2/delta_square);
x = 0:dx:1; x = x'; N = length(x);
t = 0:dt:1;
% Square barrier
V = zeros(N,1); 
% Initial wave packet
B(:,1) = phi(x);
% Construct hamitonian matrix
e1 = ones(N,1);
A = spdiags([e1/2, 2i-e1-V, e1/2],[1, 0, -1], N, N);
% Periodic BC
A(1,end) = 1; A(end,1) =1;
% Iterator
f = figure(); filename = 'Pro1_a1.gif';
for i=1:200
    plot(x,abs(B(:,i)).^2/norm(B(:,i)).^2);
    axis([0 1 0 0.16]); grid on;
    title(['N = ', num2str(i)]);
    xlabel('Position x'); ylabel('\phi(x,t)^{2}');
    % Capture the plot as an image 
    frame = getframe(f); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if i == 1 
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
        imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end
    pause(0.1);   
    B(:,i+1) = 4i*(A\B(:,i)); - B(:,i);
end
%% Part (b)
% Initial Value
delta_square = 1e-3; dx = 5e-3; dt = 5e-7; x0 = 0.4; k0 = 20000;
x = 0:dx:1; x = x'; N = length(x);
t = 0:dt:1;
% Initial wave packet
B(:,1) = exp(1i*k0*x).*exp(-(x-x0).^2/delta_square);
% Square barrier
V = zeros(N,1); 
% Construct hamitonian matrix
e1 = ones(N,1);
A = spdiags([e1/2, 2i-e1-V, e1/2],[1, 0, -1], N, N);
% Periodic BC
A(1,end) = 1; A(end,1) =1;
% Iterator
for i=1:200
    B(:,i+1) = 4i*(A\B(:,i)) - B(:,i);
end
make_animation(x,real(B),'Pro1_b1.gif','x','RealPart','RealPart vs x');
make_animation(x,imag(B),'Pro1_b2.gif','x','ImagePart','ImagePart vs x');
%% Part (c)
% Initial Value
delta_square = 1e-3; dx = 5e-3; dt = 5e-7; x0 = 0.4; k0 = 700;
x = 0:dx:1; x = x'; N = length(x);
t = 0:dt:1;
% Initial wave packet
B(:,1) = exp(1i*k0*x).*exp(-(x-x0).^2/delta_square);
% Square barrier
V = zeros(N,1); index = 0.6 / dx;
V(index:end,1) = -1e6;
% Construct hamitonian matrix
e1 = ones(N,1);
A = spdiags([e1/2, 2i-e1-V, e1/2],[1, 0, -1], N, N);
% Periodic BC
A(1,end) = 1; A(end,1) =1;
% Iterator
for i=1:200
    plot(x,abs(B(:,i)).^2/norm(B(:,i)).^2,x,V);
    xlabel('Position x'); ylabel('\phi(x,t)^{2}'); grid on;
    B(:,i+1) = 4i*(A\B(:,i)) - B(:,i);
    pause(0.1);
end
%% Part (d)
% Initial Value
delta_square = 1e-3; dx = 5e-3; dt = 5e-7; x0 = 0.4; k0 = 500;
x = 0:dx:1; x = x'; N = length(x);
t = 0:dt:10;
% Initial wave packet
B(:,1) = exp(1i*k0*x).*exp(-(x-x0).^2/delta_square);
% Square barrier
V = zeros(N,1); index = 0.5 / dx;
V(index:end,1) = 10*(x(index:end)-0.5);
% Construct hamitonian matrix
e1 = ones(N,1);
A = spdiags([e1/2, 2i-e1-V, e1/2],[1, 0, -1], N, N);
% Periodic BC
A(1,end) = 1; A(end,1) =1;
% Iterator
f = figure(); filename = 'Pro1_d.gif';
for i=1:500
    plot(x,abs(B(:,i)).^2/norm(B(:,i)).^2,x,V);
    xlabel('Position x'); ylabel('\phi(x,t)^{2}'); grid on;
    axis([0 1 0 0.18]);
    % Capture the plot as an image 
    frame = getframe(f); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if i == 1 
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
        imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end
    B(:,i+1) = 4i*(A\B(:,i)) - B(:,i);
    pause(0.1);
end
%% Part (e)
% Initial Value
delta_square = 1e-3; dx = 5e-3; dt = 5e-7; x0 = 0.4; k0 = 90;
x = 0:dx:3; x = x'; N = length(x);
t = 0:dt:1;
% Initial wave packet
B(:,1) = exp(1i*k0*x).*exp(-(x-x0).^2/delta_square);
% Square barrier
V = zeros(N,1);
ind1 = 1 / dx; ind2 = 1.05 / dx; V(ind1:ind2,1) = 4*k0^2;
ind1 = 1.5 / dx; ind2 = 1.55 / dx; V(ind1:ind2,1) = 6*k0^2;
% Construct hamitonian matrix
A = diag(-2*ones(N,1));
A = A + diag(1*ones(N-1,1),1);
A = A + diag(1*ones(N-1,1), -1);
A = 1/delta_square^2 * A; H = -0.5*A + V; 
A = 2i*eye(length(H)) - delta_square * H;
% Iterator
f = figure(); filename = ['Pro1_e_', num2str(k0), '.gif'];
for i=1:250
    plot(x,abs(B(:,i)).^2/norm(B(:,i)).^2,x,V);
    xlabel('Position x'); ylabel('\phi(x,t)^{2}'); 
    title(['k_{0} = ', num2str(k0)]); grid on;
    axis([0 3 0 0.1]);
    % Capture the plot as an image 
    frame = getframe(f); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if i == 1 
        imwrite(imind,cm,filename,'gif', 'DelayTime', 0.05,'Loopcount',inf); 
    else 
        imwrite(imind,cm,filename,'gif','DelayTime', 0.05,'WriteMode','append'); 
    end
    B(:,i+1) = 4i*(A\B(:,i)) - B(:,i);
end

