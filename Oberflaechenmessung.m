a = [-56.578186 -47.651211 573.199280];
b = [-86.538605 -45.651001 588.026123];
c = [-72.812065 -74.586563 581.275269];
d = [-72.429527 -58.990536 581.037720];

v = b-a;
u = c-a;
n = cross(u, v);

E = [n, -dot(n, a)]

dot(n, b) - dot(n,a)
dot(n, c) - dot(n,a)
dot(n, d) - dot(n,a)

x = linspace(-100, 0, 2e3);
y = linspace(-80, 0, 2e3);
z = Ec(x, y, a, u, v);

[X, Y] = meshgrid(-100:0.5:0);
Z = Ec(X, Y, a, u, v);

hold on

mesh(X, Y, Z)
scatter3([a(1), b(1), c(1)], [a(2), b(2), c(2)], [a(3), b(3), c(3)])

hold off

function ec = Ec(x1, x2, a, u, v)
    n = cross(u, v);
    ec = (dot(a, n) - n(1) * x1 - n(2) * x2) / n(3);
end
