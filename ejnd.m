function res = ejnd(u, k)
  if (nargin < 2)
    printf("ejnd(u,k): Jacobian elliptic nd function\n");
    return;
  endif;

  res = 1 / ejdn(u, k);
endfunction
