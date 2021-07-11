function p = epolydecode(ep)
  p = zeros(1, 0);
  if (nargin != 1)
    printf("\nepolydecode(p) - decodes a polynomial.\n");
    printf("  p     - polynomial to be decoded\n");
    printf("\n");
    printf("returns: [ decoded polynomial ]\n");
    return;
  endif;
  if (columns(ep) == 0)
    return;
  endif;
  
  mindeg = min(ep(1, :));
  if (mindeg < 0)
    error("Cennot decode a general polynomial with an element of negative degree.");
  endif;
  maxdeg = max(ep(1, :));
  p = zeros(1, 1 + maxdeg);
  ec = columns(ep);
  for i = 1:ec
    p(1 + ep(1, i)) = ep(2, i);
  endfor;
endfunction