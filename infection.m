% infection.m
%   Returns expected infection values given a set of time points and
%     coefficients
% Inputs:
%   a - List of free parameter values
%   x - List of time points of interest
% Output:
%   y - A list of expected number of infected people for each time
%       point in 'x'.
function y = infection(a, timepoints)

% Define beta and delta as globals so we can pass the values into the
% 'sir' function.
global IP10 RANTES;
IP10 = a(1);
%RANTES = a(1);

% Solve our model.  The initial population was 50,000 healthy
% individuals and one infected person. Run the model until the
% last time point we are concerned about.
% (we are assuming x is ordered).

options = ddeset('InitialY', [1e6 0 0 1e4 0 0 0]);

sol = dde23('ode', [600 600 1292.28 480 960], [0 0 0 0 0 0 0], [0 2880], options); % Avian
%sol = dde23('ode', [600 600 1416.73 480 960], [0 0 0 0 0 0 0], [0 2880], options); % Seasonal
%sol = dde23('ode', [600 600 1262.99 480 960], [0 0 0 0 0 0 0], [0 2880], options); % Swine

% Recall that we are interested only in the infected population.
% We will use the built-in interpolation function interp1 to get
% values of infected people at that correspond to the proper time
% points.

y = interp1(sol.x, log10(sol.y(6,:)), timepoints); % IP10
%y = interp1(sol.x, log10(sol.y(7,:)), timepoints);  % RANTES
