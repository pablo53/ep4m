function y = et2y(t)
  y = zeros(2, 2);
  if (nargin != 1)
    printf("\net2y(t): converts ABCD transfer matrix into y-matrix (admittance matrix).\n");
    printf("  t  - 2 x 2 matrix of scattering transfer parameters\n");
    printf("\n");
    printf("returns: 2 x 2 admittance matrix of s parameters\n");
    return;
  endif;
  
  dt = det(t);
  y(1, 1) = t(2, 2) / t(1, 2);
  y(1, 2) = -dt / t(1, 2);
  y(2, 1) = -1 / t(1, 2);
  y(2, 2) = t(1, 1) / t(1, 2);
endfunction