function v = evalues(v1, v2, v3, v4)
  v = evempty();
  if (nargin >= 1)
    v(1, 1) = v1;
  endif;
  if (nargin >= 2)
    v(2, 1) = v2;
  endif;
  if (nargin >= 3)
    v(3, 1) = v3;
  endif;
  if (nargin >= 4)
    v(4, 1) = v4;
  endif;
endfunction