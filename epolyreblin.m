function [pp2, pq2] = epolyreblin(pp, pq, tsam)
  pp2 = [];
  pq2 = [];
  if (nargin != 3)
    printf("\nepolyreblin(ep, eq, tsam) - bilinear transformation, i.e. puts s = 2/T * (z+1)/(z-1).\n");
    printf("  ep   - encoded polynominal (numerator)\n");
    printf("  eq   - encoded polynominal (denominator)\n");
    printf("  tsam - sampling period\n");
    printf("\n");
    printf("returns: [ ep', eq' ] (transformed and normalized: numerator and denominator)\n");
    return;
  endif;
  
  m = epolyorder(pp);
  n = epolyorder(pq);
  mn = max(m, n);
  pm = epolydecode(pp);
  pn = epolydecode(pq);
  for i = 0:m
    z = [ 0 ; pm(1, i + 1) * ((2 / tsam) ^ i) ];
    pp2 = epolyadd(pp2, epolymulti(epolymulti(z, epolypow(epolyencode([1, 1]), mn - i)), epolypow(epolyencode([-1, 1]), i)));
  endfor;
  for i = 0:n
    z = [ 0 ; pn(1, i + 1) * ((2 / tsam) ^ i) ];
    pq2 = epolyadd(pq2, epolymulti(epolymulti(z, epolypow(epolyencode([1, 1]), mn - i)), epolypow(epolyencode([-1, 1]), i)));
  endfor;
  if (epolyantiorder(pq2) != 0)
    ord = epolyantiorder(pq2);
    pq2(1, :) = pq2(1, :) .- (ord);
    pp2(1, :) = pp2(1, :) .- (ord);
  endif;
  pm2 = epolydecode(pp2);
  pn2 = epolydecode(pq2);
  if (columns(pn2) > 0)
    b0 = pn2(1, 1);
    if (b0 != 0)
      pq2 = pq2 ./ b0;
      pp2 = pp2 ./ b0;
    endif;
  endif;
  
endfunction;
 