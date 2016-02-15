
% Import the LHS
temp = importdata('/nfs/adaptive/drew/chemokine/sensitivity/seasonal_hcube.txt');
hcube = temp.data;
rephcube = repmat(hcube, 3, 1);
labels = temp.colheaders;

% Initialize the matrices
n = 333;
n3 = n*3;
t = 1441;
s = (1:t)';
Y = zeros(t, n);
Y3 = zeros(t, n3);
N = zeros(1, n);
N3 = zeros(1, n3);

shuffle = [5 6 11 3 1 2 14 9 17 15 13 7 8 4 10 12 16];

% Iterate through each file of the 999 possible.  Update data if it exists
for r = 1:3
    disp(r)
    for i=1:n
        name = ['seasonal_', num2str(r), '_', num2str(i, '%0.3u'), '.hist'];
        disp(name);
        if exist(['/nfs/adaptive/drew/chemokine/sensitivity/hist/', name], 'file')
            N(i) = N(i) + 1;
            N3(n*(r-1)+i) = N3(n*(r-1)+i) + 1;
            temp = importdata(['/nfs/adaptive/drew/chemokine/sensitivity/hist/', name]);
            temp = infect(temp.data);
            Y(:, i) = Y(:, i) + temp(1:100:end);
            Y3(:, n*(r-1)+i) = Y3(:, n*(r-1)+i) + temp(1:100:end);
        end
    end
end

for i = 1:t
    Y(i,:) = Y(i,:) ./ N;
end

% Clear empty rows
m = n;
for i=0:n-1
    if N(n-i) == 0
        N(n-i) = [];
        Y(:,n-i) = [];
        hcube(n-i,:) = [];
        m = m-1;
    end
end

m3 = n3;
for i=0:n3-1
    if N3(n3-i) == 0
        N3(n3-i) = [];
        Y3(:,n3-i) = [];
        rephcube(n3-i,:) = [];
        m3 = m3-1;
    end
end

n = m;
n3 = m3;
display([n, n3])

% Rank transform the hypercube and model output
rankH = zeros(n, 17);
rankY = zeros(t, n);

rankH3 = zeros(n3, 17);
rankY3 = zeros(t, n3);

for i=1:17
    rankH(:,i) = tiedrank(hcube(:,i));
    rankH3(:,i) = tiedrank(rephcube(:,i));
end

for i = 1:t
    rankY(i,:) = tiedrank(Y(i,:));
    rankY3(i,:) = tiedrank(Y3(i,:));
end

labels = labels(shuffle);
hcube = hcube(:, shuffle);
rankH = rankH(:, shuffle);
rankH3 = rankH3(:, shuffle);

% Run PRCC
[prcc, sign, sign_label] = PRCC(rankH, rankY, s, labels, 0.05);
[prcc3, sign3, sign_label3] = PRCC(rankH3, rankY3, s, labels, 0.05);
