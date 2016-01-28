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

function error = log_rmse(data_time, data_points, fn_time, fn_points)
   
    % Intepolate the fit to match the time points of the data
    fn_values = interp1(fn_time, fn_points, data_time);
    
    sq_err = 0;
    count = 0;
    for i=1:length(data_time)
       if data_points(i) > 0 && fn_values(i) > 0
          sq_err = sq_err + (log10(data_points(i)) - log10(fn_values(i)))^2; 
          count = count+1;
       end
    end

    % Square the error values and sum them up
    error = sqrt(sq_err/count);
 