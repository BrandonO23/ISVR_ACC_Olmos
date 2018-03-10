%% Brightness Problem
clc
clear

for n = -.5:.01:.5


f = 1000;            % Single frequency
omega = 2*pi*f;      % Angular frequency 
c = 344;             % Speed of sound
lambda = c./f;       % Wavelength
rho = 1.225;         % Density of air
k = 2*pi./lambda;    % Wave number
Jo = .00000005;          % square modulate volume Velocity Contraint

delta = .01;
rx = -.5:delta:.5;                 % x
ry = 0:delta:.5;                  % y
[X, Y] = meshgrid(rx,ry);        % Meshgrid from rx and ry
b = [n,.2];
row = find(abs(10000000000*(rx-b(1)))<1);
col = find(abs(10000000000*(ry-b(2)))<1);

% Source positions in meters
Cs = [.1 0;
      -.1 0;
      .02 0;
      -.02 0];  
  
l = size(Cs,1);                  % Amount of Control Sources
MeshZ = cell(l,1);
green = cell(l,1);
p = zeros(length(ry),length(rx));
for i = 1:l
    MeshZ{i} = sqrt((X-Cs(i,1)).^2 + (Y-Cs(i,2)).^2);
    green{i} = 1j*omega*rho*exp(-1i*k.*MeshZ{i})./(4*pi*MeshZ{i});
    Gb(i) = green{i}(col,row);
end

lambda = Gb*Gb';
q = sqrt(Jo/lambda)*Gb';

for i = 1:l
    p = p + green{i}.*q(i);
end

surf(rx,ry,(real(p)),'edgecolor', 'none')
colormap('jet')
caxis([-1 1])
view(0,90)
colorbar
xlabel('Meters'),ylabel('Meters')
hold on
scatter3(b(1),b(2),10,'o','linewidth',2,'MarkerFaceColor','k','MarkerEdgeColor','k')
hold off
pause(.1)

end