function [t, v] = edistfilter(protot, protov, f0, fmax, r, upf, version)
  t = '';
  v = [];
  if (nargin != 5 && nargin != 6 && nargin != 7)
    printf("\nedistfilter(protot, protov, f0, fmax, r[, upf[, version]]): Transforms a prototype filter into a distributed element one.\n");
	printf("  protot  - prototype filter topology\n");
	printf("  protov  - prototype filter topology values\n");
	printf("  f0      - cutoff frequency\n");
	printf("  fmax    - max frequency under scrutiny (i.e maximum frequency possible in the analysis)\n");
	printf("  r       - wave impedance\n");
	printf("  upf     - upper pass filter instead of lower pass one\n");
	printf("  version - \"kuroda\"=use Kuroda's transformation, \"tlines\"=approx. by transmission line ladder, \"\"=no transformation\n");
	printf("  \n");
	printf("returns: [ topology values ]\n\n");
    return;
  endif;
  if (nargin < 6)
    upf = 0;
  endif;
  if (nargin < 7)
    version = "";
  endif;
  
  tau = 1 / (4 * fmax);
  alpha = tan(2 * pi * f0 * tau);
  if (upf != 0)
    [protot, protov] = escalefilter(protot, protov, 1, 2 * pi, NaN);
  endif;
  
  for i = 1:columns(protot)
    switch (protot(i))
	  case 'L'
	    if (strcmpi(version, "tlines"))
		  t = [ t '#' ];
		  v = [ v evalues(protov(1, i) * r / (tau * 2 * pi * f0), tau) ];
		else
	      t = [ t ']' ];
          v = [ v evalues(protov(1, i) * r / alpha, tau) ];
		endif;
	  case 'l'
	    if (strcmpi(version, "tlines"))
		  error("Illegal design!");
		endif;
	    t = [ t '_' ];
		v = [ v evalues(protov(1, i) * r / alpha, tau) ];
	  case 'C'
	    if (strcmpi(version, "tlines"))
		  error("Illegal design!");
		endif;
	    t = [ t '=' ];
		v = [ v evalues(alpha * r / protov(1, i), tau) ];
	  case 'c'
	    if (strcmpi(version, "tlines"))
          t = [ t '#' ];
          v = [ v evalues(tau * r * (2 * pi * f0) / protov(1, i), tau) ];
		else
          t = [ t '|' ];
          v = [ v evalues(alpha * r / protov(1, i), tau) ];
		endif;
	  case 'i'
	    t = [ t protot(i) ];
		v = [ v protov(i) ];
	  case 'o'
	    t = [ t protot(i) ];
		v = [ v protov(i) ];
	  case '-'
	    t = [ t protot(i) ];
		v = [ v protov(i) ];
	  otherwise
	    error("Illegal prototype!");
	endswitch
  endfor;
  if (strcmpi(version, "kuroda"))
    [t, v] = ekurodaall(t, v, NaN, r);
  endif;
  
endfunction
