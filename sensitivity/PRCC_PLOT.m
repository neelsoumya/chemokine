%% Plot the residual of the partial regression of X (input - LHS matrix) and Y (output)
%% at column s (time points saved). PCC Coefficients are calculated on these
%% var: labels of the parameters varied in the X (as legend)
%% The Title of the plot is the Pearson correlation coefficient of the
%% transformed data, that is  the PRCC calculated on the original data.
%% The p-value is also showed in the title
%% by Simeone Marino, June 5 2007 %%

function [r, rx] = PRCC_PLOT(X,Y,s,PRCC_var,y_var)

Y = Y(s,:);
[a, k] = size(X); % Define the size of LHS matrix
Xranked = rankingN(X);
Yranked = ranking1(Y);

Z = ones(a, k, k);
r = zeros(a, k);
rx = zeros(a, k);

for i=1:k  % Loop for the whole submatrices, Zi 
    LHStemp = Xranked;
    LHStemp(:,i) = ones(1,a);
    Z(:,:,i) = LHStemp;
end
for i=1:k
    [~, ~, r(:,i)]  = regress(Yranked, Z(:,:,i));
    [~, ~, rx(:,i)] = regress(Xranked(:,i), Z(:,:,i));   
end

display = 0;
if display
    for i=1:k        
        [R, P] = corr(r(:,i), rx(:,i));
        a = ['[PRCC , p-value] = ' '[' num2str(R) ' , ' num2str(P) '].'];% ' Time point=' num2str(s-1)];   
        figure
        plot(r(:,i), rx(:,i), '.')
        title(a)
        legend(PRCC_var{i})
        xlabel(PRCC_var{i})
        ylabel(y_var)
    end
end
