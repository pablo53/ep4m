function [amp, phase, mwaveimp] = erndfreqanalyze(cnt, ex, top, vals, freq, zout, zin, alpha)
  # Randomly distorted (based on [ex] series tolerance) element values, [cnt]-times called
  # efreqanalyze(top, vals, freq[, zout[, zin[, alpha]]])
  amp = [];
  phase = [];
  mwaveimp = [];
  for r = 1:cnt
    valsrnd = erndscatter(vals, ex);
    if (nargin >= 8)
	  [amp(r, :), phase(r, :), mwaveimp(r, :)] = efreqanalyze(top, valsrnd, freq, zout, zin, alpha);
    elseif (nargin >= 7)
	  [amp(r, :), phase(r, :), mwaveimp(r, :)] = efreqanalyze(top, valsrnd, freq, zout, zin);
    elseif (nargin >= 6)
	  [amp(r, :), phase(r, :), mwaveimp(r, :)] = efreqanalyze(top, valsrnd, freq, zout);
    elseif (nargin >= 5)
	  [amp(r, :), phase(r, :), mwaveimp(r, :)] = efreqanalyze(top, valsrnd, freq);
    endif;
  endfor;
endfunction;
