% % This code is meant to solve problem 3
h = figure;
filename = 'Pro3.gif';
for k = 1:40
    N = 500*k;
    xCor = zeros(N,1);
    yCor = zeros(N,1);
    xCor(1) = 0;
    yCor(1) = 0;
    Rand = rand(N,1);
    for i=1:N
        if Rand(i) < 0.2
            xCor(i+1) = 0;
            yCor(i+1) = 0.25*yCor(i)-0.4;
        elseif Rand(i) < 0.86
            xCor(i+1) = 0.95*xCor(i) + 0.005*yCor(i) - 0.002;
            yCor(i+1) = -0.005*xCor(i) + 0.93*yCor(i) + 0.5;
        elseif Rand(i) < 0.93
            xCor(i+1) = 0.035*xCor(i) - 0.2*yCor(i) - 0.09;
            yCor(i+1) = 0.16*xCor(i) + 0.04*yCor(i) + 0.02;
        else
            xCor(i+1) = -0.04*xCor(i) + 0.2*yCor(i) + 0.083;
            yCor(i+1) = 0.16*xCor(i) + 0.04*yCor(i) + 0.12;
        end        
    end
    plot(xCor,yCor,'.'); grid on; drawnow;
    title(['N=', num2str(N)]);
    xlabel('X'); ylabel('Y');
    axis([-1.5 1.5 -1 8]);
    % Capture the plot as an image 
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if k == 1 
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
        imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end 
end

