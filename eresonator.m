function [t, v] = eresonator(r, f0, series)
  if (nargin != 2 && nargin != 3)
    printf("\neresonator(r, f0[, series_or_q]): Creates series or parallel LC resonator.\n");
	printf("  r      - wave impedance \n");
	printf("  f0     - center frequency\n");
	printf("  series - series (if true) or parallel (if false - default)\n");
	printf("\n");
	printf("returns [ topology values ]\n");
    return;
  endif;
  if (nargin < 3)
    series = false;
  endif;
  if (series)
    t = "LC";
  else
    t = "lc";
  endif;
  c = 1 / (2 * pi * r * f0);
  l = r ^ 2 * c;
  v = [ evempty() evempty() ];
  v(1, 1) = l;
  v(1, 2) = c;
endfunction