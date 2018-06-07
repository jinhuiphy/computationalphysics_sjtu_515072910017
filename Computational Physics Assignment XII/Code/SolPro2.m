% % This code is meant to solve problem 2
%% Part (a-1)
% Initial value
L = 2; rho = 0.01; T = 40; dx = 0.02; dt = 0.01;
x = 0:dx:L; t = 0:dt:0.5; yt = zeros(length(x),1);
yIni = 5*sin(pi*x); yIni = yIni'; c = 1;
% Calculate
Res = Wave1DFD(t,x,yIni,yt,c);
Exact = 5*(cos(pi*c*t))'*sin(pi*x);
[X,Y] = meshgrid(x,t);
subplot(2,1,1); surfc(X,Y,Res'); colorbar; title('Displacement vs t and x');
xlabel('Position x'); ylabel('Time t'); zlabel('Displacement');
subplot(2,1,2); surfc(X,Y,abs(Exact-Res')); colorbar; title('Error vs t and x');
xlabel('Position x'); ylabel('Time t'); zlabel('Error');
%% Part (a-2)
h = figure();
filename = 'Pro2_1.gif';
dtList = 0.01:0.001:0.04;
for i=1:length(dtList)
    L = 2; rho = 0.01; T = 40; dx = 0.02; dt = dtList(i);
    courant = dx/dt;    % Courant condition value
    x = 0:dx:L; t = 0:dt:0.5; yt = zeros(length(x),1);
    yIni = 5*sin(pi*x); yIni = yIni'; c = 1;
    % Calculate
    Res = Wave1DFD(t,x,yIni,yt,c);
    Exact = 5*(cos(pi*c*t))'*sin(pi*x);
    [X,Y] = meshgrid(x,t);
    subplot(2,1,1); surfc(X,Y,Res'); colorbar; 
    title(['Displacement vs t and x, c=1, c^{''}=', num2str(courant)]);
    xlabel('Position x'); ylabel('Time t'); zlabel('Displacement');
    subplot(2,1,2); surfc(X,Y,abs(Exact-Res')); colorbar; title('Error vs t and x');
    xlabel('Position x'); ylabel('Time t'); zlabel('Error');
    % Capture the plot as an image 
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if i == 1 
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
        imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end
end
%% Part (b)
% Initial value
x0 = 0.6; k = 1000;
L = 2; rho = 0.01; T = 40; dx = 0.02; dt = 0.02;
x = 0:dx:L; t = 0:dt:3; yt = zeros(length(x),1);
yIni = exp(-k*(x-x0).^2); yIni = yIni'; c = 1;
% Calculate
Res1 = Wave1DFD(t,x,yIni,yt,c);             % Fixed end
Res2 = Wave1DFD_right_free(t,x,yIni,yt,c);  % Right free end
make_animation(x,Res1,'Pro2_b1.gif');
make_animation(x,Res2,'Pro2_b2.gif');
