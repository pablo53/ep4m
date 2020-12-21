function [retf, scale] = escale(val)
  scale = "";
  if (val == 0.0)
    retf = val;
  else
    r3 = floor(log(val)/log(1000));
    r3a = r3;
    if (r3a < -5)
      r3a = -5;
    elseif (r3a > 6)
      r3a = 6;
    endif;
    retf = val / 1000 ^ r3a;
    switch (r3a)
      case -5
        scale = "f";
      case -4
        scale = "p";
      case -3
        scale = "n";
      case -2
        scale = "u";
      case -1
        scale = "m";
      case 0
        scale = "";
      case 1
        scale = "k";
      case 2
        scale = "M";
      case 3
        scale = "G";
      case 4
        scale = "T";
      case 5
        scale = "P";
      case 6
        scale = "E";
    endswitch
  endif;
endfunction