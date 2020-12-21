function [inner] = eisbounded(vec, vecmin, vecmax)
  inner = true;
  for i = 1:columns(vec)
    inner = inner && (vec(i) >= vecmin(i)) && (vec(i) <= vecmax(i));
  endfor;
endfunction;
  
