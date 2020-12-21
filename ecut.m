function [ladder, vals] = ecut(t, v, pos)
  ladder = "";
  vals = [];
  if ((pos >= 1) && (pos <= columns(t)) && (pos <= columns(v)))
    if (pos > 1)
      ladder = [ladder t(1:pos - 1)];
      vals = [vals v(:, 1:pos - 1)];
	endif;
	if (pos < columns(t))
      ladder = [ladder, t(pos + 1:columns(t))];
      vals = [vals, v(:,pos + 1:columns(v))];
	endif;
  endif;
endfunction
