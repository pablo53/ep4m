function [t, v] = ematchattenuator(rin, rout, db, pilike)
  if (nargin != 3 && nargin != 4)
    printf("\nematchattenuator(rin, rout, db[, pilike]): Computes a matching attenuator.\n");
	printf("  rin    - input impedance (for both sides)\n");
	printf("  rout   - output impedance (for both sides)\n");
	printf("  db     - attenuating factor [dB] \n");
	printf("  pilike - pi-like topology (if true, default) or T-like (if false), optional\n");
	printf("\n");
	printf("returns [ ladder topology\n");
	printf("          element values ]\n");
	return;
  endif;
  k = 10 ^ (db / 10);
  if (nargin < 4)
    pilike = true;
  endif;
  if (pilike)
    r2 = ((k - 1) / 2) * sqrt((rin * rout) / k);
	r3 = 1 / ((k + 1) / (rout * (k - 1)) - 1 / r2);
	r1 = 1 / ((k + 1) / (rin * (k - 1)) - 1 / r2);
	t = "rRr";
	v = [ evempty() evempty() evempty() ];
	v(1, 1) = r1;
	v(1, 2) = r2;
	v(1, 3) = r3;
  else
    r2 = 2 * sqrt(rin * rout * k) / (k - 1);
	r3 = ((k + 1) / (k - 1)) * rout - r2;
	r1 = ((k + 1) / (k - 1)) * rin - r2;
	t = "RrR";
	v = [ evempty() evempty() evempty() ];
	v(1, 1) = r1;
	v(1, 2) = r2;
	v(1, 3) = r3;
  endif;
endfunction