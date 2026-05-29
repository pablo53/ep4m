function [res] = eagm(a, b, maxn, maxerr)
  if (nargin < 3)
    maxn = 100;
  endif;
  if (nargin < 4)
    maxerr = 0.000000001;
  endif;
  n = 0;
  while (abs(a - b) > maxerr && n < maxn)
    n = n + 1;
    na = (a + b) / 2;
    nb = sqrt(a * b);
    a = na;
    b = nb;
  endwhile;
  res = (a + b) / 2;
endfunction
