function [tout, vout] = eterminate(tin, vin)
  tout = ['i' tin 'o'];
  vout = [evempty() vin evempty()];
endfunction