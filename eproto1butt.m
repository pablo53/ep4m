function [ladder, elemvals] = eproto1butt(order)
  ladder = '';
  elemvals = [];
  capacitor = 1;
  aj = 1;
  gj = 1;
  for j = 1:order
    aj1 = aj;
	gj1 = gj;
    aj = sin(pi * ( 2 * j - 1 ) / (2 * order));
	cj1 = cos(pi * (j - 1) / (2 * order)) ^ 2;
	gj = aj * aj1 / (cj1 * gj1);
	elemvals = [elemvals evalues(gj)];
	if (capacitor)
	  ladder = [ladder 'c'];
	else
	  ladder = [ladder 'L'];
	endif;
	capacitor = !capacitor;
  endfor
endfunction