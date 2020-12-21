function ti = etrackind(x, w, h)
  # The inductance of a single PCB track
  # x - track length
  # w - track width
  # h - track height
  if (nargin < 3)
    printf("\netrackind(x, w, h): approximates PCB track inductance\n");
    printf("  x - track length\n");
    printf("  w - track width\n");
    printf("  h - track height\n\n");
    return;
  endif;
  ti = 0.0000002 * x * (log(2 * x / (w + h)) + 0.2235 * (w + h) / x + 0.5);
endfunction
