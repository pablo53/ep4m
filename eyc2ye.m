function [ye] = eyc2ye(yc)
  ye = zeros(2, 2);
  if (nargin != 1)
    printf("\neyc2ye(yc): converts y-matrix for common collector configuration into y-matrix for common emmiter configuration.\n");
    printf("  yc - 2 x 2 matrix of y parameters (common collector)\n");
    printf("\n");
    printf("returns: 2 x 2 matrix of y parameters (common emmiter)\n");
    return;
  endif;
  ye(1, 1) = yc(1, 1);
  ye(1, 2) = -(yc(1, 2) + yc(1, 2));
  ye(2, 1) = -(yc(1, 1) + yc(2, 1));
  ye(2, 2) = yc(1, 1) + yc(1, 2) + yc(2, 1) + yc(2, 2);
endfunction