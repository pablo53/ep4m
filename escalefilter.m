function [scnetstr, scnetval] = escalefilter(stdnetstr, stdnetvals, r, f1, f2)
  scnetstr = [];
  scnetval = [];
  
  if (nargin != 5)
    printf("\nescalefilter(stdnetstr, stdnetvals, r, f1, f2): transforms prototype filter into the required one\n");
    printf("  stdnetstr  - prototype filter topology\n");
    printf("  stdnetvals - prototype filter element values\n");
	printf("  r          - wave impedance (input and output) \n");
	printf("  f1         - lower frequency, put NaN for a Lower Pass Filter, put a value greater than f2 for a Band Stop Filter\n");
	printf("  f2         - upper frequency, put NaN for a Upper Pass Filter, put a value less then f1 for a Band Stop Filter\n");
    printf("returns: [ topology, values ]\n\n");
    return;
  endif;
  
  if (isnan(f1) && isnan(f2))
    error("No frequency found.");
  elseif ((!isna(f1) && (f1 == 0)) || (!isna(f2) && (f2 == 0)))
    error("Zero frequency found.");
  endif;
  f1 = abs(f1);
  f2 = abs(f2);
  if (f1 == f2)
    error("Zero bandwidth found.");
  endif;
  if (!isnan(f1) && !isnan(f2))
    w = 4 * pi ^ 2 * f1 * f2;
    if (f1 < f2)
      bw = 2 * pi * (f2 - f1);
      ftyp = "BPF";
    else
      bw = 2 * pi (f1 - f2);
      ftyp = "BSF";
    endif;
  elseif (isnan(f1))
    w = 2 * pi * f2;
    ftyp = "LPF";
  else
    w = 2 * pi * f1;
    ftyp = "UPF";
  endif;
#  printf("Filter type: %s\n", ftyp);
  idx = 0;
  for elem = stdnetstr
    idx = idx + 1;
    switch (elem)
      case 'i'
        scnetstr = [scnetstr 'i'];
        scnetval = [scnetval evempty()];
      case 'o'
        scnetstr = [scnetstr 'o'];
        scnetval = [scnetval evempty()];
      case 'C'
        switch (ftyp)
          case "LPF"
            scnetstr = [scnetstr 'C'];
            scnetval = [scnetval evalues(stdnetvals(1, idx) / (r * w))];
          case "UPF"
            scnetstr = [scnetstr 'L'];
            scnetval = [scnetval evalues(r / (w * stdnetvals(1, idx)))];
          case "BPF"
            scnetstr = [scnetstr 'B'];
            scnetval = [scnetval evalues(r * bw / (w * stdnetvals(1, idx)), stdnetvals(1, idx) / (r * bw))];
          case "BSF"
            scnetstr = [scnetstr 'C' 'L'];
            scnetval = [scnetval evalues(r / (bw * stdnetvals(1, idx))) evalues(bw * stdnetvals(1, idx) / (r * w))];
        endswitch
      case 'c'
        switch (ftyp)
          case "LPF"
            scnetstr = [scnetstr 'c'];
            scnetval = [scnetval evalues(stdnetvals(1, idx) / (r * w))];
          case "UPF"
            scnetstr = [scnetstr 'l'];
            scnetval = [scnetval evalues(r / (w * stdnetvals(1, idx)))];
          case "BPF"
            scnetstr = [scnetstr 'l' 'c'];
            scnetval = [scnetval evalues(r * bw / (w * stdnetvals(1, idx))) evalues(stdnetvals(1, idx) / (r * bw))];
          case "BSF"
            scnetstr = [scnetstr 'b'];
            scnetval = [scnetval evalues(r / (bw * stdnetvals(1, idx)), bw * stdnetvals(1, idx) / (r * w))];
        endswitch
      case 'L'
        switch (ftyp)
          case "LPF"
            scnetstr = [scnetstr 'L'];
            scnetval = [scnetval evalues(stdnetvals(1, idx) * r / w)];
          case "UPF"
            scnetstr = [scnetstr 'C'];
            scnetval = [scnetval evalues(1 / (w * r * stdnetvals(1, idx)))];
          case "BPF"
            scnetstr = [scnetstr 'L' 'C'];
            scnetval = [scnetval evalues(r * stdnetvals(1, idx) / bw) evalues(bw / (w * stdnetvals(1, idx) * r))];
          case "BSF"
            scnetstr = [scnetstr 'B'];
            scnetval = [scnetval evalues(r * bw * stdnetvals(1, idx) / w, 1 / (bw * stdnetvals(1, idx) * r))];
        endswitch
      case 'l'
        switch (ftyp)
          case "LPF"
            scnetstr = [scnetstr 'l'];
            scnetval = [scnetval evalues(stdnetvals(1, idx) * r / w)];
          case "UPF"
            scnetstr = [scnetstr 'c'];
            scnetval = [scnetval evalues(1 / (w * r * stdnetvals(1, idx)))];
          case "BPF"
            scnetstr = [scnetstr 'b'];
            scnetval = [scnetval evalues(bw / (w * stdnetvals(1, idx) * r), r * stdnetvals(1, idx) / bw )];
          case "BSF"
            scnetstr = [scnetstr 'l' 'c'];
            scnetval = [scnetval evalues(r * bw * stdnetvals(1, idx) / w) evalues(1 / (bw * stdnetvals(1, idx) * r))];
        endswitch
	  case 'b'
	    switch (ftyp)
		  case "LPF"
            scnetstr = [scnetstr 'b'];
		    scnetval = [scnetval evalues(stdnetvals(1, idx) / (r * w), stdnetvals(2, idx) * r / w)]; 
		  case "UPF"
            scnetstr = [scnetstr 'b'];
		    scnetval = [scnetval evalues(1 / (stdnetvals(2, idx) * r * w), r / (stdnetvals(1, idx) * w)) ]; 
		  otherwise
            error("Invalid prototype filter.");
		endswitch
	  case 'B'
	    switch (ftyp)
		  case "LPF"
            scnetstr = [scnetstr 'B'];
		    scnetval = [scnetval evalues(stdnetvals(1, idx) * r / w, stdnetvals(2, idx) / (r * w))]; 
		  case "UPF"
            scnetstr = [scnetstr 'B'];
		    scnetval = [scnetval evalues(r / (stdnetvals(2, idx) * w), 1 / (stdnetvals(1, idx) * r * w))]; 
		  otherwise
            error("Invalid prototype filter.");
		endswitch
      otherwise
        error("Invalid prototype filter.");
    endswitch
  endfor
endfunction