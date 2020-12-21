function [s] = ets2s(ts)
  s = zeros(2, 2);
  if (nargin != 1)
    printf("\nets2s(t): converts t-matrix (scattering transfer matrix) into s-matrix (scattering matrix).\n");
    printf("  t  - 2 x 2 matrix of scattering transfer parameters\n");
    printf("\n");
    printf("returns: 2 x 2 matrix of s parameters\n");
	printf("Warning: T-matrix is defined as [b1 a1] = [t11 t12; t21 t22] = [a2 b2], and not as: [a1 b1] = [t11 t12; t21 t22] = [b2 a2] !\n");
    return;
  endif;
  
  s(1, 1) = ts(1, 2) / ts(2, 2);
  s(1, 2) = det(ts) / ts(2, 2);
  s(2, 1) = 1 / ts(2, 2);
  s(2, 2) = -ts(2, 1) / ts(2, 2);
endfunction