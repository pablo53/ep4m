function [ladder, vals] = ecrystalequiv(c0, ck, lk, rk)

  if (nargin != 4)
    printf("%s\n", "ecrystalequiv(c0, ck, cl): get a ladder+values series equivalent of a crystal oscillator based on its characteristics");
    printf("  %s\n", "c0 - parallel capacitance");
    printf("  %s\n", "ck - series capacitance");
    printf("  %s\n", "lk - series inductance");
    printf("  %s\n", "rk - series resistance");
    return;
  endif;

  ladder = "<R LCC >";
  vals = [[NaN, rk, NaN, lk, c0, ck, NaN, NaN], [NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN], [NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN], [NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN]];


endfunction
