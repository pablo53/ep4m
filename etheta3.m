function s = etheta3(z, q, n)
  if (nargin < 3)
    n = 5
  endif
  s = 1
  for m = 1:n
    s = s + 2 * q ^ (m * m) * cos(2 * m * z);
  endfor;
endfunction
