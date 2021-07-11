function [ep, eq, ed] = epolydiv(ep, eq, dir, bylowest)
  ed = [];
  if ((nargin != 3) && (nargin != 4))
    printf("\nepolydiv(ep, eq, dir[, bylowest]) - divides two polynomials.\n");
    printf("  ep       - encoded polynominal\n");
    printf("  eq       - encoded polynominal\n");
    printf("  dir      - direction (0 means ep is numerator and eq is denominator, 1 means eq is numerator and ep is denominator)\n");
    printf("  bylowest - if true, divides the lowest factors of both polynomials, if false (default) - the highest ones\n");
    printf("\n");
    printf("returns: [ ep (if denominator) or rest of it (if it was the numerator)\n");
    printf("           the rest of eq (if numerator) or eq itself (if it was the denominator)\n");
    printf("           division result]\n");
    return;
  endif;
  
  if (dir)
    num = eq;
    den = ep;
  else
    num = ep;
    den = eq;
  endif;
  if (columns(den) == 0)
    error("The denominator polynominal is degenerated.");
  elseif (columns(num) == 0)
    ed = zeros(2, 0);
  else
    if (bylowest)
      ed = [ num(1, end) - den(1, end); num(2, end) / den(2, end) ];
      ord = num(1, end);
    else
      ed = [ num(1, 1) - den(1, 1); num(2, 1) / den(2, 1) ];
      ord = num(1, 1);
    end;
    if (dir)
      eq = epolysub(num, epolymulti(den, ed));
      # for numerical stability reasons:
      eq = epolyantiproj(eq, ord);
    else
      ep = epolysub(num, epolymulti(den, ed));
      # for numerical stability reasons:
      ep = epolyantiproj(ep, ord);
    endif;
  endif;

endfunction;