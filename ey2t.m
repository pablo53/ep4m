function t = ey2t(y)
  t = zeros(2, 2);
  if (nargin != 1)
    printf("\ney2t(y): converts y-matrix (admittance matrix) into t-matrix (ABCD transfer matrix).\n");
    printf("  y  - 2 x 2 admittance matrix\n");
    printf("\n");
    printf("returns: 2 x 2 ABCD matrix\n");
    return;
  endif;
  
  dy = det(y);
  t(1, 1) = -y(2, 2) / y(2, 1);
  t(1, 2) = -1 / y(2, 1);
  t(2, 1) = -dy / y(2, 1);
  t(2, 2) = -y(1, 1) / y(2, 1);
endfunction