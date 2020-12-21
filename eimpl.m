function v = eimpl(l, f0, q)
  if (nargin == 0)
    printf("\neimpl(l, f0[, q]): calculates inductor impedance at a given frequency: \n  l - inductance\n  f0 - frequency  \n  q - quality factor\n\n");
    return;
  endif;
  if (nargin < 3)
    q = inf;
	rez = 0;
  else
    rez = (2 * pi * f0 * l) / q;
  endif;
  imz = 2 * pi * f0 * l;
  v = rez + i * imz;
endfunction