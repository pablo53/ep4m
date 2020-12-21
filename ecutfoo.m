function [xo, yo] = ecutfoo(x, y, subx)
  xo = [];
  yo = [];
  for k = 1:columns(x)
    if (ismember(x(:,k), subx))
	  xo = [ xo, x(:,k) ];
	  yo = [ yo, y(:,k) ];
	endif;
  endfor;
endfunction