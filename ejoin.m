function [t, v] = ejoin(t1, v1, t2, v2)
  if (nargin != 4)
    printf("\nejoin(t1, v1, t2, v2): concatenates two topologies and their values - [t1, v1] and [t2, v2]\n");
    printf("returns: [ topology, values ]\n\n");
    return;
  endif;
  t = [ t1 t2 ];
  v = [ v1 v2 ];
endfunction