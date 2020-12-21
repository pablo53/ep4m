function [t, v] = eabcd2tv(tm)
  
  t = "";
  v = [];
  if (nargin != 1)
    printf("\neabcd2tv(tm): Converts ABCD matrix into its topology together with values\n");
	printf("  tm - 2x2 transmission (ABCD) matrix\n");
	printf("\n");
	printf("returns: [ topology, values ]\n");
	return;
  endif;
  
  t = "*";
  v = evalues(tm(1, 1), tm(1, 2), tm(2, 1), tm(2, 2));

endfunction