function [ea] = epolyadd(ep, eq)
  ea = [];
  if (nargin != 2)
    printf("\nepolyadd(ep, eq) - sum of two polynomials.\n");
    printf("  ep  - encoded polynomial\n");
    printf("  eq  - encoded polynomial\n");
    printf("\n");
    printf("returns: [ ep + eq ]\n");
    return;
  endif;
  
  cq = columns(eq);
  if (columns(ep) == 0)
    ea = eq;
    return;
  elseif (cq == 0)
    ea = ep;
    return;
  endif;
  ea = ep;
  cmindeg = min(ea(1, :));
  cmaxdeg = max(ea(1, :));
  if (cq > 0)
    for i = 1:cq
      if (eq(1, i) < cmindeg)
        cmindeg = eq(1, i);
        ea = [ ea, eq(:, i) ];
      elseif (eq(1, i) > cmaxdeg)
        cmaxdeg = eq(1, i);
        ea = [ eq(:, i), ea ];
      else
        [ vm, im ] = ismember(eq(1, i), ea(1, :));
        if (im != 0)
          ea(2, im) += eq(2, i);
          if (ea(2, im) == 0)
            ea = [ ea(:, 1:(im - 1)) ea(:, (im + 1):end) ];
          endif;
        else
          im = 1;
          while ((im <= columns(ea)) && (ea(1, im) > eq(1, i)))
            im = im + 1;
          endwhile;
          ea = [ ea(:, 1:(im - 1)) eq(:, i) ea(:, im:end) ];
        endif;
      endif;
    endfor;
  endif;
endfunction;