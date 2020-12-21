function f = et2f(t)
  h = zeros(2, 2);
  if (nargin != 1)
    printf("\net2f(t): converts t-matrix (ABCD transfer matrix) into f-matrix (hybrid F matrix).\n");
    printf("  t  - 2 x 2 ABCD transfer matrix\n");
    printf("\n");
    printf("returns: 2 x 2 hybrid F matrix\n");
    return;
  endif;
  dt = det(t);
  f(1, 1) = t(2, 1) / t(1, 1);
  f(1, 2) = -dt / t(1, 1);
  f(2, 1) = 1 / t(1, 1);
  f(2, 2) = t(1, 2) / t(1, 1);
endfunction