function res = ejcd(u, k)
  if (nargin < 2)
    printf("ejcd(u,k): Jacobian elliptic cd function\n");
    return;
  endif;

  res = ejcn(u, k) / ejdn(u, k);
endfunction
