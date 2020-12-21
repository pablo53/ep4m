function [he] = ehe2superb(he1, he2)
  he = zeros(2, 2);
  if (nargin != 2)
    printf("\nehe2superb(he1, he2): converts h-matrices for common emmiter configuration into h-matrix for common emmiter in super-beta configuration.\n");
    printf("  he1 = 2 x 2 matrix of h parameters (common emmiter)\n");
    printf("  he2 = 2 x 2 matrix of h parameters (common emmiter)\n");
    printf("\n");
    printf("returns: 2 x 2 matrix of h parameters (common emmiter in super-beta configuration)\n");
    return;
  endif;
  he(1, 1) = he1(1, 1) + he2(1, 1) * (1 + he1(2, 1));
  he(1, 2) = he1(1, 2) + he2(1, 2) + he2(1, 1) * he1(2, 2);
  he(2, 1) = he1(2, 1) + he2(2, 1) * (1 + he1(2, 1));
  he(2, 2) = he2(2, 2) + he1(2, 2) * (1 + he2(2, 1));
endfunction