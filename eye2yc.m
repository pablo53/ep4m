function [yc] = eye2yc(ye)
  yc = zeros(2, 2);
  if (nargin != 1)
    printf("\neye2yc(ye): converts y-matrix for common emmiter configuration into y-matrix for common collector configuration.\n");
    printf("  ye - 2 x 2 matrix of y parameters (common emmiter)\n");
    printf("\n");
    printf("returns: 2 x 2 matrix of y parameters (common collector)\n");
    return;
  endif;
  yc(1, 1) = ye(1, 1);
  yc(1, 2) = -(ye(1, 2) + ye(1, 2));
  yc(2, 1) = -(ye(1, 1) + ye(2, 1));
  yc(2, 2) = ye(1, 1) + ye(1, 2) + ye(2, 1) + ye(2, 2);
endfunction