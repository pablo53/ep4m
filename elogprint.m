function elogprint(f, y, subf, scalename, units)
  if (nargin < 4)
    scalename = "";
	scale = 0;
  else
    switch (scalename)
	  case "p"
	    scale = -12;
	  case "n"
	    scale = -9;
	  case "u"
	    scale = -6;
	  case "m"
	    scale = -3;
	  case ""
	    scale = 0;
	  case "k"
	    scale = 3;
	  case "M"
	    scale = 6;
	  case "G"
	    scale = 9;
	  case "T"
	    scale = 12;
	endswitch;
  endif;
  if (nargin < 5)
    units = "";
  endif;
  [ff, yy] = ecutfoo(f, y, subf .* 10 ^ scale);
  for k = 1:columns(ff)
    printf("%2.2f%s%s: %2.1f dB\n", ff(k) * 10 ^ (-scale), scalename, units, 10 * log(yy(k)) / log(10));
  endfor;
endfunction