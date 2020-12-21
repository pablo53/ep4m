function r = ewireacres(l, d, rho, f)
  # l - length of wire
  # d - wire diameter
  # rho - resistivity [Ohm * m]
  # f - frequency (-ies) - optional (default: 0 Hz)
  if (nargin < 4)
    f = 0;
	s0 = 0;
  else
    sd = eskindepth(f, rho);
    sd = min(sd, d / 2);        # a "skin" over which the current flows
    s0 = pi .* (d / 2 - sd) .^ 2; # a fragment not used due to the skin effect
  endif;
  s = pi * d ^ 2 / 4;
  ss = s - s0;                # skin effect corrected 
  r = rho .* l ./ ss;
endfunction