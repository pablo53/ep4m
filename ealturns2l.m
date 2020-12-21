function l = ealturns2l(al, t)
  l = NaN;
  if (nargin != 2)
    printf("\nealturns2l(al, t): calculates the inductance for a core with the givel Al and number of turns.\n");
    printf("  al - the number of nH of 1 turn for the given core.\n");
    printf("  t  - number of turns.\n");
    printf("\n");
    printf("returns: inductance\n\n");
    return;
  endif;
  l = al * 1e-9 * t ^ 2;
endfunction