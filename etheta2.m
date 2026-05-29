function s = etheta2(z, q, n)
  if (nargin < 3)
    n = 5
  endif
  s = 1
  for m = 0:n
    s = s + 2 * q ^ ((m + 0.5) ^ 2) * cos((2 * m + 1) * z);
  endfor;
endfunction
