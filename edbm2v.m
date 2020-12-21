function up = edbm2v(pdbm, r)
	if (nargin != 1 && nargin != 2)
		printf("\nedbm2v(pdbm, r): Converts voltage/power expressed in dBm into Volts\n");
		printf("  dbm - voltage/power in dBm\n");
		printf("  r   - resistance\n");
		printf("\n");
		printf("returns: voltage expressed in V (when r provided) or power expressed in Watts (when r not provided).\n");
		return;
	endif;
	# pdbm - power (dBm, equals to 1mW)
	# r - load/source impedance
	p = 0.001 * 10 ^ (pdbm / 10);
	if (nargin == 1)
		up = p;
	elseif (nargin == 2)
		up = sqrt(r * p);
	endif;
endfunction
