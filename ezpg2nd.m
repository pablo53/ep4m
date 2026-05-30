function [numerator, denominator] = ezpg2nd(z, p, g)
  numerator = [0; 1];
  denominator = [0; 1];
  if (nargin != 3)
    printf("zpg2nd(z, p, g): numerator and denominator polynomials for given:\n");
    printf("  z - zeros\n");
    printf("  p - poles\n");
    printf("  g - gain\n");
    return;
  endif;
  
  for i = 1:length(z)
    numerator = epolymulti(numerator, [0 1; -z(i) 1]);
  endfor;
  numerator(2,:) = numerator(2,:) * g;
  for i = 1:length(p)
    denominator = epolymulti(denominator, [0 1; -p(i) 1]);
  endfor;
endfunction
