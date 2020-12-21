function f = efreqrc(r, c)
  if (nargin != 2)
    printf("\nefreqrc(r, c): Calculates the characteristic frequency of an RC circuit.\n");
	printf("  r - resistance\n");
	printf("  c - capacitance\n");
	printf("\n");
	printf("returns: [ frequency ] \n");
    return;
  endif;

  f = 1 / (2 * pi * r * c);
  
endfunction