%% Cancellation at point in far field
clc
clear

f = 500;             % Single frequency
omega = 2*pi*f;      % Angular frequency 
c = 344;             % Speed of sound
lambda = c./f;       % Wavelength
rho = 1.225;         % Density of air
k = 2*pi./lambda;    % Wave number
q = 1;               % Volume Velocity

% To make a bit easier the field is limited to first quadrant
rx = -1:.01:1;        % Radius in x
ry = 0:.01:1;        % Radius in y
lx = length(rx);     % length of rx
ly = length(ry);     % length of ry
d = .1;              % Distance off origin
can = [.5,.5];

[X, Y] = meshgrid(rx,ry);        % Meshgrid from rx and ry
Z1 = sqrt((X+d).^2 + (Y).^2);    % Distance to point from origin
Z2 = sqrt((X-d).^2 + (Y).^2);    % Distance to point from origin


pz1 = exp(-1i*k.*Z1);        % First Pressure field 
pz2 = exp(-1i*k.*Z2);        % Second Pressure fieldPressure
pz = pz1 + pz2;              % If linear
p = pz;
surf(rx,ry,(real(p)),'edgecolor', 'none')

hold on
scatter3(0-d,0,2,'o','linewidth',2,'MarkerFaceColor','k','MarkerEdgeColor','k')
scatter3(0+d,0,2,'o','linewidth',2,'MarkerFaceColor','k','MarkerEdgeColor','k')
hold off

colormap('jet')
view(0,90)
colorbar
xlabel('Meters'),ylabel('Meters')
