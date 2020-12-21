function z = eh2z(h)
  z = zeros(2, 2);
  if (nargin != 1)
    printf("\neh2z(h): converts hybrid matrix into impedance matrix.\n");
    printf("  h  - 2 x 2 hybrid matrix\n");
    printf("\n");
    printf("returns: 2 x 2 impedance matrix\n");
    return;
  endif;
  dh = det(h);
  z(1, 1) = dh / h(2, 2);
  z(1, 2) = h(1, 2) / h(2, 2);
  z(2, 1) = -h(2, 1) / h(2, 2);
  z(2, 2) = 1 / h(2, 2);
endfunction