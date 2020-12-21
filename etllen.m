function [len] = etllen(vp, t)
  len = NaN;
  if (nargin != 2)
    printf("\netllen(vp, t): calculates transmission line length for a given velocity factor and time\n");
	printf("  vp - velocity factor of the transmission line as a fraction of c\n");
	printf("  t  - time the signal needs to reach the transmission line end\n");
	printf("  \n");
	printf("returns: [ length ]\n\n");
    return;
  endif;
  
  len = ec() * t * vp;
  
endfunction