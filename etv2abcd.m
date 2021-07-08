function [tm] = etv2abcd(top, vals, freq, alpha, callb)

  if (nargin < 3)
    printf("\n\netv2abcd(top, vals, freq[, alpha[, callb]]): Calculates transmission ABCD matrix values at given frequency \n");
	printf("  top   - topology\n");
	printf("  vals  - topology elements' values\n");
	printf("  freq  - vector of frequencies to be analyzed\n");
	printf("  alpha - a parameter to simulate imperfect net, the higher the more power loss (optional)\n");
	printf("  callb - callback function name to evaluate transmission matrix when external part encountered (optional)\n");
	printf("returns: Transmission ABCD matrix of the ladder \n");
    return;
  endif;

    idx = 0;
    w = 2 * pi * freq;
    s = i * w;
    if (nargin >= 4)
	  if (~isnan(alpha))
	    s = s + alpha;
	  endif;
	endif;
    t = { eye(2) };
	tjun = {};
	swimlanes = 1;
	cnt = 0;
	cntext = 0;
    for elem = top
      idx = idx + 1;
	  cnt = cnt + 1;
	  if (cnt > swimlanes)
	    cnt = 1;
	  endif;
	  if (cnt < swimlanes)
	    cntt = 2 * cnt;
	  else
	    cntt = 2 * cnt - 1;
	  endif;
      val = vals(:,idx);
      switch elem
        case 'c'
          t{cntt} = t{cntt} * et(elem, val, s);
        case 'C'
          t{cntt} = t{cntt} * et(elem, val, s);
        case 'l'
          t{cntt} = t{cntt} * et(elem, val, s);
        case 'L'
          t{cntt} = t{cntt} * et(elem, val, s);
        case 'r'
          t{cntt} = t{cntt} * et(elem, val, s);
        case 'R'
          t{cntt} = t{cntt} * et(elem, val, s);
        case 'b'
          t{cntt} = t{cntt} * et(elem, val, s);
        case 'B'
          t{cntt} = t{cntt} * et(elem, val, s);
        case 'f'
          t{cntt} = t{cntt} * et(elem, val, s);
        case 'F'
          t{cntt} = t{cntt} * et(elem, val, s);
        case 'k'
          t{cntt} = t{cntt} * et(elem, val, s);
		case 't'
          t{cntt} = t{cntt} * et(elem, val, s);
        case 'K'
          t{cntt} = t{cntt} * et(elem, val, s);
		case '|'
          t{cntt} = t{cntt} * et(elem, val, s);
		case 'x'
          t{cntt} = t{cntt} * et(elem, val, s);
		case 'X'
          t{cntt} = t{cntt} * et(elem, val, s);
		case '_'
          t{cntt} = t{cntt} * et(elem, val, s);
		case '='
          t{cntt} = t{cntt} * et(elem, val, s);
		case ']'
          t{cntt} = t{cntt} * et(elem, val, s);
		case '#'
          t{cntt} = t{cntt} * et(elem, val, s);
		case '*'
          t{cntt} = t{cntt} * et(elem, val, s);
		case 'U'
          t{cntt} = t{cntt} * et(elem, val, s);
		case 'u'
          t{cntt} = t{cntt} * et(elem, val, s);
		case 'Y'
          t{cntt} = t{cntt} * et(elem, val, s);
		case 'y'
          t{cntt} = t{cntt} * et(elem, val, s);
		case 'z'
          t{cntt} = t{cntt} * et(elem, val, s);
		case 'T'
          t{cntt} = t{cntt} * et(elem, val, s);
		case 'n'
          t{cntt} = t{cntt} * et(elem, val, s);
		case 'N'
          t{cntt} = t{cntt} * et(elem, val, s);
		case '?'
		  cntext = cntext + 1;
		  if (nargin >= 5)
            t{cntt} = t{cntt} * feval(callb, val, s, cntext);
		  endif;
		case '<'
		  if (cnt != swimlanes)
		    error("Illegal ladder network topology. Forks are allowed from the last swimlane only.");
		  else
		    tjun{cntt} = '<';
		    swimlanes = swimlanes + 1;
            t{cntt + 1} = eye(2);
            t{cntt + 2} = eye(2);
			cnt = 0;
		  endif;
		case '>'
		  if (cnt != swimlanes - 1)
		    error("Illegal ladder network topology. Join's swimlane must match the corresponding fork.");
		  else
		    swimlanes = swimlanes - 1;
			if (strcmp(tjun{cntt - 1}, '<'))
			  t{cntt - 1} = t{cntt - 1} * ey2t(et2y(t{cntt}) + et2y(t{cntt + 1}));
			elseif (strcmp(tjun{cntt - 1}, '{'))
			  t{cntt - 1} = t{cntt - 1} * ef2t(et2f(t{cntt}) + et2f(t{cntt + 1}));
			else
			  error("Illegal convergence.");
			endif;
			t(cntt + 1) = [];
			t(cntt) = [];
			tjun(cntt - 1) = [];
			cnt = 0;
		  endif;
		case '{'
		  if (cnt != swimlanes)
		    error("Illegal ladder network topology. Forks are allowed from the last swimlane only.");
		  else
		    tjun{cntt} = '{';
		    swimlanes = swimlanes + 1;
            t{cntt + 1} = eye(2);
            t{cntt + 2} = eye(2);
			cnt = 0;
		  endif;
		case '}'
		  if (cnt != swimlanes - 1)
		    error("Illegal ladder network topology. Join's swimlane must match the corresponding fork.");
		  else
		    swimlanes = swimlanes - 1;
			if (strcmp(tjun{cntt - 1}, '<'))
			  t{cntt - 1} = t{cntt - 1} * eh2t(et2h(t{cntt}) + et2h(t{cntt + 1}));
			elseif (strcmp(tjun{cntt - 1}, '{'))
			  t{cntt - 1} = t{cntt - 1} * ez2t(et2z(t{cntt}) + et2z(t{cntt + 1}));
			else
			  error("Illegal convergence.");
			endif;
			t(cntt + 1) = [];
			t(cntt) = [];
			tjun(cntt - 1) = [];
			cnt = 0;
		  endif;
        case '-'
          error("Illegal topology.");
      endswitch;
    endfor;
 
    tm = t{1};
	
endfunction