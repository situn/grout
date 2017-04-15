function [retval] = pore (NN, RR, R)
	global A;
	global dt;
	retval = NN.*(1 - 0.5*A*dt*RR)./(1 + 0.5*A*dt*R);
endfunction
