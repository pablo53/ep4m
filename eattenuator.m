function [ladder, vals] = eattenuator(r0, db, pilike)
  if (nargin != 2 && nargin != 3)
    printf("\neattenuator(r0, db[, pilike]): Computes an attenuator.\n");
	printf("  r0 - characteristic impedance (for both sides)\n");
	printf("  db - attenuating factor [dB] \n");
	printf("  pilike - pi-like topology (if true, default) or T-like (if false)\n");
	printf("\n");
	printf("returns [ ladder topology\n");
	printf("          element values ]\n");
	return;
  endif;
  if (nargin < 3)
    pilike = 1;
  endif;
  vals = evempty();
  a = 10 ^ (db / 20);
  if (pilike)
    ladder = "rRr";
	rp = r0 * (a + 1) / (a - 1);
	rs = r0 * (a ^ 2 - 1) / (2 * a);
	vals(1, 1) = rp;
	vals(1, 2) = rs;
	vals(1, 3) = rp;
  else
    ladder = "RrR";
	rp = r0 * 2 * a / (a ^ 2 - 1);
	rs = r0 * (a - 1) / (a + 1);
	vals(1, 1) = rs;
	vals(1, 2) = rp;
	vals(1, 3) = rs;
  endif;
endfunction