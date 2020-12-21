function h = et2h(t)
  h = zeros(2, 2);
  if (nargin != 1)
    printf("\net2h(t): converts t-matrix (ABCD transfer matrix) into h-matrix (hybrid H matrix).\n");
    printf("  t  - 2 x 2 ABCD transfer matrix\n");
    printf("\n");
    printf("returns: 2 x 2 hybrid H matrix\n");
    return;
  endif;
  dt = det(t);
  h(1, 1) = t(1, 2) / t(2, 2);
  h(1, 2) = dt / t(2, 2);
  h(2, 1) = -1 / t(2, 2);
  h(2, 2) = t(2, 1) / t(2, 2);
endfunction