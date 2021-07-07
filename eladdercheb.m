function [topology, vals, r] = eladdercheb(poles, df, xtalvals)

  if (nargin != 3)
    printf("%s\n", "eladdercheb(poles, df, c0, ck, lk): computes element values for a crystal ladder filter (Chebyshev)");
    printf("  %s\n", "poles - number of crystal oscillators in the ladder filter");
    printf("  %s\n", "df - desired bandwith [Hz]");
    printf("  %s\n", "xtalvals - crystal oscillator parameters (as per ecrystal(..) output)");
    printf("%s\n", "returns:");
    printf("  %s\n", "topology - net topology");
    printf("  %s\n", "vals - element values");
    printf("  %s\n", "r - input and output impedance");
    return;
  endif;

  rk = xtalvals(1);
  lk = xtalvals(2);
  ck = xtalvals(3);
  c0 = xtalvals(4);
  fs = 1 / (2 * pi * sqrt(lk * ck));
  switch (poles)
    case 4
      r = 5.4827 * lk * df;
      c1 = [0.0781 / (fs * sqrt(lk * r * df)); NaN; NaN; NaN];
      c2 = [0.0383 / (lk * fs * df); NaN; NaN; NaN];
      topology = "CXcXcXcXC";
      vals = [c2, xtalvals, c1, xtalvals, c2, xtalvals, c1, xtalvals, c2];
    case 8
      r = 4.6889 * lk * df;
      c1 = [0.0779 / (fs * sqrt(lk * r * df)); NaN; NaN; NaN];
      c2 = [0.0442 / (lk * fs * df); NaN; NaN; NaN];
      c3 = [0.0488 / (lk * fs * df); NaN; NaN; NaN];
      c4 = [0.0467 / (lk * fs * df); NaN; NaN; NaN];
      c5 = [1 / ((1 / c1) + (1 / c2) - (1 / c3) - (1 / c4)); NaN; NaN; NaN];
      c6 = [1 / ((1 / c1) - (1 / c3)); NaN; NaN; NaN];
      topology = "CXcXcXCcCXcXCxCXcXcXC"
      vals = [c2, xtalvals, c1, xtalvals, c2, xtalvals, c6, c3, c5, xtalvals, c4, xtalvals, c5, c3, c6, xtalvals, c2, xtalvals, c1, xtalvals, c2];
    otherwise
      printf("incorrect number of poles");
  endswitch;

endfunction
