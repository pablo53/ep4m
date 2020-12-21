function fmts = efmtstr(val, unit)
  if (nargin == 0)
    printf("\nefmtstr(val[, unit]): prints formatted values with prefixes p, n, u, m, k, M, G, T...\n");
	printf("  val - value to be printed in a 'prefixed' form.\n");
	printf("  unit - (optional), units to be added to the string\n\n");
    return;
  endif;
  if (nargin < 2)
    unit = "";
  endif;
  [scval, scale] = escale(val);
  fmts = [num2str(scval, 3) scale unit];
endfunction