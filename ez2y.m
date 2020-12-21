function y = ez2y(z)
  y = zeros(2, 2);
  if (nargin != 1)
    printf("\nez2y(z): converts impedance matrix into admittance matrix.\n");
    printf("  z  - 2 x 2 impedance matrix\n");
    printf("\n");
    printf("returns: 2 x 2 admittance matrix\n");
    return;
  endif;
  dz = det(z);
  y(1, 1) = z(2, 2) / dz;
  y(1, 2) = -z(1, 2) / dz;
  y(2, 1) = -z(2, 1) / dz;
  y(2, 2) = z(1, 1) / dz;
endfunction