function t = eh2t(h)
  t = zeros(2, 2);
  if (nargin != 1)
    printf("\neh2t(h): converts h-matrix (hybrid H matrix) into t-matrix (ABCD transfer matrix).\n");
    printf("  h  - 2 x 2 hybrid H matrix\n");
    printf("\n");
    printf("returns: 2 x 2 ABCD matrix\n");
    return;
  endif;
  dh = det(h);
  t(1, 1) = -dh / h(2, 1);
  t(1, 2) = -h(1, 1) / h(2, 1);
  t(2, 1) = -h(2, 2) / h(2, 1);
  t(2, 2) = -1 / h(2, 1);
endfunction