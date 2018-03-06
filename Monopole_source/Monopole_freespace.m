%% Monopole acoustic source in free space
% complex pressure at point in space 
% j*omega*rho*q*(e^(-jkr))/(4*pi*r) 
 


f = 100;            % Single frequency
omega = 2*pi*f;     % Angular frequency 
c = 344;            % Speed of sound
lambda = c/f;       % Wavelength
rho = 1.225;        % Density of air
k = 2*pi/lambda;    % Wave number
q = .05;            % Volume Velocity
r = -1:.01:1;       % Radius of source
l = length(r);

t = 0:.1:3;
p = zeros(l,l,length(t));

[X, Y] = meshgrid(r);
Z = sqrt(X.^2 + Y.^2);

px = 1j*omega*rho*q*exp(-1j*k*Z)./(4*pi*Z);
time = exp(-1j*omega.*t);
for i = 1:length(t)
    p(:,:,i) = real(px.*time(i));
    surf(X,Y,p(:,:,i))
    view(0,90)
    pause(.1)
end

%%

f = 100;            % Single frequency
omega = 2*pi*f;     % Angular frequency 
c = 344;            % Speed of sound
lambda = c/f;       % Wavelength
rho = 1.225;        % Density of air
k = 2*pi/lambda;    % Wave number
q = .05;            % Volume Velocity
r = -1:.01:1;       % Radius of source

t = 0:.1:1;
px = zeros(length(r),length(r),length(t));
[X, Y] = meshgrid(r);
z  = sqrt(X.^2 + Y.^2);
e = exp(1j*omega.*t);
px(:,:, = exp(-1j*k*z)./z;
for i = 1:length(t)
    contourf(real(px(:,:,i).*t(i)))
end




