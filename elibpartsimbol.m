function [partsimb] = elibpartsimbol(partname)
  switch (partname)
    case "MSA1105"
	  partsimb = elibpartsimbol("MMIC");
	  partsimb{1} = "MSA1105";
    case "MSA2111"
	  partsimb = elibpartsimbol("MMIC");
	  partsimb{1} = "MSA2111";
    case "MMIC"
	  partsimb = { "MMIC", \
	               "              __|__",\
				   "          |---\\   /---|",\
				   "               \\ /",\
				   "                v",\
				   "                |" };
    case "NPN"
	  partsimb = elibpartsimbol("NPNE");
	  partsimb{1} = "NPNE";
    case "NPNE"
	  partsimb = { "NPNE", \
                   "           _____|", \
                   "        __|__", \
				   "  |____|/   \\___", \
				   "  |             |" };
    case "NPNC"
	  partsimb = { "NPNC", \
                   "           _____|", \
                   "        __|__", \
				   "  |_____/   \\|__", \
				   "  |             |" };
    case "NPNB"
	  partsimb = { "NPNB", \
                   "           _____|", \
                   "         _|  ", \
				   "        |/|     ", \
				   "  |-----|       ", \
				   "        |\\      ", \
                   "          |_____", \
                   "                |" };
    case "FET"
	  partsimb = elibpartsimbol("FETS");
	  partsimb{1} = "FETS";
    case "FETS"
	  partsimb = { "FETS", \
                   "         _______|", \
                   "        |", \
                   "       _v_____", \
				   "  |_____|   |___", \
				   "  |             |" };
    case "FETD"
	  partsimb = { "FETD", \
                   "             ___|", \
                   "            |", \
                   "       _____v_", \
				   "  |_____|   |___", \
				   "  |             |" };
    case "FETG"
	  partsimb = { "FETG", \
                   "           _____|", \
                   "          |  ", \
				   "  |---->|-+     ", \
				   "        |       ", \
				   "        |-+     ", \
                   "          |_____", \
                   "                |" };
    case "BF199"
	  partsimb = elibpartsimbol("NPN");
	  partsimb{1} = "BF199";
    case "BF240"
	  partsimb = elibpartsimbol("NPN");
	  partsimb{1} = "BF240";
    case "BF245"
	  partsimb = elibpartsimbol("FET");
	  partsimb{1} = "BF245";
    case "BF245A"
	  partsimb = elibpartsimbol("FET");
	  partsimb{1} = "BF245A";
    case "BF245B"
	  partsimb = elibpartsimbol("FET");
	  partsimb{1} = "BF245B";
    case "BF245C"
	  partsimb = elibpartsimbol("FET");
	  partsimb{1} = "BF245C";
	otherwise
	  partsimb = {};
  endswitch;
endfunction
