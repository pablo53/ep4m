function [ye] = eyb2ye(yb)
  ye = zeros(2, 2);
  if (nargin != 1)
    printf("\neyb2ye(yb): converts y-matrix for common base configuration into y-matrix for common emmiter configuration.\n");
    printf("  yb - 2 x 2 matrix of y parameters (common base)\n");
    printf("\n");
    printf("returns: 2 x 2 matrix of y parameters (common emmiter)\n");
    return;
  endif;
  ye(1, 1) = yb(1, 1) + yb(2, 1) + yb(1, 2) + yb(2, 2);
  ye(1, 2) = -(yb(1, 2) + yb(2, 2));
  ye(2, 1) = -(yb(2, 1) + yb(2, 2));
  ye(2, 2) = yb(2, 2);
endfunction