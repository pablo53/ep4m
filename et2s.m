function s = et2s(t, z0, z1)
  s = zeros(2, 2);
  if (nargin != 2 && nargin != 3)
    printf("\net2s(t, z0[, z1]): converts ABCD transfer matrix into s-matrix (scattering matrix).\n");
    printf("  t  - 2 x 2 ABCD transfer matrix\n");
    printf("  z0 - characteristic (input) impedance\n");
    printf("  z1 - characteristic output impedance (if different from input impedance), optional\n");
    printf("\n");
    printf("returns: 2 x 2 scattering matrix of s parameters\n");
    return;
  endif;
  if (nargin < 3)
    z1 = z0;
  endif;
  
  s = ey2s(et2y(t), z0, z1);
endfunction