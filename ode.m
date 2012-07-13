function dx = ode(t, x, lag)
    
    global IP10 RANTES;

    ylag1 = lag(:,1);
    ylag2 = lag(:,2);
    ylag3 = lag(:,3);
    ylag4 = lag(:,4);
    ylag5 = lag(:,5);

     % Avian
%    B = 8.82931e-9;
%    X = .001001;
%    P = .0032662;
%    E = 1e-8;
%    Y = .0231;


    % Seasonal
%    B = 1.013e-8;
%    X = .001;
%    P = .0227;
%    E = 1.6174e-6;
%    Y = .0231;    

    % Swine
    B = 4.555e-8;
    X = .001;
    P = .304882;
    E = .00344675;
    Y = .0231;    

    dx = zeros(7, 1);

  	dx(1) = -B * x(1) * x(4);
	dx(2) = B * x(1) * x(4) - B * ylag1(1) * ylag2(4);
	dx(3) = B * ylag1(1) * ylag2(4) - X * x(3);
	dx(4) = P * x(3) / (1 + E * x(5)) - B * x(1) * x(4);
    dx(5) = ylag3(2);
    dx(6) = IP10 * ylag4(2) - Y * x(6);
	dx(7) = RANTES * ylag5(2) - Y * x(7);
end
