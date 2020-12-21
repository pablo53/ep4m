function [i2] = enoiseshottky(i, f1, f2)
  if (nargin != 3)
    printf("\nenoiseshottky(i, f1, f2): Computes shot noise.\n");
	printf("  i  - direct current [A]\n");
	printf("  f1 - lower band of the frequency\n");
	printf("  f2 - upper band of the frequency\n");
	printf("\n");
	printf("returns: mean square noise current\n");
    i2 = NaN;
    return;
  endif;
  if (f1 == NaN)
    f1 = 0;
  end;
  b = abs(f1 - f2);
  i2 = 2 * eelectroncharge() * i * b;
endfunction