function ehodogr(magn, phase, freq)
  rey = magn .* cos(phase);
  imy = magn .* sin(phase);
  if (nargin < 3)
	plot(rey, imy);
  else
	plot3(freq, rey, imy);
  endif;
endfunction
