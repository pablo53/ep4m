function [mag] = emag(s11, s12, s21, s22)
# returns: [ MAG - Maximum available gain in dB ]
  
  if (nargin != 4)
    printf("\nemag(s11, s12, s21, s22): calulates maximum available gain [dB] from S parameters\n");
	printf("  sxy - Scattering parameters\n");
	printf("\n  returns: MAG - Maximum available gain [dB]\n");
    return;
  endif;
  
  ds = s11 * s22 - s12 * s21;
  b1 = 1 + abs(s11) ^ 2 - abs(s22) ^ 2 - abs(ds) ^ 2;
  k = erollet(s11, s12, s21, s22);
  mag = 10 * log10(abs(s21) / abs(s12)) + 10 * log10(abs(k - sign(b1) * sqrt(k ^ 2 - 1)));
  
endfunction