function [hb] = ehe2hb(he)
  hb = zeros(2, 2);
  if (nargin != 1)
    printf("\nehe2hb(he): converts h-matrix for common emmiter configuration into h-matrix for common base configuration.\n");
    printf("  he - 2 x 2 matrix of h parameters (common emmiter)\n");
    printf("\n");
    printf("returns: 2 x 2 matrix of h parameters (common base)\n");
    return;
  endif;
  hb(1, 1) = he(1, 1) / (1 + he(2, 1));
  hb(1, 2) = he(1, 1) * he(2, 2) / (1 + he(2, 1)) - he(1, 2);
  hb(2, 1) = -he(2, 1) / (1 + he(2, 1));
  hb(2, 2) = he(2, 2) / (1 + he(2, 1));
endfunction