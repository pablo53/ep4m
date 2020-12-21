function [t, v] = enbimpinv(f0, gm)
# returns: [ t, v ] - topology and values
  
  t = "";
  v = [];
  
  if (nargin != 2)
    printf("\nenbimpinv(f0, gm): creates a narrow band impedance inverter mesh for a given frequency and transconductance\n");
	printf("                   Warning: Shunt capacitances are always calulated as negative values!\n");
	printf("                   Rememeber to reduce them with neighbouring capacitances, which must exist.\n");
	printf("  f0 - center frequency\n");
	printf("  gm - required transconductance\n");
	printf("\n  returns: [ t, v ] - topology and values\n");
    return;
  endif;
  
  t = "cCc";
  c = gm / (2 * pi * f0);
  v = [ evalues(-c) evalues(c) evalues(-c) ];
  
endfunction