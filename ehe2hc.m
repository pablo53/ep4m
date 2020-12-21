function [hc] = ehe2hc(he)
  hc = zeros(2, 2);
  if (nargin != 1)
    printf("\nehe2hc(he): converts h-matrix for common emmiter configuration into h-matrix for common collector configuration.\n");
    printf("  he - 2 x 2 matrix of h parameters (common emmiter)\n");
    printf("\n");
    printf("returns: 2 x 2 matrix of h parameters (common collector)\n");
    return;
  endif;
  hc(1, 1) = he(1, 1);
  hc(1, 2) = 1 - he(1, 2);
  hc(2, 1) = -(1 + he(2, 1));
  hc(2, 2) = he(2, 2);
endfunction