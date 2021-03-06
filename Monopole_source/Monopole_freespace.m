%% Monopole acoustic source in free space
% complex pressure at point in space 
% j*omega*rho*q*(e^(-jkr))/(4*pi*r) 
 


f = 100;            % Single frequency
omega = 2*pi*f;     % Angular frequency 
c = 344;            % Speed of sound
lambda = c/f;       % Wavelength
rho = 1.225;        % Density of air
k = 2*pi/lambda;    % Wave number
q = 1;              % Volume Velocity
r = -1:.01:1;       % Radius of source
l = length(r);

[X, Y] = meshgrid(r);
Z = sqrt(X.^2 + Y.^2);
p = 1j*omega*rho*q*exp(-1j*k*Z)./(4*pi*Z);

pp = 20.*log10(abs(p));

contourf(pp)

