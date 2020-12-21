function vsct = erndscatter(v, ex)
  # v - input vector to randomize
  # ex - elements tolerance series (6 for E6, 12 for E12, 24 for E24, 48 for E48, 96 for E96, 192 for E192, etc...)
  ccnt = columns(v);
  rcnt = rows(v);
  vsct = unifrnd(10 ^ (-0.5 / ex), 10 ^ (+0.5 / ex), rcnt, ccnt) .* v;
endfunction