function [v] = velocity (k, p)
	global gamma_w;
	global dx;
	v1 = (-k(1)/gamma_w)*(-3*p(1)+4*p(2)-p(3))/(2*dx);
	v = (-1/(2*dx*gamma_w))*k(2:end-1).*(p(3:end)-p(1:end-2));
	vend = (-k(end)/gamma_w)*(3*p(end)-4*p(end-1)+p(end-2))/(2*dx);
	v = [v1;v;vend];
endfunction
