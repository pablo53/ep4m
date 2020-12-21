function v = eimpc(c, f0, q)
  if (nargin == 0)
    printf("\neimpc(c, f0[, q]): calculates capacitor impedance at a given frequency: \n  c - capacity\n  f0 - frequency  \n  q - quality factor\n\n");
    return;
  endif;
  if (nargin < 3)
    q = 0;
	rez = inf;
  else
    rez = (2 * pi * f0 * c) / q;
  endif;
  imz = -1 / (2 * pi * f0 * c);
  v = eii(rez, i * imz);
endfunction