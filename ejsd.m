function res = ejsd(u, k)
  if (nargin < 2)
    printf("ejsd(u,k): Jacobian elliptic sd function\n");
    return;
  endif;

  res = ejsn(u, k) / ejdn(u, k);
endfunction
