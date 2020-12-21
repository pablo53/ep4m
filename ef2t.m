function t = ef2t(f)
  t = zeros(2, 2);
  if (nargin != 1)
    printf("\nef2t(f): converts f-matrix (hybrid F matrix) into t-matrix (ABCD transfer matrix).\n");
    printf("  f  - 2 x 2 hybrid F matrix\n");
    printf("\n");
    printf("returns: 2 x 2 ABCD matrix\n");
    return;
  endif;
  df = det(f);
  t(1, 1) = 1 / f(2, 1);
  t(1, 2) = f(2, 2) / f(2, 1);
  t(2, 1) = f(1, 1) / f(2, 1);
  t(2, 2) = df / f(2, 1);
endfunction