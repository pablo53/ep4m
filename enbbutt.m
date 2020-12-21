function [t, v] = enbbutt(f1, f2, r, order, sc)
  t = '';
  v = [];
  if (nargin != 4 && nargin != 5)
    printf("\nenbbutt(f1, f2, r, order): Creates a Butterworth narrow band pass filter of a given order.\n");
	printf("  f1    - lower frequency limit\n");
	printf("  f1    - upper frequency limit\n");
	printf("  r     - wave impedance\n");
	printf("  order - filter order\n");
	printf("  sc     - scaling vector of the same order, its first and last elements should be 1 (optional)\n");
	printf("returns: [ topology values ]\n\n");
    return;
  endif;
  if (nargin < 5)
    sc = ones(1, order);
  endif;
  
  f0 = sqrt(f1 * f2);
  for n = 1:order
    c = sc(n) * 2 * sin((2 * n - 1) * pi / (2 * order));
	[ tc, tv ] = escalefilter("c", [ c ], r, f1, f2);
	if (n > 1)
	  gm = sc(n - 1) * sc(n) / r;
	  [tg, vg] = enbimpinv(f0, gm);
	  [t, v] = ejoin(t, v, tg, vg);
	endif;
	[t, v] = ejoin(t, v, tc, tv);
  endfor;
  [t, v] = ereduce(t, v);
  
endfunction
