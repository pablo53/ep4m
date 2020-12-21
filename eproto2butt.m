function [ladder, elemvals] = eproto2butt(order, inductorfirst)
  ladder = '';
  elemvals = [];
  if (nargin != 1 && nargin != 2)
    printf("\n\n");
    printf("\neproto2butt(order[, inductorfirst]): gives a prototype Butterworth filter\n");
    printf("  order         - filter order\n");
    printf("  inductorfirst - 1 means start with inductance (default), 0 means start with capacity.\n\n");
	printf("\nreturns: [ topology values ]\n\n");
    return;
  endif;  
  if (nargin >= 2)
    capacitor = !inductorfirst;
  else
	capacitor = 0;
  endif;
  for k = 1:order
    gk = 2 * sin((2 * k - 1) * pi / (2 * order));
	elemvals = [elemvals evalues(gk)];
	if (capacitor)
	  ladder = [ladder 'c'];
	else
	  ladder = [ladder 'L'];
	endif;
	capacitor = !capacitor;
  endfor
endfunction