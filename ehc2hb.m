function [hb] = ehc2hb(hc)
  hb = zeros(2, 2);
  if (nargin != 1)
    printf("\nehc2hb(hc): converts h-matrix for common collector configuration into h-matrix for common base configuration.\n");
    printf("  hc - 2 x 2 matrix of h parameters (common collector)\n");
    printf("\n");
    printf("returns: 2 x 2 matrix of h parameters (common base)\n");
    return;
  endif;
  hb(1, 1) = hc(1, 1) / (-hc(2, 1));
  hb(1, 2) = det(hc) / (-hc(2, 1));
  hb(2, 1) = (1 + hc(2, 1)) / (-hc(2, 1));
  hb(2, 2) = hc(2, 2) / (-hc(2, 1));
endfunction