function [cntl, cntr, cntc, cntt, cntnet, cnts, cntxtal, cntic, lineno] = eprintelem(elem, vals, sym, oldcntl, oldcntr, oldcntc, oldcntt, oldcntnet, oldcnts, oldcntxtal, oldcntic, cbpartname, lineno)
    cntl = oldcntl;
    cntr = oldcntr;
    cntc = oldcntc;
    cntxtal = oldcntxtal;
    cntic = oldcntic;
	cntt = oldcntt;
	cntnet = oldcntnet;
	cnts = oldcnts;
	if (sym)
	  strO = "o";
	  strI = "|";
	  strP = "+";
	  strS = "/";
	  strB = "\\";
	  str0 = "+";
	else
	  strO = " ";
	  strI = " ";
	  strP = " ";
	  strS = " ";
	  strB = " ";
	  str0 = "|";
	endif;
	if (nargin < 13)
	  lineno = 1;
	  while (lineno > 0)
		[cntl, cntr, cntc, cntt, cntnet, cnts, cntxtal, cntic, lineno] = eprintelem(elem, vals, sym, cntl, cntr, cntc, cntt, cntnet, cnts, cntxtal, cntic, cbpartname, lineno);
		printf("\n");
	  endwhile;
	elseif (columns(elem) > 1)
	  newlineno = 0;
	  cnt = 0;
	  for e = elem
	    cnt = cnt + 1;
	    [cntl, cntr, cntc, cntt, cntnet, cnts, cntxtal, cntic, lineno1] = eprintelem(e, vals(:, cnt), sym, cntl, cntr, cntc, cntt, cntnet, cnts, cntxtal, cntic, cbpartname, lineno);
		if (lineno1 > 0)
		  newlineno = lineno1;
		endif;
	  endfor;
	  lineno = newlineno;
	else
      switch (elem)
        case 'i'
		  switch (lineno)
		    case 1
              printf ( " %s                o             ", strO);
			  lineno = lineno + 1;
			case 2
              printf ( " %s                |             ", strI);
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'o'
		  switch (lineno)
		    case 1
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
			case 2
              printf ( " %s                o             ", strO);
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'c'
		  switch (lineno)
		    case 1
              cntc = cntc + 1;
              printf ( " %s       C%-3i     |             ", strI, cntc);
			  lineno = lineno + 1;
			case 2
              printf ( " %s-------||-------+             ", str0);
			  lineno = lineno + 1;
			case 3
              printf ( " %s      %-5s     |             ", strI, efmtstr(vals(1), "F"));
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'C'
		  switch (lineno)
		    case 1
			  cntc = cntc + 1;
			  printf (" %s           C%-3i |             ", strI, cntc);
			  lineno = lineno + 1;
		    case 2
			  printf (" %s               ===            ", strI);
			  lineno = lineno + 1;
		    case 3
			  printf (" %s          %-5s |             ", strI, efmtstr(vals(1), "F"));
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'l'
		  switch (lineno)
		    case 1
			  cntl = cntl + 1;
			  printf ( " %s       L%-3i     |             ", strI, cntl);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s-----(_(_(_)----+             ", str0);
			  lineno = lineno + 1;
		    case 3
			  printf ( " %s      %-5s     |             ", strI, efmtstr(vals(1), "H"));
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'L'
		  switch (lineno)
		    case 1
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s               (_             ", strI);
			  lineno = lineno + 1;
		    case 3
			  cntl = cntl + 1;
			  printf ( " %s          L%-3i (_             ", strI, cntl);
			  lineno = lineno + 1;
		    case 4
			  printf ( " %s         %-5s (_             ", strI, efmtstr(vals(1), "H"));
			  lineno = lineno + 1;
		    case 5
			  printf ( " %s                |             ", strI);
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'r'
		  switch (lineno)
		    case 1
			  cntr = cntr + 1;
			  printf ( " %s       R%-3i     |             ", strI, cntr);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s-----[_____]----+             ", str0);
			  lineno = lineno + 1;
		    case 3
			  printf ( " %s      %-5s     |             ", strI, efmtstr(vals(1), "O"));
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'R'
		  switch (lineno)
		    case 1
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s               [ ]            ", strI);
			  lineno = lineno + 1;
		    case 3
			  cntr = cntr + 1;
			  printf ( " %s          R%-3i | |            ", strI, cntr);
			  lineno = lineno + 1;
		    case 4
			  printf ( " %s         %-5s |_|            ", strI, efmtstr(vals(1), "O"));
			  lineno = lineno + 1;
		    case 5
			  printf ( " %s                |             ", strI);
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'b'
		  switch (lineno)
		    case 1
			  cntc = cntc + 1;
			  cntl = cntl + 1;
			  printf (" %s   C%-3i  L%-3i   |             ", strI, cntc, cntl);
			  lineno = lineno + 1;
		    case 2
			  printf (" %s---||--(_(_(_)--+             ", str0);
			  lineno = lineno + 1;
		    case 3
			  printf (" %s  %-5s %-5s   |             ", strI, efmtstr(vals(1), "F"), efmtstr(vals(2), "H"));
			  lineno = 0;
			otherwise
              printf (" %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'B'
		  switch (lineno)
		    case 1
			  printf (" %s               _+_            ", strI);
			  lineno = lineno + 1;
		    case 2
			  printf (" %s              |   |           ", strI);
			  lineno = lineno + 1;
		    case 3
			  cntl = cntl + 1;
			  cntc = cntc + 1;
			  printf (" %s        L%-3i (_   | C%-3i      ", strI, cntl, cntc);
			  lineno = lineno + 1;
		    case 4
			  printf (" %s             (_  ===          ", strI);
			  lineno = lineno + 1;
		    case 5
			  printf (" %s       %5s (_   | %-5s     ", strI, efmtstr(vals(1), "H"), efmtstr(vals(2), "F"));
			  lineno = lineno + 1;
		    case 6
			  printf (" %s              |_ _|           ", strI);
			  lineno = lineno + 1;
		    case 7
			  printf (" %s                +             ", strI);
			  lineno = 0;
			otherwise
              printf (" %s                |             ", strI);
			  lineno = 0;
		  endswitch;
		case 'f'
		  switch (lineno)
		    case 1
			  cntc = cntc + 1;
			  cntr = cntr + 1;
			  printf ( " %s   C%-3i   R%-3i  |             ", strI, cntc, cntr);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s---||---[____]--+             ", str0);
			  lineno = lineno + 1;
		    case 3
			  printf ( " %s  %-5s  %-5s  |             ", strI, efmtstr(vals(1), "F"), efmtstr(vals(2), "O"));
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'F'
		  switch (lineno)
		    case 1
			  printf ( " %s               _+_            ", strI);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s              |   |           ", strI);
			  lineno = lineno + 1;
		    case 3
			  cntr = cntr + 1;
			  cntc = cntc + 1;
			  printf ( " %s        R%-3i [ ]  | C%-3i      ", strI, cntr, cntc);
			  lineno = lineno + 1;
		    case 4
			  printf ( " %s             | | ===          ", strI);
			  lineno = lineno + 1;
		    case 5
			  printf ( " %s       %-5s |_|  | %-5s     ", strI, efmtstr(vals(1), "O"), efmtstr(vals(2), "F"));
			  lineno = lineno + 1;
		    case 6
			  printf ( " %s              |_ _|           ", strI);
			  lineno = lineno + 1;
		    case 7
			  printf ( " %s                +             ", strI);
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'k'
		  switch (lineno)
		    case 1
			  cntl = cntl + 1;
			  cntr = cntr + 1;
			  printf ( " %s   L%-3i    R%-3i |             ", strI, cntl, cntr);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s-(_(_(_)-[____]-+             ", str0);
			  lineno = lineno + 1;
		    case 3
			  printf ( " %s  %-5s   %-5s |             ", strI, efmtstr(vals(1), "H"), efmtstr(vals(2), "O"));
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'K'
		  switch (lineno)
		    case 1
			  printf ( " %s               _+_            ", strI);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s              |   |           ", strI);
			  lineno = lineno + 1;
		    case 3
			  printf ( " %s             (_  [ ]          ", strI);
			  lineno = lineno + 1;
		    case 4
			  cntl = cntl + 1;
			  cntr = cntr + 1;
			  printf ( " %s        L%-3i (_  | |  R%-3i    ", strI, cntl, cntr);
			  lineno = lineno + 1;
		    case 5
			  printf ( " %s       %-5s (_  |_| %-5s    ", strI, efmtstr(vals(1), "H"), efmtstr(vals(2), "O"));
			  lineno = lineno + 1;
		    case 6
			  printf ( " %s              |_ _|           ", strI);
			  lineno = lineno + 1;
		    case 7
			  printf ( " %s                +             ", strI);
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 't'
		  switch (lineno)
		    case 1
			  cntl = cntl + 1;
			  printf(" %s  L%-3i %-5s    |             ", strI, cntl, efmtstr(vals(1), "H"));
			  lineno = lineno + 1;
		    case 2
			  printf(" %s----(_(_(_)-----              ", str0);
			  lineno = lineno + 1;
		    case 3
			  printf("     : _ _ _                    ");
			  lineno = lineno + 1;
		    case 4
			  printf(" %s----( ) ) )-----              ", str0);
			  lineno = lineno + 1;
		    case 5
			  cntl = cntl + 1;
			  printf(" %s  L%-3i %-5s    |             ", strI, cntl, efmtstr(vals(2), "H"));
			  lineno = 0;
			otherwise
              printf(" %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'v'
		  switch (lineno)
			case 1
			     printf(" %s           %-4s |             ", strI, efmtstr(vals(1), ""));
				lineno = lineno + 1;
			case 2
				cntic = cntic + 1;
				printf (" %s           -----+----- IC%-3i  ", strI, cntic);
				lineno = lineno + 1;
			case 3
				printf (" %s           \\  %-6s /        ", strI, efmtstr(vals(3), "*"));
				lineno = lineno + 1;
			case 4
				printf (" %s            \\       /         ", strI);
				lineno = lineno + 1;
			case 5
				printf (" %s             \\     /          ", strI);
				lineno = lineno + 1;
			case 6
				printf (" %s              \\   /           ", strI);
				lineno = lineno + 1;
			case 7
				printf (" %s               \\ /            ", strI);
				lineno = lineno + 1;
			case 8
				printf (" %s           %-4s v             ", strI, efmtstr(vals(2), ""));
				lineno = lineno + 1;
			case 9
				printf (" %s                |             ", strI);
				lineno = 0;
			otherwise
                printf (" %s                |             ", strI);
				lineno = 0;
		  endswitch;
        case '#'
		  switch (lineno)
		    case 1
			  cntt = cntt + 1;
			  printf ( " %s   TL%-3i        |             ", strI, cntt);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s--            --+             ", str0);
			  lineno = lineno + 1;
			case 3
              printf ( "___|____________|___            ", strI);
			  lineno = lineno + 1;
		    case 4
			  printf ( "|    %-6s        |            ", efmtstr(vals(1), "O"));
			  lineno = lineno + 1;
		    case 5
			  printf ( "|    %-6s        |            ", efmtstr(vals(2), "s"));
			  lineno = lineno + 1;
		    case 6
			  printf ( "|__________________|            ", strI);
			  lineno = lineno + 1;
			case 7
              printf ( "   |            |               ");
			  lineno = lineno + 1;
		    case 8
			  printf ( " %s--            --+             ", str0);
			  lineno = lineno + 1;
			case 9
              printf ( " %s                |             ", strI);
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case '_'
		  switch (lineno)
		    case 1
			  cntt = cntt + 1;
			  printf ( " %s   TL%-3i        |             ", strI, cntt);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s---_        _---+             ", str0);
			  lineno = lineno + 1;
		    case 3
			  printf ( " %s   | %-6s |   |             ", strI, efmtstr(vals(1), "O"));
			  lineno = lineno + 1;
		    case 4
			  printf ( " %s   | %-6s |   |             ", strI, efmtstr(vals(2), "s"));
			  lineno = lineno + 1;
		    case 5
			  printf ( " %s   |________|   |             ", strI);
			  lineno = lineno + 1;
		    case 6
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
			case 7
              printf ( " %s                |             ", strI);
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case '|'
		  switch (lineno)
		    case 1
			  cntt = cntt + 1;
			  printf ( " %s   TL%-3i        |             ", strI, cntt);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s---_        _---+             ", str0);
			  lineno = lineno + 1;
		    case 3
			  printf ( " %s   | %-6s |   |             ", strI, efmtstr(vals(1), "O"));
			  lineno = lineno + 1;
		    case 4
			  printf ( " %s   | %-6s |   |             ", strI, efmtstr(vals(2), "s"));
			  lineno = lineno + 1;
		    case 5
			  printf ( " %s   |        |   |             ", strI);
			  lineno = lineno + 1;
		    case 6
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
			case 7
              printf ( " %s                |             ", strI);
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case '='
		  switch (lineno)
		    case 1
			  cntt = cntt + 1;
			  printf ( " %s   TL%-3i        |             ", strI, cntt);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
		    case 3
			  printf ( " %s       %-6s |-------        ", strI, efmtstr(vals(1), "O"));
			  lineno = lineno + 1;
		    case 4
			  printf ( " %s       %-6s                 ", strI, efmtstr(vals(2), "s"));
			  lineno = lineno + 1;
		    case 5
			  printf ( " %s                              ", strI);
			  lineno = lineno + 1;
		    case 6
			  printf ( " %s              |-------        ", strI);
			  lineno = lineno + 1;
			case 7
              printf ( " %s                |             ", strI);
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case ']'
		  switch (lineno)
		    case 1
			  cntt = cntt + 1;
			  printf ( " %s   TL%-3i        |             ", strI, cntt);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
		    case 3
			  printf ( " %s       %-6s |-------+       ", strI, efmtstr(vals(1), "O"));
			  lineno = lineno + 1;
		    case 4
			  printf ( " %s       %-6s         |       ", strI, efmtstr(vals(2), "s"));
			  lineno = lineno + 1;
		    case 5
			  printf ( " %s                      |       ", strI);
			  lineno = lineno + 1;
		    case 6
			  printf ( " %s              |-------+       ", strI);
			  lineno = lineno + 1;
			case 7
              printf ( " %s                |             ", strI);
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'U'
		  switch (lineno)
		    case 1
			  cnts = cnts + 1;
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
		    case 3
			  printf ( " %s  SRC%-3i                      ", strI, cnts);
			  lineno = lineno + 1;
		    case 4
			  printf ( " %s         / \\                  ", strI);
			  lineno = lineno + 1;
		    case 5
			  printf ( " %s________/ _ \\___              ", str0);
			  lineno = lineno + 1;
		    case 6
			  printf ( " %s        \\   /   |             ", str0);
			  lineno = lineno + 1;
		    case 7
			  printf ( " %s  %-6s \\ /    |             ", strI, efmtstr(vals(1), ""));
			  lineno = lineno + 1;
		    case 8
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'u'
		  switch (lineno)
		    case 1
			  cnts = cnts + 1;
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s________________|             ", str0);
			  lineno = lineno + 1;
		    case 3
			  printf ( " %s  SRC%-3i                      ", str0, cnts);
			  lineno = lineno + 1;
		    case 4
			  printf ( " %s         / \\                  ", strI);
			  lineno = lineno + 1;
		    case 5
			  printf ( " %s________/ _ \\___              ", str0);
			  lineno = lineno + 1;
		    case 6
			  printf ( " %s        \\   /   |             ", str0);
			  lineno = lineno + 1;
		    case 7
			  printf ( " %s  %-6s \\ /    |             ", strI, efmtstr(vals(1), ""));
			  lineno = lineno + 1;
		    case 8
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'Y'
		  switch (lineno)
		    case 1
			  cnts = cnts + 1;
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
		    case 3
			  printf ( " %s  SRC%-3i                      ", strI, cnts);
			  lineno = lineno + 1;
		    case 4
			  printf ( " %s        // \\\\                 ", strI);
			  lineno = lineno + 1;
		    case 5
			  printf ( " %s_______// _ \\\\__              ", str0);
			  lineno = lineno + 1;
		    case 6
			  printf ( " %s       \\\\   //  |             ", str0);
			  lineno = lineno + 1;
		    case 7
			  printf ( " %s %-6s \\\\ //   |             ", strI, efmtstr(vals(1), ""));
			  lineno = lineno + 1;
		    case 8
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'y'
		  switch (lineno)
		    case 1
			  cnts = cnts + 1;
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s________________|             ", str0);
			  lineno = lineno + 1;
		    case 3
			  printf ( " %s  SRC%-3i                      ", str0, cnts);
			  lineno = lineno + 1;
		    case 4
			  printf ( " %s        // \\\\                 ", strI);
			  lineno = lineno + 1;
		    case 5
			  printf ( " %s_______// _ \\\\__              ", str0);
			  lineno = lineno + 1;
		    case 6
			  printf ( " %s       \\\\   //  |             ", str0);
			  lineno = lineno + 1;
		    case 7
			  printf ( " %s %-6s \\\\ //   |             ", strI, efmtstr(vals(1), ""));
			  lineno = lineno + 1;
		    case 8
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'z'
		  switch (lineno)
		    case 1
			  cnts = cnts + 1;
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s  SRC%-3i        |             ", strI, cnts);
			  lineno = lineno + 1;
		    case 3
			  printf ( " |________________|             ");
			  lineno = lineno + 1;
			case 4
			  printf ( " |     \\____/       |           ");
			  lineno = lineno + 1;
			case 5
			  printf ( " %s      ____ %-6s |           ", strI, efmtstr(vals(1), ""));
			  lineno = lineno + 1;
			case 6
			  printf ( " |_____/____\\_____ \\|/          ");
			  lineno = lineno + 1;
			case 7
			  printf ( " |                |             ");
			  lineno = lineno + 1;
			case 8
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'T'
		  switch (lineno)
		    case 1
			  cnts = cnts + 1;
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s  SRC%-3i        |             ", strI, cnts);
			  lineno = lineno + 1;
			case 3
			  printf ( " %s      ____      |             ", strI);
			  lineno = lineno + 1;
		    case 4
			  printf ( " |_____/    \\_____|             ");
			  lineno = lineno + 1;
			case 5
			  printf ( " |  %+6s                      ", efmtstr(vals(1), ""));
			  lineno = lineno + 1;
			case 6
			  printf ( " |_____  : 1 _____              ");
			  lineno = lineno + 1;
			case 7
			  printf ( " |     \\____/     |             ");
			  lineno = lineno + 1;
			case 8
			  printf ( " %s                |             ", strI);
			  lineno = lineno + 1;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'n'
		  switch (lineno)
		    case 1
			  cnts = cnts + 1;
			  printf ( " %s  SRC%-3i        |             ", strI, cnts);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s--            --+             ", str0);
			  lineno = lineno + 1;
			case 3
              printf ( "___|____________|___            ");
			  lineno = lineno + 1;
		    case 4
			  printf ( "|                  |            ");
			  lineno = lineno + 1;
		    case 5
			  printf ( "|    %-6s        |            ", efmtstr(vals(1), ""));
			  lineno = lineno + 1;
		    case 6
			  printf ( "|      N.I.C.      |            ");
			  lineno = lineno + 1;
		    case 7
			  printf ( " \\                /             ");
			  lineno = lineno + 1;
		    case 8
			  printf ( "  \\______________/              ", strI);
			  lineno = lineno + 1;
			case 9
              printf ( "   |            |               ");
			  lineno = lineno + 1;
		    case 10
			  printf ( " %s--            --+             ", str0);
			  lineno = lineno + 1;
			case 11
              printf ( " %s                |             ", strI);
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case 'N'
		  switch (lineno)
		    case 1
			  cnts = cnts + 1;
			  printf ( " %s  SRC%-3i        |             ", strI, cnts);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s--            --+             ", str0);
			  lineno = lineno + 1;
			case 3
              printf ( "   |____________|___            ");
			  lineno = lineno + 1;
		    case 4
			  printf ( "  /                |            ");
			  lineno = lineno + 1;
		    case 5
			  printf ( " /   %-6s        |            ", efmtstr(vals(1), ""));
			  lineno = lineno + 1;
		    case 6
			  printf ( "|      N.I.V.      |            ");
			  lineno = lineno + 1;
		    case 7
			  printf ( "|                 /             ");
			  lineno = lineno + 1;
		    case 8
			  printf ( "|________________/              ", strI);
			  lineno = lineno + 1;
			case 9
              printf ( "   |            |               ");
			  lineno = lineno + 1;
		    case 10
			  printf ( " %s--            --+             ", str0);
			  lineno = lineno + 1;
			case 11
              printf ( " %s                |             ", strI);
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case '*'
		  switch (lineno)
		    case 1
			  cntnet = cntnet + 1;
			  printf ( " %s   NET%-3i       |             ", strI, cntnet);
			  lineno = lineno + 1;
		    case 2
			  printf ( " %s   __________   |             ", strI);
			  lineno = lineno + 1;
		    case 3
			  printf ( " %s---|        |---+             ", str0);
			  lineno = lineno + 1;
		    case 4
			  printf ( " %s A | %-6s |                 ", strI, efmtstr(vals(1), "S"));
			  lineno = lineno + 1;
		    case 5
			  printf ( " %s B | %-6s |                 ", strI, efmtstr(vals(2), "S"));
			  lineno = lineno + 1;
		    case 6
			  printf ( " %s C | %-6s |                 ", strI, efmtstr(vals(3), "S"));
			  lineno = lineno + 1;
		    case 7
			  printf ( " %s D | %-6s |                 ", strI, efmtstr(vals(4), "S"));
			  lineno = lineno + 1;
		    case 8
			  printf ( " %s---|________|---+             ", str0);
			  lineno = lineno + 1;
			case 9
              printf ( " %s  ABCD matrix   |             ", strI);
			  lineno = 0;
			otherwise
              printf ( " %s                |             ", strI);
			  lineno = 0;
		  endswitch;
        case '?'
		  oneln = false;
		  if (is_sq_string(feval(cbpartname, vals, cntnet)) || is_dq_string(feval(cbpartname, vals, cntnet)))
		    oneln = true;
		  endif;
		  if (oneln)
		    pname = [ feval(cbpartname, vals, cntnet) '' ];
		  else
		    parts = size(feval(cbpartname, vals, cntnet), 2);
			if (parts == 0)
			  oneln = true;
			  pname = "Unknown";
			else
			  if (parts == 1)
			    oneln = true;
			  endif;
		      pname = feval(cbpartname, vals, cntnet){1};
			endif;
		  endif;
		  if (oneln)
		    #pname = [ feval(cbpartname, vals, cntnet) '' ];
		    switch (lineno)
		      case 1
			    cntnet = cntnet + 1;
			    printf ( " %s   NET%-3i       |             ", strI, cntnet);
			    lineno = lineno + 1;
		      case 2
			    printf ( "  _________________            ");
			    lineno = lineno + 1;
		      case 3
			    printf ( " ( %-14s (             ", pname);
			    lineno = lineno + 1;
		      case 4
			    printf ( "  )________________)            ");
			    lineno = lineno + 1;
			  case 5
                printf ( " %s                |             ", strI);
			    lineno = 0;
			  otherwise
                printf ( " %s                |             ", strI);
			    lineno = 0;
		    endswitch;
		  else
		    #parts = size(feval(cbpartname, vals, cntnet), 2);
			if (lineno == 1)
		      #pname = feval(cbpartname, vals, cntnet){1};
			  cntnet = cntnet + 1;
			  printf ( " %s NET%-3i         | %-12s", strI, cntnet, pname);
			  if (parts > 1)
			    lineno = lineno + 1;
			  else
			    lineno = 0;
			  endif;
		    elseif (lineno > 1 && lineno <= parts)
		      psimb = feval(cbpartname, vals, cntnet){lineno};
			  printf ( " %s%-30s", strI, psimb);
			  if (lineno < parts)
			    lineno = lineno + 1;
			  else
			    lineno = 0;
			  endif;
			else
              printf ( " %s                |             ", strI);
		      lineno = 0;
			endif;
		  endif;
        case 'X'
          switch (lineno)
            case 1
			  cntxtal = cntxtal + 1;
              printf (" %s       XTAL%-3i _|_            ", strI, cntxtal);
			  lineno = lineno + 1;
            case 2
			  rk = vals(1);
			  lk = vals(2);
			  ck = vals(3);
			  c0 = vals(4);
			  fs = 1 / (2 * pi * sqrt(lk * ck));
			  printf (" %s    %-10s [ ]            ", strI, efmtstr(fs, "Hz"));
			  lineno = lineno + 1;
            case 3
              printf (" %s               -|-            ", strI);
			  lineno = 0;
            otherwise
              printf (" %s                |             ", strI);
			  lineno = 0;
          endswitch;
        case '-'
          printf (" %s----------------+             ", str0);
		  lineno = 0;
        case ' '
          printf (" %s                |             ", strI);
		  lineno = 0;
	    case '<'
		  switch (lineno)
		    case 1
	          printf (" %s%s               +\\____________________________                ", strP, strB);
			  lineno = lineno + 1;
		    case 2
	          printf (" %s %s              |                             \\               ", strI, strB);
			  lineno = lineno + 1;
		    case 3
			  if (sym)
	            printf (" |  \\_____________|_____________                 \\              ");
			  else
	            printf ("                  |                              \\              ");
			  endif;
			  lineno = lineno + 1;
		    case 4
	          printf (" %s                |             %s                 |             ", strI, strB);
			  lineno = 0;
			otherwise
              printf (" %s                |              %s                |             ", strI, strI);
			  lineno = 0;
		  endswitch;
	    case '>'
		  switch (lineno)
		    case 1
			  if (sym)
	            printf (" |   _____________|_____________/                 |             ");
			  else
	            printf ("                  |                               |             ");
			  endif;
			  lineno = lineno + 1;
		    case 2
	          printf (" %s  %s             |                              /              ", strI, strS);
			  lineno = lineno + 1;
		    case 3
	          printf (" %s %s              | ____________________________/               ", strI, strS);
			  lineno = lineno + 1;
		    case 4
	          printf (" %s%s               +/                                            ", strP, strS);
			  lineno = lineno + 1;
			otherwise
              printf (" %s                |                                             ", strI);
			  lineno = 0;
		  endswitch;
	    case '{'
		  switch (lineno)
		    case 1
	          printf (" %s                 \\____________________________                ", strI);
			  lineno = lineno + 1;
		    case 2
	          printf (" %s                                              \\               ", strI);
			  lineno = lineno + 1;
		    case 3
	          printf (" %s                 /------------\\                \\              ", strI);
			  lineno = lineno + 1;
		    case 4
	          printf (" %s                |              |                |             ", strI);
			  lineno = 0;
			otherwise
              printf (" %s                |              %s                |             ", strI, strI);
			  lineno = 0;
		  endswitch;
	    case '}'
		  switch (lineno)
		    case 1
	          printf ("                  |              |                |             ");
			  lineno = lineno + 1;
		    case 2
	          printf ("                   \\____________/                 |             ");
			  lineno = lineno + 1;
		    case 3
	          printf (" %s                                               /              ", strI);
			  lineno = lineno + 1;
		    case 4
	          printf (" %s                  ____________________________/               ", strI);
			  lineno = lineno + 1;
		    case 5
	          printf (" %s                 /                                            ", strI);
			  lineno = lineno + 1;
			otherwise
              printf (" %s                |                                             ", strI);
			  lineno = 0;
		  endswitch;
		otherwise
		  lineno = 0;
      endswitch;
	endif;
endfunction