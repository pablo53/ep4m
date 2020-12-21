function [ladder, vals] = eimpmatchcheb(rin, rout, f0, rippledb, order)
  ladder = [];
  vals = [];
  if (nargin != 5)
    printf("\neimpmatchcheb(rin, rout, f0, rippledb, order): produces LC ladder impedance matching topology as a Chebyshev Low-Pass Filter.\n");
	printf("  rin      - input impedance\n");
	printf("  rout     - output impedance\n");
	printf("  f        - frequency at which to match above impedances\n")
	printf("  rippledb - max. ripple in pass band [dB]");
	printf("  order    - number of LC pairs\n");
	printf("\n");
	printf("returns: [ topology,\n");
	printf("           topology values]\n");
    return;
  endif;
  
  epsln = sqrt(10 ^ (rippledb / 10) - 1);
  gmm = 2 * sqrt(rin * rout) / (rin + rout) * sqrt(1 + epsln ^ 2);
  a = asinh(1 / epsln) / (2 * order);
  atld = asinh(sqrt(1 - gmm ^ 2) / epsln) / (2 * order);
  if (rin < rout)
    for i = 1:order
	  ladder = [ ladder "Lc" ];
	  if (i == 1)
	    l = 2 * rin * sin(pi / 2 / (2 * order)) / (2 * pi * f0 * (sinh(a) - sinh(atld)));
	  else
	    lastc = vals(1, end);
		l = 4 * sin((4 * i - 5) * pi / (4 * order)) * sin((4 * i - 3) * pi / (4 * order)) / ((2 * pi * f0) ^ 2 * (sinh(a) ^ 2 + sinh(atld) ^ 2 + sin((4 * i - 4) * pi / (4 * order)) ^ 2 - 2 * sinh(a) * sinh(atld) * cos((4 * i - 4) * pi / (4 * order)))) / lastc;
	  endif;
      c = 4 * sin((4 * i - 3) * pi / (4 * order)) * sin((4 * i - 1) * pi / (4 * order)) / ((2 * pi * f0) ^ 2 * (sinh(a) ^ 2 + sinh(atld) ^ 2 + sin((4 * i - 2) * pi / (4 * order)) ^ 2 - 2 * sinh(a) * sinh(atld) * cos((4 * i - 2) * pi / (4 * order)))) / l;
      vals = [ vals evalues(l) evalues(c) ];
    endfor;
  elseif (rin > rout)
    for i = 1:order
	  ladder = [ ladder "cL" ];
	  if (i == 1)
	    c = 2 * sin(pi / 2 / (2 * order)) / (rin * 2 * pi * f0 * (sinh(a) - sinh(atld)));
	  else
	    lastl = vals(1, end);
		c = 4 * sin((4 * i - 5) * pi / (4 * order)) * sin((4 * i - 3) * pi / (4 * order)) / ((2 * pi * f0) ^ 2 * (sinh(a) ^ 2 + sinh(atld) ^ 2 + sin((4 * i - 4) * pi / (4 * order)) ^ 2 - 2 * sinh(a) * sinh(atld) * cos((4 * i - 4) * pi / (4 * order)))) / lastl;
	  endif;
      l = 4 * sin((4 * i - 3) * pi / (4 * order)) * sin((4 * i - 1) * pi / (4 * order)) / ((2 * pi * f0) ^ 2 * (sinh(a) ^ 2 + sinh(atld) ^ 2 + sin((4 * i - 2) * pi / (4 * order)) ^ 2 - 2 * sinh(a) * sinh(atld) * cos((4 * i - 2) * pi / (4 * order)))) / c;
      vals = [ vals evalues(c) evalues(l) ];
	endfor;
  endif;
endfunction