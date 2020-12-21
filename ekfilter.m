function [t, v] = ekfilter(r, f, m, upper)
  if (nargin != 3 && nargin != 4)
    printf("\nekfilter(r, f, m[, upper]): Const-k type, m-derivative filter.\n");
	printf("  r     - image impedance\n");
	printf("  f     - cut off frequency\n");
	printf("  m     - m-parameter (Zobel's parameter, value of 1.0 reduces the filter to a mere k-type one),\n");
	printf("  upper - upper pass (if true) or lower pass filter (if false, default).\n");
	printf("\n");
	printf("returns [ ladder topology\n");
	printf("          element values ]\n");
	return;
  endif;
  if (nargin < 4)
    upper = false;
  endif;
  
  l = r / (2 * pi * f);
  c = 1 / (2 * pi * f * r);
  if (upper)
    z = 1 / c;
    y = 1 / l;
  else
    z = l;
    y = c;
  endif;
  z1 = z * m;
  z2 = z * (1 - m ^ 2) / m;
  y2 = y * m;
  if (z2 != 0)
    if (upper)
      t = "Cb";
      v = [ evalues(1 / z1) evalues(1 / z2, 1 / y2) ];
    else
      t = "Lb";
      v = [ evalues(z1) evalues(y2, z2) ];
    endif;
  else
    if (upper)
      t = "Cl";
      v = [ evalues(1 / z1) evalues(1 / y2) ];
    else
      t = "Lc";
      v = [ evalues(z1) evalues(y2) ];
    endif;
  endif;
  if (upper)
    f1 = f;
    f2 = NaN;
  else
    f1 = NaN;
    f2 = f;
  endif;
endfunction