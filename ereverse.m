function [t, v] = ereverse(ladder, values)

  if (nargin != 2)
    printf("\nereverse(ladder, values): inverse the ladder\n");
    printf("  ladder - ladder to be reordered (inversed)\n");
    printf("  values - ladder values to be reordered (inversed)\n");
    printf("\n");
    printf("returns: [ inversed ladder\n");
	printf("           inversed (reordered) values ]\n");
    return;
  endif;

  t = ladder;
  l = columns(t);
  for i = 1:floor(l / 2)
    tt = t(i);
	switch tt
	  case '<'
	    tt = '>';
	  case '>'
	    tt = '<';
	  case 'i'
	    tt = 'o';
	  case 'o'
	    tt = 'i';
	endswitch;
    t(i) = t(l - i + 1);
	switch t(i)
	  case '<'
	    t(i) = '>';
	  case '>'
	    t(i) = '<';
	  case 'i'
	    t(i) = 'o';
	  case 'o'
	    t(i) = 'i';
	endswitch;
	t(l - i + 1) = tt;
  endfor;
  
  v = values;
  l = columns(v);
  for i = 1:floor(l / 2)
    vv = v(:, i);
    v(:, i) = v(:, l - i + 1);
	v(:, l - i + 1) = vv;
  endfor;
  
endfunction