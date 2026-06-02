function [zs, ps, h0] = ecauerroots(N, Rp, Rs)
  zs = []; # zeros (the roots of numerator)
  ps = []; # poles (the roots of denominator)
  h0 = 1;  # gain (the ration of the factors by the highest power of s in numerator and denominator)
  if (nargin < 3)
    printf("ecauerroots(N, Rp, Rs): roots of the numerator and the denominator (i.e. poles) and the normalizing factor of a normalized elliptic rational function\n");
    printf("  N - order\n");
    printf("  Rp - passband rippled (dB)\n");
    printf("  Rs - stopband attenuation (dB)\n");
  endif;
  
  g2 = (10 ^ (Rp / 10) - 1) / (10 ^ (Rs / 10) - 1); # g^2
  g = sqrt(g2);      # g
  gp = sqrt(1 - g2); # g'
  
  ksolvent = @(k) (eelliptic1(k) / eelliptic1(sqrt(1 - k*k)) * eelliptic1(gp) / eelliptic1(g) - N) ^ 2;
  kdomain = @(k) (k > 0 && k < 1);
  k = esolver(0.5, ksolvent, kdomain); 
  
  kp = sqrt(1 - k * k);     # k'
  Kk = eelliptic1(k);       # K(k)
  Kkp = eelliptic1(kp);     # K(k')
  if (mod(N, 2) != 0)
    zs = [0];
  endif;
  for i = 1:floor(N/2)
    z = ejsn(Kk * (1 + (2 * i - 1) / N), k);
    zs = [-z ; zs ; z];
    ps = [-1 / (k * z) ; ps ; 1 / (k * z) ];
    h0 = h0 * (1 - 1 / (k * z)^2) / (1 - z^2);
  endfor;
endfunction
