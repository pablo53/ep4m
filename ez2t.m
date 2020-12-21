function t = ez2t(z)
  t = zeros(2, 2);
  if (nargin != 1)
    printf("\nez2t(z): converts z-matrix (impedance matrix) into t-matrix (ABCD transfer matrix).\n");
    printf("  z  - 2 x 2 impedance matrix\n");
    printf("\n");
    printf("returns: 2 x 2 ABCD matrix\n");
    return;
  endif;
  dz = det(z);
  t(1, 1) = z(1, 1) / z(2, 1);
  t(1, 2) = dz / z(2, 1);
  t(2, 1) = 1 / z(2, 1);
  t(2, 2) = z(2, 2) / z(2, 1);
endfunction