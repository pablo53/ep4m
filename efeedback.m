function f = efeedback(k, beta)
  if (columns(k) <> rows(k) || columns(beta) <> rows(beta) || columns(k) <> columns(beta))
    error("Incompatible dimensions.");
  endif;
  f = k / (ones(rows(k), columns(k)) - k * beta);
endfunction
