clc

% Berechnen der Treppennormalform einer Matrix

M = [
    3 4 2.12 2.3445 4.34;
    1.5 2.1 137 14 12.34;
    2.3 -2.4 6.34 4.9999 9.22;
    5.4 2.43 7.66 6.34 7.34];

n = min(size(M));

for j = 1:n
    M(j,:) = M(j,:) / M(j,j);
    for i = j+1:n
        M(i,:) = M(i,:) - M(i,j) * M(j,:);
    end
end

for j = 2:n
    for i = 1:j-1
        M(i,:) = M(i,:) - M(i, j) * M(j,:);
    end
end

M
