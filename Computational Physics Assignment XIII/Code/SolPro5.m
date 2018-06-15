% % This code is meant to solve problem 5
%% Part (a)
Nlist = [1e1,1e2,1e3,1e4,1e5,1e6];
for j=1:length(Nlist)
    % Set up
    f = figure(j); filename = 'Pro5_a.gif';
    N = Nlist(j); t = 1:1e4; n = N;
    r = rand(size(t));
    for i=1:length(t)-1
        if r(t(i)) <= n(i)/N
            n(i+1) = n(i)-1;
        else
            n(i+1) = n(i)+1;
        end
    end
    exact = (N/2)*(1+exp(-2*t/N));  % Exact value
    plot(t, n, t, exact); title(['N = ', num2str(N)]); grid on;
    xlabel("t"); ylabel("n(t)"); legend("Simulation", "Exact");
    % Capture the plot as an image 
    frame = getframe(f); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if j == 1 
        imwrite(imind,cm,filename,'gif', 'DelayTime', 1,'Loopcount',inf); 
    else 
        imwrite(imind,cm,filename,'gif','DelayTime', 1,'WriteMode','append'); 
    end
end
%% Part (b)
NList = [8,16,64,400,800,3600];
iList = zeros(size(NList));
for j=1:length(Nlist)
    N = NList(j); n = N; i = 1; trial = zeros(30,1);
    for k=1:length(trial)
        while (n(i) ~= N/2)
            r = rand();
            if r <= n(i)/N
                n(i+1) = n(i)-1;
            else
                n(i+1) = n(i)+1;
            end
            i = i+1;
        end
        trial(k) = i;
    end
    iList(j) = mean(trial);
end
plot(NList, iList, '-o'); xlabel('N'); ylabel('Iterator time'); grid on;
%% Part (c)
NList = [8,16,64,400,800,1600,3600,7200];
dn2List = zeros(size(NList));
flu = zeros(size(NList));
for j=1:length(Nlist)
    N = NList(j); n = N/2; i = 1;
    for i=1:1e6
        r = rand();
        if r <= n(i)/N
            n(i+1) = n(i)-1;
        else
            n(i+1) = n(i)+1;
        end
    end
    dn2List(j) = mean(n.^2) - (mean(n))^2;
    flu(j) = sqrt(dn2List(j)) / mean(n);
end
subplot(1,2,1);
plot(NList, flu, '-o'); grid on;
xlabel('N'); ylabel('$\Delta n / \langle n\rangle$','interpreter','latex'); 
subplot(1,2,2);
plot(1./sqrt(NList), flu, '-o'); grid on;
xlabel('$1/\sqrt{N}$', 'interpreter', 'latex'); 
ylabel('$\Delta n / \langle n\rangle$','interpreter','latex');

