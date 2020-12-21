function l = eprtcoil(d, w, cl, n, shape)
  if (nargin != 4 && nargin != 5)
    printf("\neprtcoil(d, w, cl, n[, shape]): Approximated inductance of a printed coil.\n");
	printf("  d     - inner diameter,\n");
	printf("  w     - the printed path width,\n");
	printf("  cl    - inter path clearance,\n");
	printf("  n     - the number of \"turns\",\n");
	printf("  shape - outer shape: \"circular\" (default), \"square\", \"hexagon\", \"octagon\".\n");
	printf("\n");
	printf("returns: inductance [H]\n");
	return;
  endif;
  if (nargin < 5)
    shape = "circular";
  endif;

  if (strcmpi(shape, "circular"))
#    shfac = 1.0;
    k1 = 2.25;
    k2 = 3.55;
  elseif (strcmpi(shape, "square"))
    k1 = 2.34;
    k2 = 3.75;
  elseif (strcmpi(shape, "hexagon"))
    k1 = 2.33;
    k2 = 3.82;
  elseif (strcmpi(shape, "octagon"))
#    shfac = 1.1;
    k1 = 2.25;
    k2 = 3.55;
  else
    error("Incorrect shape.");
  endif;
  
#  c = n * (w + cl)
#  dm = shfac * (c + d)
#  k1 = c / dm
#  k2 = (w + cl) / w
  dout = d + n * (w + cl);
  davg = (d + dout) / 2;
  rho = (dout - d) / (dout + d);
  
#  l = n * dm * (n * k1 + k2) / 10000;
  l = k1 * emu0() * (n ^ 2) * davg / (1 + k2 * rho);
endfunction