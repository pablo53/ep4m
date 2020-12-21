function [t, v] = eresonatorq(f0, rs, rl, q)
  if (nargin != 4)
    printf("\neresonatorq(f0, rs, rl, q): Creates parallel LC resonator with the given loaded Q.\n");
	printf("  f0     - center frequency\n");
	printf("  rs     - source impedance \n");
	printf("  rl     - load impedance \n");
	printf("  q      - loaded Q \n");
	printf("\n");
	printf("returns [ topology values ]\n");
    return;
  endif;
  t = "lc";
  c = q / (2 * pi * f0 * eii(rs, rl));
  l = eii(rs, rl) / (q * 2 * pi * f0);
  v = [ evempty() evempty() ];
  v(1, 1) = l;
  v(1, 2) = c;
endfunction