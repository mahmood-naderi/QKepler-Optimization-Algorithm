% Random Walk

nsteps = 100;

x(1) = 0.0;
y(1) = 0.0;

lambda = 6; % Mean free path

for steps = 1:nsteps
    theta = 2 * pi * rand();
    r = lambda * log(rand());
    dx = r * cos(theta);
    dy = r * sin(theta);

    y(i + 1) = y(i) + dy;
    x(i + 1) = x(i) + dx;



end

plot(x, y, '-r');