function [ea] = epolysub(ep, eq)
  ea = [];
  if (nargin != 2)
    printf("\nepolysub(ep, eq) - difference of two polynomials.\n");
    printf("  ep  - encoded polynomial\n");
    printf("  eq  - encoded polynomial\n");
    printf("\n");
    printf("returns: [ ep - eq ]\n");
    return;
  endif;
  ea = epolyadd(ep, [ eq(1, :); -eq(2, :) ]);
endfunction;