function [t, v] = emfbbpfilter(f1, f2, c, g)
# 
# Bandwidth: f1..f2
# Capacitor: c
# Gain: -g (be carefull: pass positive "g", although the gain is going to be negative, i.e. -g!!!
#

	bw = f2 - f1;
	fm = sqrt(f1 * f2);
	q = fm / bw;

	r2 = q / (pi * fm * c);
	r1 = r2 / (2 * g);
	r3 = r1 * g / (2 * q ^ 2 - g);
	
	t = "R< C < vRr>C >";
	v = zeros(rows(evempty()), 14);
	v(:,1) = evalues(r1);
	v(:,4) = evalues(c);
	v(:,8) = evalues(Inf, 0, -Inf);
	v(:,9) = evalues(r2);
	v(:,10) = evalues(r3);
	v(:,12) = evalues(c);
	
endfunction;
