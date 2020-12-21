function dbm = ei2dbm(i, r)
    if (nargin != 2)
      printf("\nei2dbm(i, r): computes power in dBm based on current and impedance.\n");
      printf("  i - current\n");
      printf("  r - load/source impedance\n");
      printf("\n");
      printf("returns: power in dBm\n");
      return;
    endif;
	dbm = 10 * log(i ^ 2 * r) / log(10) + 30;
endfunction
