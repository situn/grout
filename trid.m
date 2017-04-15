function [x] = trid (e, f, g, r)
  % From Chapra book
	% Tridiagonal Solver: Variation of Gauss Elimination
	% [A][x] = [r]
	% e = subdiagonal vector
	% f = diagonal vector
	% g = superdiagonal vector
	n = length(f);
	%=FORWARD Elimination
	for i=2:n
		factor = e(i)/f(i-1);
		f(i) = f(i) - factor*g(i-1);
		r(i) = r(i) - factor*r(i-1);
	end
	%=BACK SUBSTITUTION
	x(n) = r(n)/f(n);
	for i=n-1:-1:1
		x(i) = (r(i)-g(i)*x(i+1))/f(i);
	end
endfunction
