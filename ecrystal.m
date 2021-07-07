function [ladder, vals] = ecrystal(fs, fr, fr1, c, rk, series)

  if ((nargin != 5) && (nargin != 6))
    printf("%s\n", "ecrystal(fs, fr, fr1, c, rk, series): get a ladder+values for a crystal oscillator based on its characteristics");
    printf("  %s\n", "fs - series frequency (the lowest frequency giving max throughput)");
    printf("  %s\n", "fr - shunt frequency (the highest frequency giving min throughput)");
    printf("  %s\n", "fr1 - shifted shunt frequency (in the middle between fr and fs, after adding a capacitor in parallel with the crystal oscillator) giving shifted min throughput");
    printf("  %s\n", "c - parallel capacitance added to compute fr1");
    printf("  %s\n", "rk - series resistance");
    printf("  %s\n", "series - series oscillator, if true (default); shunt otherwise");
    return;
  endif;

  if (nargin < 6)
    series = true
  endif;

  [c0, ck, lk] = ecrystalparams(fs, fr, fr1, c)
  if (series)
    ladder = "X";
  else
    ladder = "x";
  endif;
  vals = [rk; lk; ck; c0];

endfunction
