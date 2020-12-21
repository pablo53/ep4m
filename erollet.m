function [k] = erollet(s11, s12, s21, s22)
# returns: [ K - Rollet stability factor ]
  
  if (nargin != 4 && nargin != 1)
    printf("\nerollet(s11, s12, s21, s22) or erollet(s): calulates Rollet stability factor from S parameters\n");
	printf("  sxy - Scattering parameters or scattering parameters matrix\n");
	printf("\n  returns: K - Rollet stability factor\n");
    return;
  endif;
  if (nargin == 1)
    s22 = s11(2, 2);
    s12 = s11(1, 2);
    s21 = s11(2, 1);
    s11 = s11(1, 1);
  endif
  
  ds = s11 * s22 - s12 * s21;
  k = (1 + abs(ds) ^ 2 - abs(s11) ^ 2 - abs(s22) ^ 2) / (2 * abs(s21) * abs(s12));
  
endfunction