% Bootstrapping

results = zeros(1000, 1);

% REMINDER: Set appropriate parameters in ode.m and infection.m

t = wit;
r = wir;
[row, col] = size(t);

statopts = statset('Display', 'off');

for i=1:1000
   x = log10(wi);
   for j=1:col
       x(j) = x(j) + r(ceil(rand*col));
   end
%   x = max(0, x);
   
   results(i) = nlinfit(t*60, x, 'infection', .00025, statopts);
   disp(i)
end

results = sort(results);
low = results(25);
high = results(976);
disp(low/60)
disp(high/60)

