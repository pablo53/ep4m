function [ladder, elemvals] = efiltermesh(order, frq1, frq2, r, rf)
  if (nargin != 4 && nargin != 5)
    printf("\nefiltermesh(order, frq1, frq2, r[, rf]): Creates simple narrow band pass filter.\n");
	printf("  order - filter order (number of poles)\n");
	printf("  frq1  - lower band frequency\n");
	printf("  frq2  - upper band frequency\n");
	printf("  r     - characteristic impedance\n");
	printf("  rf    - internal scaling factor (optional) - i.e. filter impedance will be multiplied by this and tapped capacitance will match both input and output to the characteristic impednace\n");
	printf("\n");
	printf("returns: [ topology of elements\n");
	printf("           element values ]\n");
    return;
  endif;
  if ((nargin < 5) || (rf < 1.0))
    rf = 1.0;
  endif;
  f0 = sqrt(frq1 * frq2);
  b = (frq2 - frq1) / f0;
  switch (order)
    case 3
	  ladder = "clCclClc";
	  l = 0.0786 * b * r * rf / f0;
	  c0 = 0.0253303 / (f0 * f0 * l);
	  c31 = 0.227 / (f0 * r * rf);
	  elemvals = [evalues(c0-c31) evalues(l) evalues(c31) evalues(c0-2*c31) evalues(l) evalues(c31) evalues(l) evalues(c0-c31)];
	case 4
	  ladder = "clCclClcClc";
	  l = 0.0765 * b * r * rf / f0;
	  c0 = 0.0253303 / (f0 * f0 * l);
	  c41 = 0.225 / (f0 * r * rf);
	  c42 = 0.206 / (f0 * r * rf);
	  elemvals = [evalues(c0-c41) evalues(l) evalues(c41) evalues(c0-c41-c42) evalues(l) evalues(c42) evalues(l) evalues(c0-c41-c42) evalues(c41) evalues(l) evalues(c0-c41)];
	case 5
	  ladder = "clCclCclClcClc";
	  l = 0.0745 * b * r * rf / f0;
	  c0 = 0.0253303 / (f0 * f0 * l);
	  c51 = 0.223 / (f0 * r * rf);
	  c52 = 0.188 / (f0 * r * rf);
	  elemvals = [evalues(c0-c51) evalues(l) evalues(c51) evalues(c0-c51-c52) evalues(l) evalues(c52) evalues(c0-2*c52) evalues(l) evalues(c52) evalues(l) evalues(c0-c51-c52) evalues(c51) evalues(l) evalues(c0-c51)];
	otherwise
	  error("Order of this type of filter must fall between 3 and 5.");
  endswitch
  if (rf > 1.0)
    ladder = [ "cC" ladder(2:columns(ladder)) ];
    ladder = [ ladder(1:columns(ladder) - 1) "Cc" ];
	rf1 = sqrt(rf);
	rf2 = rf1 / (rf1 - 1);
	elemvals(:,2:columns(elemvals)+1) = elemvals(:,1:columns(elemvals));
	elemvals(:,1:2) = [ rf1 .* elemvals(:,1), rf2 .* elemvals(:,1) ];
	elemvals(:,columns(elemvals)+1) = elemvals(:,columns(elemvals));
	elemvals(:,columns(elemvals)-1:columns(elemvals)) = fliplr(elemvals(:,1:2));
  endif;
endfunction