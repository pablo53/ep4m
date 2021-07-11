function [em] = epolymulti(ep, eq)
  em = [];
  if (nargin != 2)
    printf("\nepolymulti(ep, eq) - multiplies two polynomials.\n");
    printf("  ep  - encoded polynomial\n");
    printf("  eq  - encoded polynomial\n");
    printf("\n");
    printf("returns: [ ep * eq ]\n");
    return;
  endif;
  
  cp = columns(ep);
  cq = columns(eq);

  for k = 1:cp
    for l = 1:cq
      em = epolyadd(em, [ep(1, k) + eq(1, l); ep(2, k) * eq(2, l)]);
    endfor;
  endfor;
endfunction;