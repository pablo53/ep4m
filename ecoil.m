function [l, w, q, r, clr, twdth] = ecoil(phi, len, n, d, f, rho)
# phi - inner coil diameter [m]
# len - coil length [m]
# n - number of turns
# d - wire diameter [m] (optional; for q to be calculated only)
# f - frequency(-ies) [Hz] (optional; for q to be calculated only)
# rho - wire resistivity [Ohm * m] (optional; for q to be calculated only)
# returns: [ inductance, minimal wire length to produce the coil, quality factor(s), series resistance(s),
#            clearance (distance between wire surfaces of two adjacent turns), length per turn ]
  if (nargin < 3)
    printf("\necoil(phi, len, n, [d, [f, [rho]]]): calculates coil parameters\n");
	printf("  phi - inner coil diameter [m]\n");
    printf("  len - coil length [m]\n");
    printf("  n - number of turns\n");
    printf("  d - wire diameter [m] (optional; for q to be calculated only)\n");
    printf("  f - frequency(-ies) [Hz] (optional; for q to be calculated only)\n");
    printf("  rho - wire resistivity [Ohm * m] (optional; for q to be calculated only)\n");
	printf("\n  returns: [ inductance,\n             minimal wire length to produce the coil,\n             quality factor(s),\n             series resistance(s),\n             clearance (distance between wire surfaces of two adjacent turns),\n             length per turn ]\n");
    return;
  endif;
  if (nargin < 4)
    d = 0;
  endif;
  if (nargin < 5)
    f = 0;
  endif;
  if (nargin < 6)
    rho = 0;
  endif;
  d2 = phi + d; # coil diameter
  if (len <= d2 / 3)
    Warning("Calculations are implausible when the length of the coil falls below one 3rd of its diameter!");
  endif;
  l = 3.94e-5 * (d2/2) ^ 2 * n ^ 2 / (9 * (d2/2) + 10 * len);
  w = sqrt((n * pi * d2) ^ 2 + len ^ 2);
  r = ewireacres(w, d, rho, f);
  q = l * 2 * pi * f ./ r;
  if (n > 1)
    twdth = len / (n - 1);
	if (nargin >= 4)
	  clr = twdth - d;
	else
	  clr = nan;
	endif;
  else
    twdth = nan;
    clr = nan;
  endif;
endfunction