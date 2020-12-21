function [jj] = ej(mag, deg)
# mag - magnitude
# deg - angle [degrees]
# returns: [ complex_value ]
  
  if (nargin != 2)
    printf("\nej(mag, deg): calculates complex number from magnitude and angle\n");
	printf("  mag - magnitude\n");
	printf("  deg - angle [degrees]\n");
	printf("\n  returns: [ complex_value ]\n");
    return;
  endif;
  
  jj = mag * cos(2 * pi * deg / 360) + i * mag * sin(2 * pi * deg / 360);
  
endfunction