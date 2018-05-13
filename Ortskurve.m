R = 14.1;
L = 53.5e-3;
C = 66e-6;
f = linspace(0,20000,50000);
omega = 2*pi*f;

Y = calc_Y(R,L,C,omega);
Z = calc_Z(R,L,C,omega);
%Z = 1./Y;
ax1 = subplot(2,1,1);
plot(ax1, real(Y),imag(Y));
xlabel(ax1,"Realteil");
ylabel(ax1,"Imaginärteil");
title(ax1,"Y");
ax2 = subplot(2,1,2);
plot(ax2,real(Z),imag(Z));
xlabel(ax2,"Realteil");
ylabel(ax2,"Imaginärteil");
title(ax2,"Z");

function [Y] = calc_Y(R,L,C,omega)
    re = R ./ ( R.^2 +(omega .* L) .^2 );
    im = omega .*C - ( omega .* L ) ./ ( R .^2 .* (omega.*L).^2 );
    %Y = (re-im.*1j)./(re.^2+im.^2);
    Y = re+im*1j;
end

function [Z] = calc_Z(R,L,C,omega)
    re = (R ./ ( R .^2 + ( omega .* L).^ 2))./((R./(R .^2 + ( omega .* L).^2 )).^2 + (omega .* C - (omega .* L) ./ (R .^ 2+(omega .* L) .^ 2)) .^ 2);
    im = (omega .* C - (omega.*L)./(R.^ 2+(omega .* L) .^ 2)) ./ ((R ./ (R .^ 2 + ( omega .* L) .^ 2)) .^ 2 + (omega.*C - (omega.*L)./(R .^ 2+(omega.*L) .^ 2)) .^ 2);
    Z = re+im*1j;
end