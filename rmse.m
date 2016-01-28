% rmse(data_time, data_points, fn_time, fn_points)
%   Calculates the root mean squared error between a set of data points and 
% a series of points representing a function output.
%
% Inputs:
%   data_time   - A 1D array containing the time points of the data
%   data_points - A 1D array of the data values
%   fit_time    - A 1D array of the time points for the function output
%   fit_points  - A 1D array of the function values
% Output:
%   error = the root mean squared error of the data vs. the function

function error = rmse(data_time, data_points, fn_time, fn_points)
   
    sq_err = squared_error(data_time, data_points, fn_time, fn_points);

    error = sqrt(sq_err/length(data_time));
 