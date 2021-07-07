function [c0, ck, lk] = ecrystalparams(fs, fr, fr1, c)

  if (nargin != 4)
    printf("%s\n", "ecrystalparams(fs, fr, fr1, c): compute crystal oscillator series and parallel capacitance, and series inductance");
    printf("  %s\n", "fs - series frequency (the lowest frequency giving max throughput)");
    printf("  %s\n", "fr - shunt frequency (the highest frequency giving min throughput)");
    printf("  %s\n", "fr1 - shifted shunt frequency (in the middle between fr and fs, after adding a capacitor in parallel with the crystal oscillator) giving shifted min throughput");
    printf("  %s\n", "c - parallel capacitance added to compute fr1");
    printf("%s\n", "returns: [c0, ck, lk], where");
    printf("  %s\n", "c0 - parallel capacitance");
    printf("  %s\n", "ck - series capacitance");
    printf("  %s\n", "lk - series inductance");
    return;
  endif;

  c0 = c * (fr1 - fs) / (fr - fr1);
  ck = 2 * c0 * (fr - fs) / fs;
  lk = 1 / (4 * pi ^ 2 * fs ^ 2 * ck);

endfunction
