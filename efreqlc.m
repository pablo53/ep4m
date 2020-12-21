function [f, z] = efreqlc(l, c)
  if (nargin != 2)
    printf("\nefreqlc(l, c): Calculates the frequency and the characteristic impedance of an LC tank.\n");
	printf("  l - inductance\n");
	printf("  c - capacitance\n");
	printf("\n");
	printf("returns: [ frequency, impedance ]\n");
    return;
  endif;

  f = 1 / (2 * pi * sqrt(l * c));
  z = sqrt(l / c);
  
endfunction