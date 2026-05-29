function [x, y] = esolver(x0, f, islegal, step, maxsteps, maxgranularity)
  if (nargin < 3)
    islegal = @(x) true;
  endif;
  if (nargin < 4)
    step = 1;
  endif;
  if (nargin < 5)
    maxsteps = round(1000000 / step);
  endif;
  if (nargin < 6)
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
      if (islegal(xb))
        yb = f(xb);
        if (yb < y)
          y = yb;
          x = xb;
          improved = true;
        endif;
      endif;
      if (islegal(xf))
        yf = f(xf);
        if (yf < y)
          y = yf;
          x = xf;
          improved = true;
        endif;
      endif;
    endfor;
    maxsteps = maxsteps - 1;
    if (!improved)
      maxgranularity = maxgranularity - 1;
      step = step / 2;
    endif;
  endwhile;
endfunction
