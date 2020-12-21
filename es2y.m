function [y] = es2y(s, z0, z1)
  y = zeros(2, 2);
  if (nargin != 2 && nargin != 3)
    printf("\nes2y(s, z0): converts s-matrix (scattering parameters matrix) into y-matrix (admittance matrix)\n");
    printf("  s  - 2 x 2 matrix of s parameters\n");
    printf("  z0 - characteristic (source) impedance\n");
    printf("  z1 - characteristic load impedance (if different from source impedance), optional\n");
    printf("\n");
    printf("returns: 2 x 2 matrix of y parameters\n");
    return;
  endif;
  if (nargin < 3)
    z1 = z0;
  endif;

#  y = z0 * y;
#  y(1, 1) = ((1 + s(2, 2)) * (1 - s(1, 1)) + s(1, 2) * s(2, 1)) / z0;
#  y(1, 2) = -2 * s(1, 2) / z0;
#  y(2, 1) = -2 * s(2, 1) / z0;
#  y(2, 2) = ((1 + s(1, 1)) * (1 - s(2, 2)) + s(1, 2) * s(2, 1)) / z0;
#  y = (1 / ((1 + s(2, 2)) * (1 + s(1, 1)) - s(1, 2) * s(2, 1))) * y;
  sqy = diag([ sqrt(1 / z0) sqrt(1 / z1)]);
  y = sqy * (eye(2) + s) ^ -1 * (eye(2) - s) * sqy;
endfunction