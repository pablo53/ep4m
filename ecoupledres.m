function [t, v] = ecoupledres(r, f0, k, order)
  t = [];
  v = [];
  if ((nargin != 3) && (nargin != 4))
    printf("\necoupledres(r, f0, k[, order}): Creates a ladder of coupled resonators.\n\n");
	printf("  r     - charactristic impedance\n");
	printf("  f0    - resonant frequency(-ies), providing more than one value implies order which, in turn, must not be provided explicitly\n");
	printf("  k     - coupling factor ( > 1 for overcoupling and <1 for undercoupling)\n");
	printf("  order - the number of resonators (optional) - used when one frequency is provided only\n");
	printf("\n");
	printf("returns: [ ladder topology\n");
	printf("           element values ].\n\n");
	return;
  endif;
  if ((nargin < 4) && (columns(f0) > 1))
    for l = 1:columns(f0)
	  [tres, vres] = eresonator(r, f0(l), false);
	  if (l > 1)
	    vcpl = evempty();
		vcpl(1, 1) = sqrt(vres(1, 2) * c) * k;
		tcpl = "C";
	    [t, v] = ejoin(t, v, tcpl, vcpl);
	  endif;
	  [t, v] = ejoin(t, v, tres, vres);
	  c = vres(1, 2);
	endfor;
  elseif ((nargin >= 4) && (columns(f0) == 1) && (order > 1))
    f = [];
	f(1:order) = f0;
    [t, v] = ecoupledres(r, f, k);
  elseif ((nargin >= 4) && (columns(f0) == 1) && (order == 1))
    [t, v] = eresonator(r, f0, false);
  else
     error("Invalid parameters.");
  endif;
  
endfunction