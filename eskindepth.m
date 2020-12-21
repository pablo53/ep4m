function sd = eskindepth(f, rho)
  # f - frequency (-ies)
  # rho - resistivity [Ohm * m]
  # returns: skin depth [m]
  u = 4 * pi * 1e-7;
  sd = sqrt(rho ./ (pi * u .* f));
endfunction