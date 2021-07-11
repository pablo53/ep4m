function [edeg] = epolyantiorder(ep)
  edeg = NaN;
  if (nargin != 1)
    printf("\nepolyantiorder(ep): Computes polynomial minimal factor order.\n");
    printf("  ep - encoded polynominl\n");
    printf("\n");
    printf("returns: polynomial order \n");
    return;
  endif;
  
  edeg = 0;
  ok = false;
  for i = 1:columns(ep)
    if ((ep(2, i) != 0) && ((ep(1, i) < edeg) || (~ok)))
      edeg = ep(1, i);
      ok = true;
    endif;
  endfor;
endfunction;