function [t, v] = ekurodaall(top, vals, idx, r)
  
  t = "";
  v = [];
  if (nargin != 4)
    printf("\nekurodaall(top, vals, idx, r): transforms the whole net with Kuroda's identities.\n");
	printf("  top  - topology to be transformed\n");
	printf("  vals - topology elements' values\n");
	printf("  idx  - 1-based split index, the left part will be transformed from the left, and the right one - from the right; NaN - let the function take the index itself \n");
	printf("  r    - wave impedance of the unity transmission line at the beginning of the transformation\n");
	printf("\n");
	printf("Warning: all the elements in the path of transformation must have the same time delay!\n");
	printf("\n");
	printf("returns: [ topology, values ]\n");
	return;
  endif;
  t = top;
  v = vals;
  
  if (isnan(idx))
    idx = round(columns(t) / 2);
  endif;
  f = findstr("]", top);
  if (columns(f) > 0)
    changed = 1;
  else
    changed = 0;
  endif;
  while (changed)
    changed = 0;
	f = findstr("]", t(1:idx));
	if (columns(f) > 0)
	  changed = 1;
	  lf = columns(f);
	  [ tmpt, tmpv ] = ekuroda(t, v, lf, r, "]");
	  t = tmpt;
	  v = tmpv;
	  idx = idx + 1; # We assume that one "#" element has just been insterted.
	endif;
	f = findstr("]", t(idx + 1:columns(t)));
	if (columns(f) > 0)
	  changed = 1;
	  lf = -columns(f);
	  [ tmpt, tmpv ] = ekuroda(t, v, lf, r, "]");
	  t = tmpt;
	  v = tmpv;
	endif;
  endwhile;
  
endfunction