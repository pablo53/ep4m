function z = et2z(t)
  z = zeros(2, 2);
  if (nargin != 1)
    printf("\net2z(t): converts t-matrix (ABCD transfer matrix) into z-matrix (impedance matrix).\n");
    printf("  t  - 2 x 2 ABCD transfer matrix\n");
    printf("\n");
    printf("returns: 2 x 2 impedance matrix\n");
    return;
  endif;
  dt = det(t);
  z(1, 1) = t(1, 1) / t(2, 1);
  z(1, 2) = dt / t(2, 1);
  z(2, 1) = 1 / t(2, 1);
  z(2, 2) = t(2, 2) / t(2, 1);
endfunction