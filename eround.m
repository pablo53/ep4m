function retf = eround(val, ex, t)
  if ((nargin != 2) && (nargin != 3))
    printf("\neround(val, ex[, t]): Rounds the given value to the nearest E? series value (e.g. E6, E12, etc.).\n");
	printf("  val - value or a vector or matrix of values to be rounded\n");
	printf("  ex  - series to be used, i.e. 6 for E6 series, 12 for E12, and so on...\n\n");
    printf("  t   - topology, forces to round capacitance and resistance values only (optional)\n");
    return;
  endif;
  
  if ((columns(val) > 1) || (rows(val) > 1))
    retf = zeros(rows(val), columns(val));
    for rowno = 1:rows(val)
      for colno = 1:columns(val)
        if (nargin == 2)
          ok = true;
        elseif (nargin == 3)
          switch (t(colno))
            case "R"
              ok = true;
            case "r"
              ok = true;
            case "C"
              ok = true;
            case "c"
              ok = true;
            case "b"
              ok = (rowno == 1);
            case "B"
              ok = (rowno == 2);
            case "f"
              ok = true;
            case "F"
              ok = true;
            case "k"
              ok = (rowno == 2);
            case "K"
              ok = (rowno == 2);
            otherwise
              ok = false;
          endswitch;
        else
          ok = false;
        endif;
        vval = val(rowno, colno);
        if (ok)
		  vsgn = sign(vval);
          retf(rowno, colno) = vsgn * eround(vsgn * vval, ex);
        else
          retf(rowno, colno) = vval;
        endif;
	  endfor;
	endfor;
  elseif (val == 0.0)
    retf = 0.0;
  elseif (val == -Inf || val == Inf)
    retf = val;
  else
    r = floor(log10(val));
    vnorm = val / (10 ^ r);
    vlnorm = 10 ^ (round(log10(vnorm) * ex) / ex);
    vlrnorm = round(vlnorm * 10) / 10;
    retf = vlrnorm * (10 ^ r);
  endif;
endfunction