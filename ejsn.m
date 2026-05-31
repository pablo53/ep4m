function sn = ejsn(u, k, epsilon, maxstepsapprox)
  if (nargin < 2)
    printf("ejsn(u,k): Jacobian elliptic sine function\n");
    return;
  endif;
  if (nargin < 3)
    epsilon = 0.0000000001;
  endif;
  if (nargin < 4)
    maxstepsapprox = 100;
  endif;
  a = [1];
  b = [sqrt(1 - k*k)];
  c = [k];
  while ((abs(c(1)) > epsilon) && (maxstepsapprox > 0))
    na = (a(1) + b(1)) / 2;
    nb = sqrt(a(1) * b(1));
    nc = (a(1) - b(1)) / 2;
    a = [na a];
    b = [nb b];
    c = [nc c];
    maxstepsapprox = maxstepsapprox - 1;
  endwhile;
  a_n = a(1);
  c_n = c(1);
  phin = 2 ^ (length(a) - 1) * a_n * u;
  a = a(2:end);
  c = c(2:end);
  while (length(a) > 0)
    phin = (phin  + asin(sin(phin) * c_n / a_n)) / 2;
    a_n = a(1);
    c_n = c(1);
    a = a(2:end);
    c = c(2:end);
  endwhile;
  sn = sin(phin);
endfunction
