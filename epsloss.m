function [e] = epsloss(epsr, delta)
  e = epsr * (1 - i * tan(delta));
#  e = eps0() * e;
endfunction