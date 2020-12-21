function [t, v] = ekuroda(top, vals, idx, r, elem)
  t = "";
  v = [];
  if (nargin != 4 && nargin != 5)
    printf("\nekuroda(top, vals, idx, r[, elem]): transforms the net with Kuroda's identities.\n");
	printf("  top  - topology to be transformed\n");
	printf("  vals - topology elements' values\n");
	printf("  idx  - 1-based index of the series short(\"]\") or shunt open(\"|\") unity element; negative - from the right, positive - from the left\n");
	printf("  r    - wave impedance of the unity transmission line at the beginning of the transformation\n");
	printf("  elem - element type to be considered when indexing elements with the parameter \"idx\"");
	printf("\n");
	printf("Warning: all the elements in the path of transformation must have the same time delay!\n");
	printf("\n");
	printf("returns: [ topology, values ]\n");
	return;
  endif;
  if (nargin < 5)
    elem = "";
  endif;
  
  t = top;
  v = vals;
  if (idx > 0)
    step = 1;
	t = [ "#" t ];
	v = [ evalues(r, NaN) v ]; # temporarily NaN
	i = 1;
  else
    step = -1;
	idx = abs(idx);
	t = [ t "#" ];
	v = [ v evalues(r, NaN) ]; # temporarily NaN
	i = columns(t);
  endif;
  i = i + step;
  while (i >= 1 && i <= columns(t) && idx > 0)
	z0 = v(1, i - step); # (i - step) always points to unity element here...
	z1 = v(1, i);
    switch (t(i))
	  case "i"
		if (strcmp(elem, ""))
          idx = idx - 1;
		endif;
		t(i) = "#";
		t(i - step) = "i";
		v(:, i) = v(:, i - step);
		v(:, i - step) = evalues();
	  case "o"
		if (strcmp(elem, ""))
          idx = idx - 1;
		endif;
		t(i) = "#";
		t(i - step) = "o";
		v(:, i) = v(:, i - step);
		v(:, i - step) = evalues();
	  case "]"
		if (strcmp(elem, "") || strcmp(elem, t(i)))
          idx = idx - 1;
		endif;
	    if (isnan(v(2, i - step)))
		  v(2, i - step) = v(2, i);
		elseif (v(2, i - step) != v(2, i - step))
	      error("Illegal topology for transformation using Kuroda's identity: time delays do not match"); # stop immediately, time delays do not match
		endif;
		z2 = (z0 + z1) * z0 / z1;
		z3 = z0 + z1;
		t(i) = "#";
		t(i - step) = "|";
		v(1, i) = z3;
		v(1, i - step) = z2;
	  case "|"
		if (strcmp(elem, "") || strcmp(elem, t(i)))
          idx = idx - 1;
		endif;
	    if (isnan(v(2, i - step)))
		  v(2, i - step) = v(2, i);
		elseif (v(2, i - step) != v(2, i - step))
	      error("Illegal topology for transformation using Kuroda's identity: time delays do not match"); # stop immediately, time delays do not match
		endif;
		z2 = z0 ^ 2 / (z0 + z1);
		z3 = z0 * z1 / (z0 + z1);
		t(i) = "#";
		t(i - step) = "]";
		v(1, i) = z3;
		v(1, i - step) = z2;
	  otherwise
	    error("Illegal topology for transformation using Kuroda's identity: cannot go further %s/%s", t(i), t);
	endswitch;
    i = i + step;
  endwhile;
  
endfunction