function [p] = pressure (k, n, R)
	% k = vector of permeabilities
	% n = vector of porosities
	% R = vector of reactions
	% k_mid = vector of permeabilities at mid-span
	% e = subdiagonal vector
	% f = diagonal vector
	% g = superdiagonal vector
	% [K]{p} = {q}
	global gamma_w;
	global A;
	global dx;
	global p_in;
	global p_out;
	
	k_mid = (k(1:end-1) + k(2:end))/2;
	e = k_mid(1:end-1);
	f = -(k_mid(1:end-1)+k_mid(2:end));
	g = k_mid(2:end);
	% q = gamma_w A dx^2 ni Ri
	s = -gamma_w*A*dx^2*n.*R;
	q = s(2:end-1);
	% Apply the boundary conditions
	q(1) = q(1) - k_mid(1)*p_in;
	q(end) = q(end) - k_mid(end)*p_out;
	% Tridiagonal Solver
	%disp(q);
	p = trid(e,f,g,q);
	p = [p_in p p_out]';
endfunction
