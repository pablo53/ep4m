function ep = epolyencode(p)
  ep = zeros(2, 0);
  if (nargin != 1)
    printf("\nepolyencode(p) - encodes a polynomial.\n");
    printf("  p     - polynomial to be encoded\n");
    printf("\n");
    printf("returns: [ encoded polynomial ]\n");
    return;
  endif;
  
  c = columns(p);
  for i = 1:c
    if (p(i) != 0)
      ep = [ [ i - 1; p(i) ], ep ];
    endif;
  endfor;
endfunction