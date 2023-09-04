function x = CallChaos(n, mapName)
    global x0;
    if isempty(x0)
        x0 = rand();
        if x0 == 0
            x0 = 0.1;
        end
    end
    
    if strcmp(mapName, 'logistic')
        x = logistic(n, 0.1, 4, x0);
    elseif strcmp(mapName, 'sinsuidal')
        x = sinsuidal(n, 0, 0, x0);
    elseif strcmp(mapName, 'Tent')
        x = Tent(n, 0, 0, x0);
    elseif strcmp(mapName, 'Singer')
        x = Singer(n, 0, 0, x0);
    elseif strcmp(mapName, 'Piecewise')
        x = Piecewise(n, 0, 0, x0);
    else
        error(['Unsupported map name: ', mapName]);
    end
    
    x0 = x(end);
end

function x = logistic(n, a, b, x0)
    x = zeros(1, n);
    x(1) = x0;
    for i = 2:n
        x(i) = a * x(i-1) * (1 - x(i-1)/b);
    end
end

function x = sinsuidal(n, a, b, x0)
    x = zeros(1, n);
    x(1) = x0;
    for i = 2:n
        x(i) = a * sin(b * pi * x(i-1));
    end
end

function x = Tent(n, a, b, x0)
    x = zeros(1, n);
    x(1) = x0;
    for i = 2:n
        if x(i-1) < 0.5
            x(i) = a * x(i-1);
        else
            x(i) = b * (1 - x(i-1));
        end
    end
end

function x = Singer(n, a, b, x0)
    x = zeros(1, n);
    x(1) = x0;
    for i = 2:n
        x(i) = a * x(i-1)^b + (1 - a) * (0.5 - 2 * x(i-1)^2 + 2 * x(i-1)^3);
    end
end

function x = Piecewise(n, a, b, x0)
    x = zeros(1, n);
    x(1) = x0;
    for i = 2:n
        if x(i-1) < 0.5
            x(i) = a * x(i-1);
        else
            x(i) = b * x(i-1) + (1 - b) * (1 - x(i-1));
        end
    end
end
