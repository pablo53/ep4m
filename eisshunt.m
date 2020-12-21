function [que] = eisshunt(elem)
  que = 0;
  if (nargin != 1)
    printf("eisshunt(elem): checks whether the element is a shunt one\n");
	printf("  elem = element code, i.e. character representing it\n");
	printf("\n");
	printf("returns: 1 - for a shunt element, 0 - otherwise\n");
	return;
  endif;
  
  switch (elem)
    case "c"
	  que = 1;
    case "r"
	  que = 1;
	case "l"
	  que = 1;
	case "k"
	  que = 1;
	case "f"
	  que = 1;
	case "b"
	  que = 1;
	case "|"
	  que = 1;
	case "_"
	  que = 1;
  endswitch;
endfunction