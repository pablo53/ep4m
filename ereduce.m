function [t, v] = ereduce(ladder, vals, f)
  
  t = "";
  v = [];
  if (nargin != 2 && nargin != 3)
    printf("\nereduce(ladder, vals[, f]): reduces mesh (i.e. topology and its element values) by trying to join\n");
    printf("                            iteratively each two neighbours of the same type.\n");
    printf("                            If frequency is given, more reduction can be provided - but it will work\n");
    printf("                            at the given frequency only!\n");
    printf("  ladder - topology\n");
    printf("  vals   - ladder's element values\n");
	printf("  f      - frequency to produce more reduction (optional)\n");
    printf("returns: [ topology, values ]\n");
	return;
  endif;
  
  t = ladder;
  v = vals;
  notyet = 0;
  while (!notyet)
    notyet = 1;
    k = 1;
    while (k < columns(t))
      switch (t(k:k+1))
        case "cc"
          t(k) = [];
          v(1, k + 1) = v(1, k) + v(1, k + 1);
          v(:, k) = [];
          notyet = 0;
        case "ll"
          t(k) = [];
          v(1, k + 1) = eii(v(1, k), v(1, k + 1));
          v(:, k) = [];
          notyet = 0;
        case "rr"
          t(k) = [];
          v(1, k + 1) = eii(v(1, k), v(1, k + 1));
          v(:, k) = [];
          notyet = 0;
        case "CC"
          t(k) = [];
          v(1, k + 1) = eii(v(1, k), v(1, k + 1));
          v(:, k) = [];
          notyet = 0;
        case "LL"
          t(k) = [];
          v(1, k + 1) = v(1, k) + v(1, k + 1);
          v(:, k) = [];
          notyet = 0;
        case "RR"
          t(k) = [];
          v(1, k + 1) = v(1, k) + v(1, k + 1);
          v(:, k) = [];
          notyet = 0;
        otherwise
          if (nargin >= 3)
            if (!isnan(f))
              switch (t(k:k+1))
                case "CL"
                  xc = 1 / (2 * pi * f * v(1, k));
                  xl = 2 * pi * f * v(1, k + 1);
                  if (xc > xl)
                    v(1, k) = 1 / (2 * pi * f * (xc - xl));
                    v(:, k + 1) = [];
                    t(:, k + 1) = [];
                  elseif (xc < xl)
                    v(1, k + 1) = (xl - xc) / (2 * pi * f);
                    v(:, k) = [];
                    t(:, k) = [];
                  else
                    t(:, k:k+1) = [];
                    v(:, k:k+1) = [];
                  endif;
                  notyet = 0;
                case "LC"
                  xl = 2 * pi * f * v(1, k);
                  xc = 1 / (2 * pi * f * v(1, k + 1));
                  if (xc < xl)
                    v(1, k) = (xl - xc) / (2 * pi * f);
                    v(:, k + 1) = [];
                    t(:, k + 1) = [];
                  elseif (xc > xl)
                    v(1, k + 1) = 1 / (2 * pi * f * (xc - xl));
                    v(:, k) = [];
                    t(:, k) = [];
                  else
                    t(:, k:k+1) = [];
                    v(:, k:k+1) = [];
                  endif;
                  notyet = 0;
                case "cl"
                  xc = -1 / (2 * pi * f * v(1, k));
                  xl = 2 * pi * f * v(1, k + 1);
                  xlc = eii(xc, xl);
                  if (xlc > 0)
                    v(1, k + 1) = xlc / (2 * pi * f);
                    v(:, k) = [];
                    t(:, k) = [];
                  elseif (xlc < 0)
                    v(1, k) = -1 / (2 * pi * f * xlc);
                    v(:, k + 1) = [];
                    t(:, k + 1) = [];
                  else
                    t(:, k:k+1) = [];
                    v(:, k:k+1) = [];
                  endif;
                  notyet = 0;
                case "lc"
                  xl = 2 * pi * f * v(1, k);
                  xc = -1 / (2 * pi * f * v(1, k + 1));
                  xlc = eii(xc, xl);
                  if (xlc > 0)
                    v(1, k) = xlc / (2 * pi * f);
                    v(:, k + 1) = [];
                    t(:, k + 1) = [];
                  elseif (xlc < 0)
                    v(1, k + 1) = -1 / (2 * pi * f * xlc);
                    v(:, k) = [];
                    t(:, k) = [];
                  else
                    t(:, k:k+1) = [];
                    v(:, k:k+1) = [];
                  endif;
                  notyet = 0;
              endswitch;
            else
              switch (t(k:k+1))
                case "LC"
                  t(:,k:k+1) = fliplr(t(:,k:k+1));
                  v(:,k:k+1) = fliplr(v(:,k:k+1));
                  notyet = 0;
                case "cl"
                  t(:,k:k+1) = fliplr(t(:,k:k+1));
                  v(:,k:k+1) = fliplr(v(:,k:k+1));
                  notyet = 0;
              endswitch;
			endif;
          else
            switch (t(k:k+1))
              case "CL"
                t(:,k:k+1) = fliplr(t(:,k:k+1));
                v(:,k:k+1) = fliplr(v(:,k:k+1));
                notyet = 0;
              case "lc"
                t(:,k:k+1) = fliplr(t(:,k:k+1));
                v(:,k:k+1) = fliplr(v(:,k:k+1));
                notyet = 0;
            endswitch;
          endif;
      endswitch;
      k = k + 1;
    endwhile;
  endwhile;
endfunction