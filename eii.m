function ii = eii(a, b)
  if (nargin < 2)
    printf("\neii(a, b)\n");
    printf("  a - 1st shunt impedance\n");
    printf("  b - 2nd shunt impedance\n");
    return;
  endif;
  if (a == inf)
    ii = b;
  elseif (b == inf)
    ii = a;
  else
    ii = a * b / (a + b);
  endif;
endfunction