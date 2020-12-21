function [v] = enoisethermal(temp, r, f1, f2)
  if (nargin != 4)
    printf("\nenoisethermal(temp, r, f1, f2): Computes thermal noise.\n");
	printf("  temp - temperature in C\n");
	printf("  r    - resistance [Ohm]\n");
	printf("  f1   - lower band of the frequency\n");
	printf("  f2   - upper band of the frequency\n");
	printf("\n");
	printf("returns: noise voltage\n");
    v = NaN;
    return;
  endif;
  if (f1 == NaN)
    f1 = 0;
  end;
  b = abs(f1 - f2);
  k = temp + 273.15;
  v = sqrt(4 * eboltzman() * k * r * b);
  #f = sqrt(f1 * f2);
  #v = sqrt(4 * eplanck() * f * eboltzman() * r / (e ^ (eplanck() * f / (eboltzman() * k)) - 1));
endfunction