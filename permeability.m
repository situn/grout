function [k] = permeability (n)
	% n = vector of porosity at differerent points
	% k = vector of permeability at different points
	% k = B*n^3/(1-n)^2
	global B;
	k = B*n.^3./(1-n).^2;
endfunction
