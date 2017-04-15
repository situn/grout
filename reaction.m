function [R] = reaction (u, t)
	% u = vector of concentrations at various points
	% t = time
	% R = C * u/(D+u)(1-Et)
	global C;
	global D;
	global E;
	R = C*(u./(D+u))*(1-t/E);
endfunction
