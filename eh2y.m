function y = eh2y(h)
  y = zeros(2, 2);
  if (nargin != 1)
    printf("\neh2y(h): converts hybrid matrix into admittance matrix.\n");
    printf("  h  - 2 x 2 hybrid matrix\n");
    printf("\n");
    printf("returns: 2 x 2 admittance matrix\n");
    return;
  endif;
  dh = det(h);
  y(1, 1) = 1 / h(1, 1);
  y(1, 2) = -h(1, 2) / h(1, 1);
  y(2, 1) = h(2, 1) / h(1, 1);
  y(2, 2) = dh / h(1, 1);
endfunction