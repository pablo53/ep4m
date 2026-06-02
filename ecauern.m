function n = ecauern(fs, Rp, Rs)
   n = 0;
   if (nargin < 3)
     printf("ecauern(fs, Rp, Rs) - minimal order of a normalized cauer filter (cutoff stopband frequency = 1/2pi) for parameters:\n");
     printf("  fs - stopband frequency [Hz]\n");
     printf("  Rp - passband ripple\n");
     printf("  Rs = stopband attenuation?\n");
     return;
   endif;
   omegaS = 2 * pi * fs;
   k = 1 / omegaS;  # assuming passband cut-off frequency = 1 rad/s = 2*pi Hz
   
   g = sqrt((10 ^ (Rp / 10) - 1) / (10 ^ (Rs / 10) - 1));
   gp = sqrt(1 - g * g);
   kp = sqrt(1 - k * k);
   nd = eagm(1, gp) / eagm(1, g) * eagm(1, k) / eagm(1, kp);
   n = ceil(nd);
endfunction
