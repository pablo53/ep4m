function [amp, phase, mwaveimp, mwaveiimp, mwaveoimp, ampp] = efreqanalyze(top, vals, freq, zout, zin, alpha, cbpartval)

  if (nargin < 3)
    printf("\n\nefreqanalyze(top, vals, freq[, zout[, zin[, alpha[, cbpartval]]]]): perform net analysis in the given frequency domain\n");
	printf("  top   - topology\n");
	printf("  vals  - topology elements' values\n");
	printf("  freq  - vector of frequencies to be analyzed\n");
	printf("  zout  - load impedance\n");
	printf("  zin   - source impedance\n");
	printf("  alpha - a parameter to simulate imperfect net, the higher the more power loss\n");
	printf("  cbpartval - callback function name for evaluating parts from external libraries (necessary when external parts are used)\n")
	printf("returns: [ amp - magnitudes (vector of values for each frequency)\n");
	printf("           phase - phase shifts (vector of values for each frequency) \n");
	printf("           mwaveimp - mean characteristic impedance \n");
	printf("           mwaveiimp - characteristic impedance as seen from source \n");
	printf("           mwaveoimp - characteristic impedance as seen from load \n");
	printf("           ampp - power magnitudes ]\n");
    return;
  endif;

  if (columns(freq) > 1)
    amp = zeros(1, columns(freq));
    phases = zeros(1, columns(freq));
	mwaveimp = zeros(1, columns(freq));
	mwaveiimp = zeros(1, columns(freq));
	mwaveoimp = zeros(1, columns(freq));
	ampp = zeros(1, columns(freq));
    for k = 1:columns(freq)
      if (nargin >= 7)
        [amp(1, k), phase(1, k), mwaveimp(1, k), mwaveiimp(1, k), mwaveoimp(1, k), ampp(1, k)] = efreqanalyze(top, vals, freq(1, k), zout, zin, alpha, cbpartval);
      elseif (nargin >= 6)
        [amp(1, k), phase(1, k), mwaveimp(1, k), mwaveiimp(1, k), mwaveoimp(1, k), ampp(1, k)] = efreqanalyze(top, vals, freq(1, k), zout, zin, alpha);
      elseif (nargin >= 5)
        [amp(1, k), phase(1, k), mwaveimp(1, k), mwaveiimp(1, k), mwaveoimp(1, k), ampp(1, k)] = efreqanalyze(top, vals, freq(1, k), zout, zin);
      elseif (nargin >= 4)
        [amp(1, k), phase(1, k), mwaveimp(1, k), mwaveiimp(1, k), mwaveoimp(1, k), ampp(1, k)] = efreqanalyze(top, vals, freq(1, k), zout);
      elseif (nargin >= 3)
        [amp(1, k), phase(1, k), mwaveimp(1, k), mwaveiimp(1, k), mwaveoimp(1, k), ampp(1, k)] = efreqanalyze(top, vals, freq(1, k));
      endif;
    endfor;
  else
    if (nargin < 6)
      t = etv2abcd(top, vals, freq);
    elseif (nargin < 7)
      t = etv2abcd(top, vals, freq, alpha);
	else
      t = etv2abcd(top, vals, freq, alpha, cbpartval);
    endif;
	tin = [1 zin; 0, 1];
	tout = [1 0; 1 / zout 1];
	tm = tin * t * tout;
    if (tm(1, 1) != 0)
      resp = 1 / tm(1, 1);
      amp = abs(resp);
      phase = arg(resp);
    else
      amp = inf;
      phase = 0;
    endif;
	if (t(2, 1) != 0)
      mwaveimp = sqrt(t(1, 2) / t(2, 1));
	  if (t(2, 2) != 0)
        mwaveiimp = mwaveimp * sqrt(t(1, 1) / t(2, 2));
	  else
	    mwaveiimp = NaN;
	  endif;
	  if (t(1, 1) != 0)
        mwaveoimp = mwaveimp * sqrt(t(2, 2) / t(1, 1));
	  else
	    mwaveoimp = NaN;
	  endif;
	else
	  mwaveimp = NaN;
	  mwaveiimp = NaN;
	  mwaveoimp = NaN;
	endif;
	if nargin >= 5
	  if (zin > 0) && (zout > 0)
		ampp = amp ^ 2 * zin / zout;
	  else
		ampp = NaN;
	  endif;
	else
	  ampp = NaN;
	endif;
  endif;
endfunction