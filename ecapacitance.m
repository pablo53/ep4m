function c = ecapacitance(s, dist, er)
  # s - surface area
  # dist - distance between both surfaces (clearance)
  # er - optional: relative permeability
  if (nargin < 3)
    er = 1;
  endif;
  e0 = 8.854187817e-12; # around 1 / (36 * pi)...
  e = e0 * er;
  c = e * s / dist;
endfunction