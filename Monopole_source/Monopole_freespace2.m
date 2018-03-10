%% Monopole acoustic source in free space
% complex pressure at point in space 
 
clc
clear

f = 1000;           % Single frequency
omega = 2*pi*f;     % Angular frequency 
c = 344;            % Speed of sound
lambda = c/f;       % Wavelength
rho = 1.225;        % Density of air
k = 2*pi/lambda;    % Wave number
q = .0005;            % Volume Velocity
rx = -1.5:.01:1.5;      % Radius in x
ry = -1.5:.01:1.5;      % Radius in y
lx = length(rx);    % length of rx
ly = length(ry);    % length of ry

[X, Y] = meshgrid(rx,ry);   % Meshgrid from rx and ry
Z = sqrt(X.^2 + Y.^2);      % Distance to point from origin

t = 0:1/10000:.01;  % Time vector for visual

pz = 1j*omega*rho*q*exp(-1i*k.*Z)./(4*pi*Z);     % Pressure 

pt = exp(1i*omega.*t);  % time 


for i = 1:length(t)
    p = pz .* pt(i);
    surf(rx,ry,(real(p)),'edgecolor', 'none')
    caxis([-1 1])
    colormap('jet')
    hold on
    scatter3(0,0,10,'o','linewidth',2,'MarkerFaceColor','k','MarkerEdgeColor','k')
    hold off
    colorbar
    view(0,70)
    title(['Time = ', num2str(t(i)),' seconds'])
    pause(.001)
    xlabel('Meters'),ylabel('Meters')
end