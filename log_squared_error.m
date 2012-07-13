% log_squared_error(data_time, data_points, fn_time, fn_points)
%   Calculates the log squared error between a set of data points and a
% series of points representing a function output.
%
% Inputs:
%   data_time   - A 1D array containing the time points of the data
%   data_points - A 1D array of the data values
%   fit_time    - A 1D array of the time points for the function output
%   fit_points  - A 1D array of the function values
% Output:
%   log_error = the sum of the squared residuals of the log data vs. 
%     the log of the function

function log_error = log_squared_error(data_time, data_points, fn_time, fn_points)

    % Intepolate the fit to match the time points of the data
    fn_values = interp1(fn_time, fn_points, data_time);
    
    % Square the error values and sum them up
    log_error = sum((log10(fn_values) - log10(data_points)).^2);