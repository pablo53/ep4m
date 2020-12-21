function dbm = ev2dbm(up, r)
	# v - voltage
	# r - load/source impedance
	if (nargin != 1 && nargin != 2)
		printf("\nev2dbm(up, r): Converts voltage into dBm\n");
		printf("  up - voltage (when the next parameter r is provided) or power (when r not provided).\n");
		printf("  r - resistance\n");
		printf("\n");
		printf("returns: voltage/power expressed as dBm.\n");
		return;
	endif;
	if (nargin == 2)
		p = up ^ 2 / r;
	elseif (nargin == 1)
		p = up;
	endif;
	dbm = 10 * log10(p) + 30;
endfunction
