function [hb] = ehb2supera(hb1, hb2)
  hb = zeros(2, 2);
  if (nargin != 2)
    printf("\nehb2supera(hb1, hb2): converts h-matrices for common base configuration into h-matrix for common base in super-alpha configuration.\n");
    printf("  hb1 = 2 x 2 matrix of h parameters (common base)\n");
    printf("  hb2 = 2 x 2 matrix of h parameters (common base)\n");
    printf("\n");
    printf("returns: 2 x 2 matrix of h parameters (common base in super-alpha configuration)\n");
    return;
  endif;
  hb(1, 1) = hb1(1, 1) - hb2(1, 1) * hb1(1, 2) * hb1(2, 1) / (1 + hb2(1, 1) * hb1(2, 2));
  hb(1, 2) = hb1(1, 2) * hb2(1, 2) / (1 + hb2(1, 1) * hb1(2, 2));
  hb(2, 1) = -hb1(2, 1) * hb2(2, 1) / (1 + hb2(1, 1) * hb1(2, 2));
  hb(2, 2) = hb2(2, 2) - hb1(2, 2) * hb2(1, 2) * hb2(2, 1) / (1 + hb2(1, 1) * hb1(2, 2));
endfunction