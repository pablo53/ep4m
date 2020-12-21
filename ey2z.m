function z = ey2z(y)
  z = zeros(2, 2);
  if (nargin != 1)
    printf("\ney2z(y): converts admittance matrix into impedance matrix.\n");
    printf("  y  - 2 x 2 admittance matrix\n");
    printf("\n");
    printf("returns: 2 x 2 impedance matrix\n");
    return;
  endif;
  dy = det(y);
  z(1, 1) = y(2, 2) / dy;
  z(1, 2) = -y(1, 2) / dy;
  z(2, 1) = -y(2, 1) / dy;
  z(2, 2) = y(1, 1) / dy;
  
endfunction