function [x, y] = esolver(x0, f, step, maxsteps, maxgranularity)
  if (nargin < 3)
    step = 1;
  endif;
  if (nargin < 4)
    maxsteps = round(1000000 / step);
  endif;
  if (nargin < 5)
    maxgranularity = 16;
  endif;
  x = x0;
  
  while (maxgranularity > 0 && (maxsteps > 0))
    y = f(x);
    improved = false;
    for i=1:length(x)
      xb = x;
      xf = x;
      xb(i) = xb(i) - step;
      xf(i) = xf(i) + step;
      yb = f(xb);
      yf = f(xf);
      if (yb < y)
        y = yb;
        x = xb;
        improved = true;
      endif;
      if (yf < y)
        y = yf;
        x = xf;
        improved = true;
      endif;
    endfor;
    maxsteps = maxsteps - 1;
    if (!improved)
      maxgranularity = maxgranularity - 1;
      step = step / 2;
    endif;
  endwhile;
endfunction
