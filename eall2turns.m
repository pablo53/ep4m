function t = eall2turns(al, l)
  t = NaN;
  if (nargin != 2)
    printf("\neall2turns(al, l): calculates the number of turns on a core with the givel Al and required inductance.\n");
    printf("  al - the number of nH of 1 turn for the given core.\n");
    printf("  l  - required inductance.\n");
    printf("\n");
    printf("returns: number of turns\n\n");
    return;
  endif;
  t = sqrt(l / (al * 1e-9));
endfunction