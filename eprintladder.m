function eprintladder(typestr, elemvals, sym, cbpartname)
  if (nargin != 2 && nargin != 3 && nargin != 4)
    printf("\neprintladder(typestr, elemvals[, sym[, callbpartname]]): Prints ladder topology.\n");
	printf("  typestr    - string representing the ladder topology\n");
	printf("  elemvals   - values of each element in the corresponding position\n");
	printf("  sym        - prints wires on both sided if true (default: false)\n");
	printf("  cbpartname - callback function to get an external part name")
	printf("\n");
	printf("returns [ ladder topology\n");
	printf("          element values ]\n");
	return;
  endif;
  if (nargin < 4)
    cbpartname = "elibpartname";
  endif;
  cntl = 0;
  cntr = 0;
  cntc = 0;
  cntic = 0;
  cntt = 0;
  cntnet = 0;
  cnts = 0;
  cnt = 0;
  swimlanes = 1;
  vals = [];
  elems = "";
  idx = 0;
  if (nargin < 3)
    sym = false;
  endif;
  for elem = typestr
    cnt = cnt + 1;
	idx = idx + 1;
	vals = [vals elemvals(:, idx)];
	elems = [elems elem];
    if (elem == '>' || elem == '}')
	  if (cnt != swimlanes - 1)
	    error("Illegal topology");
	  endif;
	  swimlanes = swimlanes - 1;
	endif;
	if (cnt == swimlanes)
	  [cntl, cntr, cntc, cntt, cntnet, cnts, cntic] = eprintelem(elems, vals, sym, cntl, cntr, cntc, cntt, cntnet, cnts, cntic, cbpartname);
      vals = [];
      elems = "";
	  cnt = 0;
	else
	endif;
	if (elem == '<' || elem == '{')
	  if (cnt != 0)
	    error("Illegal topology");
	  endif;
	  swimlanes = swimlanes + 1;
	endif;
  endfor
endfunction