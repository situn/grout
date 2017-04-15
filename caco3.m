function [uc] = caco3 (n,n_old,uc_old)
  global rho_caco3;
  uc = rho_caco3*(n_old - n) + uc_old;
endfunction