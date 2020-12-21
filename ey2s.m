function [s] = ey2s(y, z0, z1)
  s = zeros(2, 2);
  if (nargin != 2 && nargin != 3)
    printf("\ney2s(y, z0): converts y-matrix (admittance matrix) into s-matrix (scattering parameters matrix).\n");
    printf("  y  - 2 x 2 matrix of y parameters\n");
    printf("  z0 - characteristic (source) impedance\n");
    printf("  z1 - characteristic load impedance (if different from source impedance), optional\n");
    printf("\n");
    printf("returns: 2 x 2 matrix of s parameters\n");
    return;
  endif;
  if (nargin < 3)
    z1 = z0;
  endif;
  
#  y = z0 * y;
#  s(1, 1) = ((1 - y(1, 1)) * (1 + y(2, 2)) + y(1, 2) * y(2, 1));
#  s(1, 2) = -2 * y(1, 2);
#  s(2, 1) = -2 * y(2, 1);
#  s(2, 2) = ((1 + y(1, 1)) * (1 - y(2, 2)) + y(1, 2) * y(2, 1));
#  s = (1 / ((1 + y(1, 1)) * (1 + y(2, 2)) - y(1, 2) * y(2, 1))) * s;
  sqz = diag([sqrt(z0) sqrt(z1)]);
  s = (eye(2) + sqz * y * sqz) ^ -1 * (eye(2) - sqz * y * sqz);
endfunction