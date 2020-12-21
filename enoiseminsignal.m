function [dbm] = enoiseminsignal(fdb, gdb, temp, minrat, f1, f2)
  if (nargin != 5 && nargin != 6)
    printf("\nenoiseminsignal(fdb, gdb, temp, minrat, f1[, f2]): calculates minimal signal for the required signal-to-noise ratio.\n");
	printf("  fdb  - noise factor of each stage in dB (vector)\n")
	printf("  gdb  - gain of each stage in dB (vector)\n")
	printf("  temp - temperature in C\n")
	printf("  minrat - required signal-to-noise ratio [dB]\n")
	printf("  f1   - lower band of the frequency (when f2 provided) or bandwith (when f2 not provided)\n");
	printf("  f2   - upper band of the frequency (optional)\n");
	printf("\n");
	printf("returns: minimal required input signal in dBm\n");
	return;
  endif;
  nfdb = enoisefactor(fdb, gdb);
  if (f1 == NaN)
    f1 = 0;
  end;
  if (nargin < 6)
    f2 = f1;
	f1 = 0;
  endif;
  b = abs(f1 - f2);
  k = temp + 273.15;
  n0 = 10 * log10(eboltzman() * k * b);
  dbm = nfdb + n0 + minrat + 30;
endfunction