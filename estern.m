function [k] = estern(a11, a12, a21, a22, zin, zout)
# returns: [ K - Stern stability factor ]

  if (nargin < 1 || nargin > 6)
    printf("\nestern(a11, a12, a21, a22[, zin[, zout]]) or estern(a[, zin[, zout]]): calulates Stern stability factor from ABCD transfer parameters\n");
	printf("  axy  - ABCD transfer parameters or ABCD transfer parameters matrix\n");
	printf("  zin  - Source impedance (if provided)\n");
	printf("  zout - Load impedance (if provided and different from source impedance)\n");
	printf("\n  returns: K - Stern stability factor\n");
    return;
  endif;
  if (nargin <= 3)
	if (nargin >= 2)
	  zin = a12; # remap
	  if (nargin >= 3)
	    zout = a21; # remap
	  else
	    zout = zin;
	  endif;
	else
	  zin = Inf;
	  zout = Inf;
	endif;
    a22 = a11(2, 2);
    a12 = a11(1, 2);
    a21 = a11(2, 1);
    a11 = a11(1, 1);
  endif
  if (nargin == 4)
    zin = Inf;
    zout = Inf;
  elseif (nargin == 5)
    zout = zin;
  endif;
  
  y = et2y( [ a11, a12; a21, a22 ] );
  
  k = 2 * (y(1, 1) + 1 / zin) * (y(2, 2) + 1 / zout) / (abs(y(1, 2) * y(2, 1)) + real(y(1, 2) * y(2, 1)));
  
endfunction