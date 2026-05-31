function dn = ejdn(u, k)
  if (nargin < 2)
    printf("ejdn(u,k): Jacobian elliptic dn function\n");
    return;
  endif;

  s = ejsn(u, k);
  dn = sqrt(1 - k * k * s * s);
endfunction
