function [t, v, am] = esallenkeybpfilter(f1, f2, c)
  if (nargin != 3)
    printf("\nesallenkeybpfilter(f1, f2, c): Creates the ladder for a Sallen-Key band pass filter.\n");
	printf("  Bandwidth: f1..f2\n");
	printf("  Capacitor: c\n");
	printf("  Gain: Depends on all the other factors\n");
	printf("\n");
	printf("returns [ ladder topology,\n");
	printf("          element values,\n");
	printf("          gain ]\n");
	return;
  endif;
  if (nargin < 4)
    upper = false;
  endif;# 

	bw = f2 - f1;
	fm = sqrt(f1 * f2);
	q = fm / bw;

	r = 1 / (2 * pi * fm * c);
	am = 3 * q - 1; # overall gain
	g = 3 - 1 / q;
	
	t = "Rc<C rRv >";
	v = zeros(rows(evempty()), 10);
	v(:,1) = evalues(r);
	v(:,2) = evalues(c);
	v(:,4) = evalues(c);
	v(:,6) = evalues(2 * r);
	v(:,7) = evalues(r);
	v(:,8) = evalues(+Inf, 0, g);
	
endfunction;
