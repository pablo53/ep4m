function t = et(elem, val, s)
	t = NaN;
	if (nargin != 3)
		printf("\n\net(elem, val, s): returns transmission matrix(ABCD) for given element and its value at a certain frequency.\n");
		printf("  elem - 1 character string defining the element type\n");
		printf("  val  - element value (or vector of values)\n");
		printf("  s    - j multiplied by 2 * pi * frequency for which to calculate ABCD matrix\n");
		printf("\n");
		printf("returns: ABCD matrix (2 x 2)s\n");
		return;
	endif;
	# s = jw = 2 * pi * f * j
	switch elem
        case 'c'
          c1 = val(1);
          t = [1, 0; s * c1, 1];
        case 'C'
          c1 = val(1);
          t = [1, 1 / (s * c1); 0, 1];
        case 'l'
          l1 = val(1);
          t = [1, 0; 1 / (s * l1), 1];
        case 'L'
          l1 = val(1);
          t = [1, s * l1; 0, 1];
        case 'r'
          r1 = val(1);
          t = [1, 0; 1 / r1, 1];
        case 'R'
          r1 = val(1);
          t = [1, r1; 0, 1];
        case 'b'
          c1 = val(1);
          l1 = val(2);
          t = [1, 0; 1 / (1 / (s * c1) + s * l1), 1];
        case 'B'
          l1 = val(1);
          c1 = val(2);
          t = [1, (l1 / c1) / (s * l1 + 1 / (s * c1)); 0, 1];
        case 'f'
          c1 = val(1);
          r1 = val(2);
          t = [1, 0; 1 / (1 / (s * c1) + r1), 1];
        case 'F'
          r1 = val(1);
          c1 = val(2);
          t = [1, (r1 + 1 / (s * c1)) * s * c1 / r1; 0, 1];
        case 'k'
          l1 = val(1);
          r1 = val(2);
          t = [1, 0; 1 / (s * l1 + r1), 1];
		case 't'
		  l1 = val(1);
		  l2 = val(2);
		  t = [sqrt(l1 / l2), 0; 1 / (s * sqrt(l1 * l2)), sqrt(l2 / l1)];
        case 'K'
          l1 = val(1);
          r1 = val(2);
          t = [1, (s * l1 + r1) / (s * l1 * r1); 0, 1];
		case '|'
		  el = val(2) * s / i;
		  z = -i * val(1) * cot(el);
		  t = [1, 0; (1 / z), 1];
		case 'x'
		  rk = vals(1);
		  lk = vals(2);
		  ck = vals(3);
		  c0 = vals(4);
		  t = [1, 0; s * c0 + 1 / (rk + s * lk + 1 / (s * ck)), 1]
		case 'X'
		  rk = vals(1);
		  lk = vals(2);
		  ck = vals(3);
		  c0 = vals(4);
		  t = [1, 1 / (s * c0 + 1 / (rk + s * lk + 1 / (s * ck))); 0, 1]
		case '_'
		  el = val(2) * s / i;
		  z = i * val(1) * tan(el);
		  t = [1, 0; (1 / z), 1];
		case '='
		  el = val(2) * s / i;
		  z = -i * val(1) * cot(el);
		  t = [1, z; 0, 1];
		case ']'
		  el = val(2) * s / i;
		  z = i * val(1) * tan(el);
		  t = [1, z; 0, 1];
		case '#'
		  eli = val(2) * s;
		  z = val(1);
		  t = [cosh(eli), sinh(eli) * z; sinh(eli) / z, cosh(eli)];
		case 'U'
		  k = val(1);
		  t = [1 / k, 0; 0, 0];
		case 'u'
		  r = val(1);
		  t = [0, 0; 1 / r, 0];
		case 'Y'
		  g = val(1);
		  t = [0, 1 / g; 0, 0];
		case 'y'
		  alpha = val(1);
		  t = [0, 0; 0, 1 / alpha];
		case 'z'
		  r = val(1);
		  t = [0, r; 1 / r, 0];
		case 'T'
		  p = val(1);
		  t = [p, 0; 0, 1 / p];
		case 'n'
		  k = val(1);
		  t = [k, 0; 0, -1 / k];
		case 'N'
		  r = val(1);
		  t = [0, -r; 1 / r, 0];
		case '*'
		  t = [ val(1), val(2) ; val(3), val(4) ]
		otherwise
		  error("Illegal element type");
	endswitch;
endfunction
