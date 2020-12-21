function [c] = elinvill(a11, a12, a21, a22)
# returns: [ C - Linvill stability factor ]

  if (nargin != 1 && nargin != 4)
    printf("\nelinvill(a11, a12, a21, a22) or elinvill(a): calulates Linvill stability factor from ABCD transfer parameters\n");
	printf("  axy  - ABCD transfer parameters or ABCD transfer parameters matrix\n");
	printf("\n  returns: C - Linvill stability factor\n");
    return;
  endif;
  
  if (nargin <= 3)
    a22 = a11(2, 2);
    a12 = a11(1, 2);
    a21 = a11(2, 1);
    a11 = a11(1, 1);
  endif
  
  y = et2y( [ a11, a12; a21, a22 ] );
  c = abs(y(1, 2) * y(2, 1)) / (2 * real(y(1, 1)) * real(y(2, 2)) - real(y(1, 2) * y(2, 1)));
  
endfunction