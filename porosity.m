function [n] = porosity (n_old, r_old, R)
	global A;
	global dt;
	n = n_old.*(1 - 0.5*A*dt*r_old)./(1 + 0.5*A*dt*R);
endfunction
