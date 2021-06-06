function [r, c1, c2, c3, c4, c5, c6] = eladderbutt(poles, df, c0, ck, lk)

  if (nargin != 5)
    printf("%s\n", "eladdercheb(poles, df, c0, ck, lk): computes element values for a crystal ladder filter (Butterwoth)");
    printf("  %s\n", "poles - number of crystal oscillators in the ladder filter");
    printf("  %s\n", "df - desired bandwith [Hz]");
    printf("  %s\n", "c0 - crystal oscillators parallel capacitance");
    printf("  %s\n", "ck - crystal oscillator series capacitance");
    printf("  %s\n", "lk - crystal oscillator series inductance");
    printf("%s\n", "returns:");
    printf("  %s\n", "r - input and output impedance");
    printf("  %s\n", "c1, c2, ... - shunt and series capacitors (as per a particular design)");
    return;
  endif;

  fs = 1 / (2 * pi * sqrt(lk * ck));
  switch (poles)
    case 4
      r = 8.2090 * lk * df;
      c1 = 0.0863 / (fs * sqrt(lk * r * df));
      c2 = 0.0468 / (lk * fs * df);
    case 8
      r = 16.1025 * lk * df;
      c1 = 0.0669 / (fs * sqrt(lk * r * df));
      c2 = 0.0344 / (lk * fs * df);
      c3 = 0.0457 / (lk * fs * df);
      c4 = 0.0497 / (lk * fs * df);
      c5 = 1 / ((1 / c1) + (1 / c2) - (1 / c3) - (1 / c4));
      c5 = 1 / ((1 / c1) - (1 / c3));
    otherwise
      printf("incorrect number of poles");
  endswitch;

endfunction
