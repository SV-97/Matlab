% MATLAB Minute Seite 51
%format compact
clc % clear command window

k = 5;
A11 = gallery("tridiag", -ones(k-1, 1), 2*ones(k,1), -ones(k-1,1));
A12 = zeros(k,2);
A12(1,1) = 1;
A12(2,2) = 1;
A22 = -eye(2);
A = full([A11 A12; A12' A22])
B = full([A11 A12; zeros(2,k) -A22])

AB = A * B
BA = B * A

inv_A = inv(A)
inv_B = inv(B)
inv_A11 = inv(A11);
inv_A22 = inv(-A22);
O = zeros(size(inv_A22, 1), size(inv_A11, 2));
inv_B_two = full([
    inv_A11 (-inv_A11 * A12 * inv_A22);
    O       inv_A22])

% check that the manual calculation is correct
equal = inv_B - inv_B_two < 1e-10 * ones(size(inv_B));
all(equal(:))

