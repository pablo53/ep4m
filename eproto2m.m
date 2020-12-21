function [ladder, elemvals] = eproto2m(order, m, shuntfirst)
  if (nargin < 3)
    shuntfirst = 0;
  endif;
  if (nargin < 2)
    m = 1;
  endif;
  ladder = '';
  elemvals = [];
  seriesi = m;
  shunti = (1 - m ^ 2) / m;
  shuntc = m;
  if (shunti == 0)
    shunti = nan;
    shuntelem = 'c';
  else
    shuntelem = 'b';
  endif;
  if (seriesi == 0)
    seriesi = nan;
    serieselem = ' ';
  else
    serieselem = 'L';
  endif;
  for k = 1:(order + 1)
    if (shuntfirst)
      vals = evalues(shuntc, shunti);
      if (k > 1 && k <= order)
        vals = evalues( shuntc * 2, shunti / 2);
      else
        vals = evalues(shuntc, shunti);
      endif;
      ladder = [ ladder shuntelem ];
      elemvals = [ elemvals vals ];
    elseif (serieselem != ' ')
      if (k > 1 && k <= order)
        vals = evalues(seriesi * 2);
      else
        vals = evalues(seriesi);
      endif;
      ladder = [ ladder serieselem ];
      elemvals = [ elemvals vals ];
    endif;
    shuntfirst = !shuntfirst;
  endfor
endfunction