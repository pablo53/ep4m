function [scnetstr, scnetval] = escalenbpfilter(stdnetstr, stdnetvals, r, f1, f2)
	# Narrow Band-pass Filter
	scnetstr = [];
	scnetval = [];
	if (isnan(f1) || isnan(f2))
		error("Both frequencies are required.");
	elseif ((!isna(f1) && (f1 == 0)) || (!isna(f2) && (f2 == 0)))
		error("Zero frequency found.");
	endif;
	f1 = abs(f1);
	f2 = abs(f2);
	if (f1 == f2)
		error("Zero bandwidth found.");
	endif;
	
	wc = 2 * pi * (f2 - f1);
	w0 = 2 * pi * ((f2 + f1) / 2);
	ql = w0 / wc;
	g = stdnetvals(1, :);
	n = columns(g);
	
	l = r / (w0 * ql * g(1));
	c = g(1) / (r * wc);
	for i=1:n
		scnetstr = [ scnetstr "l" "c" ];
		scnetval = [ scnetval evalues(l) evalues(c) ];
		if (i < n)
			cc = g(1) / (r * w0 * sqrt(g(i) * g(i + 1)));
			scnetstr = [ scnetstr "C" ];
			scnetval = [ scnetval evalues(cc) ];
		endif;
	endfor;
	for i=2:3:(3 * n - 1)
i
		if (i - 2 >= 1)
			scnetval(1, i) = scnetval(1, i) - scnetval(1, i - 2);
		endif;
		if (i + 1 <= n)
			scnetval(1, i) = scnetval(1, i) - scnetval(1, i + 1);
		endif;
	endfor;
endfunction
