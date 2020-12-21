function [ts] = es2ts(s)
  ts = zeros(2, 2);
  if (nargin != 1)
    printf("\nes2ts(s): converts s-matrix (scattering matrix) into t-matrix (scattering transfer matrix).\n");
    printf("  s  - 2 x 2 matrix of scattering parameters\n");
    printf("\n");
    printf("returns: 2 x 2 matrix of s parameters\n");
	printf("Warning: T-matrix is defined as [b1 a1] = [t11 t12; t21 t22] = [a2 b2], and not as: [a1 b1] = [t11 t12; t21 t22] = [b2 a2] !\n");
    return;
  endif;
  
  ts(1, 1) = -det(s) / s(2, 1);
  ts(1, 2) = s(1, 1) / s(2, 1);
  ts(2, 1) = -s(2, 2) / s(2, 1);
  ts(2, 2) = 1 / s(2, 1);
endfunction