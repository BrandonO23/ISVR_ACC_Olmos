%% Monopole acoustic source in free space
% complex pressure at point in space 
% j*omega*rho*q*(e^(-jkr))/(4*pi*r) 
% 


f = 1000;           % Single frequency
omega = 2*pi*f;     % Angular frequency 
c = 344;            % Speed of sound
lambda = c/f;       % Wavelength
rho = 1.225;        % Density of air
% k = 2*pi/lambda   % Wave number
% q = .05           % Volume Velocity