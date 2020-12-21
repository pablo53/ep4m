function [p2] = epolypow(p, q)
  p2 = [ 0 ; 1 ];
  if (nargin != 2)
    printf("\nepolypow(p, q) - the q-th power of p\n");
    printf("  p - encoded polynominal (numerator)\n");
    printf("  q - nonegative integer\n");
    printf("\n");
    printf("returns: [ p ^ q ]\n");
    return;
  endif;
  
  for i = 1:q
    p2 = epolymulti(p2, p);
  endfor;

endfunction;