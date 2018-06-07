function make_animation(x,y,filename,labelX,labelY,Title)
f = figure();
for m = 1:size(y,2) 
    plot(x,y(:,m));
    drawnow;
    axis([min(x) max(x) min(y(:))-0.1 max(y(:))+0.1]);
    xlabel(labelX); ylabel(labelY); title(Title);
    grid on; pause(0.01);
    % Capture the plot as an image 
    frame = getframe(f); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if m == 1 
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
        imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end
end
end