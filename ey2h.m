function h = ey2h(y)
  h = zeros(2, 2);
  if (nargin != 1)
    printf("\ney2h(y): converts admittance matrix into hybrid matrix.\n");
    printf("  y  - 2 x 2 admittance matrix\n");
    printf("\n");
    printf("returns: 2 x 2 hybrid matrix\n");
    return;
  endif;
  dy = det(y);
  h(1, 1) = 1 / y(1, 1);
  h(1, 2) = -y(1, 2) / y(1, 1);
  h(2, 1) = y(2, 1) / y(1, 1);
  h(2, 2) = dy / y(1, 1);
endfunction