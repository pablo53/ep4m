function [yb] = eye2yb(ye)
  yb = zeros(2, 2);
  if (nargin != 1)
    printf("\neye2yb(ye): converts y-matrix for common emmiter configuration into y-matrix for common base configuration.\n");
    printf("  ye - 2 x 2 matrix of y parameters (common emmiter)\n");
    printf("\n");
    printf("returns: 2 x 2 matrix of y parameters (common base)\n");
    return;
  endif;
  yb(1, 1) = ye(1, 1) + ye(2, 1) + ye(1, 2) + ye(2, 2);
  yb(1, 2) = -(ye(1, 2) + ye(2, 2));
  yb(2, 1) = -(ye(2, 1) + ye(2, 2));
  yb(2, 2) = ye(2, 2);
endfunction