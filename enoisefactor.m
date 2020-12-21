function [nfdb, gfdb] = enoisefactor(fdb, gdb)
  if (nargin != 2)
    printf("\nenoisefactor(f, g): calculates noise factor of the entire chain.\n");
	printf("  fdb - noise factor of each stage in dB (vector)\n")
	printf("  gdb - gain of each stage in dB (vector)\n")
	printf("\n");
	printf("returns: noise factor in dB\n");
	return;
  endif;
  if (size(fdb, 2) != size(gdb, 2))
    error("Both vectors must be of the same size!");
  endif;
  
  f = 10 .^ (fdb / 10);
  g = 10 .^ (gdb / 10);
  nf = 1;
  gf = 1;
  n = size(f, 2);
  for k = 1:n
    nf = nf + (f(k) - 1) / gf;
	gf = gf * g(k);
  endfor;
  
  nfdb = 10 * log10(nf);
  gfdb = 10 * log10(gf);
endfunction