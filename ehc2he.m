function [he] = ehc2he(hc)
  he = zeros(2, 2);
  if (nargin != 1)
    printf("\nehc2he(hc): converts h-matrix for common collector configuration into h-matrix for common emmiter configuration.\n");
    printf("  hc - 2 x 2 matrix of h parameters (common collector)\n");
    printf("\n");
    printf("returns: 2 x 2 matrix of h parameters (common emmiter)\n");
    return;
  endif;
  he(1, 1) = hc(1, 1);
  he(1, 2) = 1 - hc(1, 2);
  he(2, 1) = -(1 + hc(2, 1));
  he(2, 2) = hc(2, 2);
endfunction