function [eres] = epolyproj(ep, ord)
  eres = [];
  if (nargin != 2)
    printf("\nepolyproj(ep, ord): Saves polynominal factors of the given orders.\n");
    printf("  ep  - encoded polynominal\n");
    printf("  ord - vector of orders to be saved\n");
    printf("\n");
    printf("returns: [ encoded polynominal ]\n");
    return;
  endif;
  
  for i = 1:columns(ep)
    if (ismember(ep(1, i), ord))
      eres = [ eres ep(:, i) ];
    endif;
  endfor;

endfunction
