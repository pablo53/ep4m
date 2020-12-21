function h = ez2h(z)
  h = zeros(2, 2);
   if (nargin != 1)
    printf("\nez2h(z): converts impedance matrix into hybrid matrix.\n");
    printf("  z  - 2 x 2 impedance matrix\n");
    printf("\n");
    printf("returns: 2 x 2 hybrid matrix\n");
    return;
  endif;
  dz = det(z);
  h(1, 1) = dz / z(2, 2);
  h(1, 2) = z(1, 2) / z(2, 2);
  h(2, 1) = -z(2, 1) / z(2, 2);
  h(2, 2) = 1 / z(2, 2);
endfunction