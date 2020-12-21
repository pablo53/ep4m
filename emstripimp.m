function [z, eepsf, v] = emstripimp(w, t, h, epsr, f, z0)
  z = NaN;
  v = NaN;
  if (nargin != 4 && nargin != 5 && nargin != 6)
    printf("\nemstripimp(w, t, h, epsr[, f[, z0]]): approximates characteristic impedance of a microstrip line with given geometry\n");
	printf("  w    - strip width\n");
	printf("  t    - strip thickness\n");
	printf("  h    - thickness of two-side coppered PCB (ground on the back side)\n");
	printf("  epsr - dielectric permittivity of PCB material\n");
	printf("  f    - frequency (optional) for accurate calculations \n");
	printf("  z0   - wave impedance approximation (if known) for more accurate calucaltions, each iteration makes it more accurate \n");
	printf("  \n");
	printf("returns: [ wave_impedance, effective_epsr, phase_velocity_to_c ]\n\n");
    return;
  endif;
  
  if (nargin < 5)
    f = +Inf;
	gffp = 1;
  elseif (nargin >= 6)
    fp = 398e+9 * z0 / h;
    g = 0.6 + 0.009 * z0;
	gffp = 1 + g * (f / fp) ^ 2
  else
    gffp = 1;
  endif;
  delta = 63.1; # copper
  deltas = delta / sqrt(f);
  eeps0 = (epsloss(epsr, deltas) + 1) / 2 + (epsr - 1) / (2 * sqrt(1 + 12 * h / w));
  eepsf = epsr - (epsr - eeps0) / gffp;
  
  z = (1 / sqrt(eepsf)) * (120 * pi) / (w / h + 2.42 - 0.44 * h / w + (1 - h / w) ^ 6);
  
  v = 1 / sqrt(eepsf);
  
endfunction
