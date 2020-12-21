function [ladder, vals] = eimpmatchtapc(t, v, zin, zout, idx)
  
  if (nargin != 4 && nargin != 5)
    printf("\neimpmatchtapc(t, v, zin, zout[, idx]): impedance matching with tap capacity.\n");
	printf("                                       t    - topology\n");
	printf("                                       v    - topology values\n");
	printf("                                       zin  - input (for zin < zout) or source (zout > zin) impedance as seen by inner circuit\n");
	printf("                                       zout - load (for zin < zout) or output (zout > zin) impedance as seen by input\n");
	printf("                                       idx  - the first (zin < zout) or last (zout < zin) index of shunt capacitance - provided explicitly (optional)\n");
	printf("returns: [ topology values ]\n");
    return;
  endif;
  
  if (nargin < 5)
    if (zin < zout)
	  idx = index(t, 'c', "first");
	  if (idx > 0)
	    fin = (idx < 2);
		if (~fin)
		  fin = ~eisshunt(t(idx - 1));
		endif;
		while (~fin)
		  nextt = t(idx - 1);
		  nextv = v(:, idx - 1);
		  t(idx - 1) = t(idx);
		  t(idx) = nextt;
		  v(:, idx - 1) = v(:, idx);
		  v(:, idx) = nextv;
		  idx = idx - 1;
	      fin = (idx < 2);
		  if (~fin)
		    fin = ~eisshunt(t(idx - 1));
		  endif;
		endwhile;
	  endif;
	elseif (zin > zout)
	  idx = index(t, 'c', "last");
	  if (idx > 0)
	    fin = (idx >= columns(t));
		if (~fin)
		  fin = ~eisshunt(t(idx + 1));
		endif;
		while (~fin)
		  nextt = t(idx + 1);
		  nextv = v(:, idx + 1);
		  t(idx + 1) = t(idx);
		  t(idx) = nextt;
		  v(:, idx + 1) = v(:, idx);
		  v(:, idx) = nextv;
		  idx = idx + 1;
	      fin = (idx >= columns(t));
		  if (~fin)
		    fin = ~eisshunt(t(idx + 1));
		  endif;
		endwhile;
	  endif;
	else
	  ladder = t;
	  vals = v;
	endif;
  elseif (idx == -1)
	  idx = index(t, 'c', "last");
  elseif (t(idx) != 'c')
    error("This is not a shunt capacitor.");
  endif;
  if (zin < zout)
    tcc = 'cC';
	rf1 = sqrt(zout / zin);
	rf2 = rf1 / (rf1 - 1);
	vcc = [ rf1 .* v(:,idx), rf2 .* v(:,idx) ];
	ladder = [ t(1:idx-1) tcc t(idx + 1:columns(t)) ];
	vals = [ v(:,1:idx-1) vcc v(:,idx + 1:columns(t)) ];
  elseif (zin > zout)
    tcc = 'Cc';
	rf2 = sqrt(zin / zout);
	rf1 = rf2 / (rf2 - 1);
	vcc = [ rf1 .* v(:,idx), rf2 .* v(:,idx) ];
	ladder = [ t(1:idx-1) tcc t(idx + 1:columns(t)) ];
	vals = [ v(:,1:idx-1) vcc v(:,idx + 1:columns(t)) ];
  else
    ladder = t;
    vals = v;
  endif;
endfunction