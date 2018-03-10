%% Cancellation at point in far field
clc
clear

for f = 50:50:5000
omega = 2*pi*f;      % Angular frequency 
c = 344;             % Speed of sound
lambda = c./f;       % Wavelength
rho = 1.225;         % Density of air
k = 2*pi./lambda;    % Wave number
qp = .0005;          % Volume Velocity

delta = .01;
rx = -2:delta:2;                 % Radius in x
ry = 0:delta:2;                  % Radius in y
[X, Y] = meshgrid(rx,ry);        % Meshgrid from rx and ry

% Source positions in meters
Cs = [-.2 0;
      .1 0;
      -.1 0;
      .2 0];  
  
l = size(Cs,1);                  % Amount of Control Sources
MeshZ = cell(l,1);
green = cell(l,1);
q = [.0001,.0001,.0001,.0001];
p = zeros(length(ry),length(rx));

for i = 1:l
    MeshZ{i} = sqrt((X-Cs(i,1)).^2 + (Y-Cs(i,2)).^2);
    green{i} = 1j*omega*rho*exp(-1i*k.*MeshZ{i})./(4*pi*MeshZ{i});
    p = p + green{i}*q(i);
end

surf(rx,ry,(abs(p)),'edgecolor', 'none')
colormap('jet')
caxis([-1 1])
view(0,90)
colorbar
xlabel('Meters'),ylabel('Meters')
pause(.1)
end