function [ladder, elemvals] = eproto2cheb1(order, rippledb, inductorfirst)
  ladder = '';
  elemvals = [];
  if (nargin < 2)
    printf("\n\n");
    printf("\neproto2cheb1(order, rippledb[, inductorfirst]): gives a prototype Chebyshev filter\n");
    printf("  order         - filter order\n");
    printf("  rippledb      - max ripple in passband\n");
    printf("  inductorfirst - 1 means start with inductance, 0 means start with capacity.\n\n");
	printf("\nreturns: [ topology values ]\n\n");
    return;
  endif;
  if (nargin >= 3)
    capacitor = !inductorfirst;
  else
	capacitor = 0;
  endif;
  beta = log(coth(rippledb/17.37));
  gamma = sinh(beta / (2 * order));
  gk = 1;
  ak = 1;
  bk = gamma;
  for k = 1:order
    ak1 = ak;
	bk1 = bk;
	gk1 = gk;
    ak = 2 * sin((2 * k - 1) * pi / (2 * order));
	bk = gamma ^ 2 + sin(k * pi / order) ^ 2;
	gk = ak1 * ak / (bk1 * gk1);
	elemvals = [elemvals evalues(gk)];
	if (capacitor)
	  ladder = [ladder 'c'];
	else
	  ladder = [ladder 'L'];
	endif;
	capacitor = !capacitor;
  endfor
endfunction