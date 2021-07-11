function [t, v, ok] = epolyfrac2(p, q, shunt, bylowest, maxorder)
  t = [];
  v = [];
  ok = false;
  if (nargin != 2 && nargin != 3 && nargin != 4 && nargin != 5)
    printf("\nepolyfrac2(p, q[, shunt[, bylowest[, maxorder]]]): synthesize ladder of the given transfer function.\n");
    printf("  p        - numerator polynomial coefficients\n");
    printf("  q        - denominator polynomial coefficients\n");
    printf("  shunt    - preferences, whether preferred first shunt (true, default) or parallel (false)\n")
    printf("  bylowest - preferences, whether try to divide polynomials first with its lowest factors");
    printf("  maxorder - \n");
    printf("\n");
    printf("returns: [ ladder,\n");
    printf("           values ]\n");
    return;
  endif;
  if (ismember(1, isnan(p)) || ismember(1, isnan(q)) || ismember(1, isinf(p)) || ismember(1, isinf(q)))
    return;
  endif;
  if (nargin < 3)
    shunt = true;
  endif;
  if (nargin < 4)
    bylowest = true;
  endif;
  if (nargin < 5)
    maxorder = Inf;
  elseif (maxorder <= 0)
    return;
  endif;
  
  dirs = [ shunt(1)     shunt(1)    ~shunt(1)    ~shunt(1)
           bylowest(1) ~bylowest(1)  bylowest(1) ~bylowest(1) ];

  for d=dirs
    try
      [pp, qq, rest] = epolydiv(p, q, d(1), d(2));
#printf("p:%i .. %i, q:%i .. %i, pp:%i .. %i, qq:%i .. %i\n", epolyorder(p), epolyantiorder(p), epolyorder(q), epolyantiorder(q), epolyorder(pp), epolyantiorder(pp), epolyorder(qq), epolyantiorder(qq));
      if (epolyantiorder(pp) < 0 || epolyantiorder(qq) < 0)
        # for numerical finity reasons
        continue;
      endif;
      if (columns(rest) == 0)
        ok = true;
        break;
      endif;
      if (columns(rest) != 1)
        continue;
      endif;
      degr = rest(1, 1);
      if (abs(degr) > 1)
        continue;
      endif;
      if (columns(shunt) >= 2)
        nextshunt = shunt(2:end);
      else
        nextshunt = ~d(1);
      endif;
      if (columns(bylowest) >= 2)
        nextbylowest = bylowest(2:end);
      else
        nextbylowest = d(2);
      endif;
      [tt, vv, ok] = epolyfrac2(pp, qq, nextshunt, nextbylowest, maxorder - 1);
      valr = rest(2, 1);
      if (isnan(valr) || valr <= 0 || valr == Inf || valr == -Inf)
        ok = false;
      endif;
      if (d(1)) # admittance
        switch (degr)
          case -1
            v = evalues(1 / valr);
            t = "l";
          case 0
            v = evalues(1 / valr);
            t = "r";
          case 1
            v = evalues(valr);
            t = "c";
        endswitch;
      else # impedance
        switch (degr)
          case -1
            v = evalues(1 / valr);
            t = "C";
          case 0
            v = evalues(valr);
            t = "R";
          case 1
            v = evalues(valr);
            t = "L";
        endswitch;
      endif;
      [t, v] = ejoin(t, v, tt, vv);
    catch
      ok = false;
    end_try_catch;
    if (ok)
      break;
    endif;
  endfor;
endfunction
