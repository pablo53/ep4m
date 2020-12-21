function [ea] = epolysub(ep, eq)
  ea = [];
  if (nargin != 2)
    printf("\nepolysub(ep, eq) - difference of two polynominals.\n");
    printf("  ep  - encoded polynominal\n");
    printf("  eq  - encoded polynominal\n");
    printf("\n");
    printf("returns: [ ep - eq ]\n");
    return;
  endif;
  ea = epolyadd(ep, [ eq(1, :); -eq(2, :) ]);
endfunction;