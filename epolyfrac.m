function [fr, sh, p] = epolyfrac(p)
  fr = [];
  sh = [];
  if (nargin != 1)
    printf("\npolyfrac(p): divides odd (even) part of the polynominal by even (odd) one.\n");
    printf("  p - polynominal coefficients\n");
    printf("\n");
    printf("returns: [ fractions,\n");
    printf("           shunt or parallel,\n");
    printf("           rests (numerical inadequacy) ]\n");
    return;
  endif;
  c = columns(p);
  currsh = (mod(c, 2) == 1);
  last0 = false;
  while (c >= 1)
    if (p(c) != 0)
      currfr = p(c);
      if (c > 1)
        currfr = currfr / p(c - 1);
        if (currfr < 0)
          fr = NaN;
          sh = NaN;
          return;
        else
          fr = [ fr currfr ];
          sh = [ sh currsh ];
          cc = c - 1;
          while (cc >= 1)
            p(cc + 1) = p(cc + 1) - p(cc) * currfr; 
            cc = cc - 2;
          endwhile;
        endif;
      endif;
      last0 = false;
    elseif (p(c) == 0)
      if (last0)
        fr = NaN;
        sh = NaN;
        return;
      else
        fr = [ fr p(c) ];
        sh = [ sh currsh ];
        last0 = true;
      endif;
    endif;
    c = c - 1;
    currsh = ~currsh;
  endwhile;
endfunction