function [ladder, vals, q] = eimpmatch(rin, rout, f, lower)
  if (nargin != 3 && nargin != 4)
    printf("\neimpmatch(rin, rout, f[, lower]): produces LC impedance mathing topology.\n");
	printf("  rin   - input impedance\n");
	printf("  rout  - output impedance\n");
	printf("  f     - frequency at which to match above impedances\n")
	printf("  lower - if true (default), series inductance first then shunt capacitance,\n");
	printf("          otherwise - series capacitance first, then shunt inductance\n");
	printf("\n");
	printf("returns: [ topology,\n");
	printf("           topology values,\n");
	printf("           quality factor]\n");
    return;
  endif;
  
  if (nargin < 4)
    lower = 1;
  endif;
  if (rin > rout)
    [t, v, q] = eimpmatch(rout, rin, f, lower);
	ladder = fliplr(t);
	vals = fliplr(v);
  elseif (columns(lower) == 1)
    q = sqrt(rout/rin - 1);
	xs = rin * q;
	xp = rout / q;
    if (lower)
	  ladder = "Lc";
	  vals = [ evalues(xs / (2 * pi * f)) evalues(1 / (xp * 2 * pi * f)) ];
	else
	  ladder = "Cl";
	  vals = [ evalues(1 / (xs * 2 * pi * f)) evalues(xp / (2 * pi * f)) ];
	endif;
  else
    n = columns(lower);
	ladder = "";
	vals = [];
    for k = 1:n
	  rs = rin * power(rout / rin, (k - 1) / (n + 1));
	  rl = rin * power(rout / rin, (k + 1) / (n + 1));
	  [t, v, q] = eimpmatch(rs, rl, f, lower(k));
	  ladder = [ladder t];
	  vals = [vals v];
	endfor;
	[ladder, vals] = ereduce(ladder, vals);
  endif;
endfunction