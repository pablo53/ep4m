function cl = erescl(f0, lc)
# this means either: get L from C, or get C from L - given F0
  cl = 1 / (4 * pi ^ 2 * f0 ^ 2 * lc);
endfunction