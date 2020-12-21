function t0 = eabcd02abcd(t, rin, rout)
  t0 = zeros(2, 2);
  if (nargin != 3 && nargin != 2)
    printf("\neabcd02abcd(t, rin[, rout]): converts ABCD normalized matrix into ABCD matrix (transmission matrix).\n");
    printf("  t    - 2 x 2 ABCD normalized matrix\n");
    printf("  rin  - input impedance for normalization purpose (equal to output impedance when output impedance not provided)\n");
    printf("  rout - output impedance for normalization purpose (if different from input impedance)\n");
    printf("\n");
    printf("returns: 2 x 2 ABCD transmission matrix\n");
    return;
  endif;
  if (nargin == 2)
    rout = rin;
  endif;
  rrel = sqrt(rout / rin);
  rprd = sqrt(rout * rin);
  t0 = [t(1, 1) / rrel, t(1, 2) * rprd; t(2, 1) / rprd, t(2, 2) * rrel];
endfunction;
