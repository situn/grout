function [u] = concentration (v,v_old,n,n_old,u_old,Ravg)
	% [N][u]=[N_old][u_old]-4*dx*Ravg
	
	% Left Side: 
	% e = subdiagonal vector
	% f = diagonal vector
	% g = superdiagonal vector
	global w;
	global N;
	global dx;
	global u_in;
	vbyn = v./n;
	f = repmat(w, N, 1);
	e = -vbyn(2:end);
	e(end) = 0; % derivative BC
	g = vbyn(2:end);
	
	%=Right side
	vn = v_old./n_old;
	for i = 2:N
		old(i) = vn(i)*u_old(i-1) + w*u_old(i) - vn(i)*u_old(i+1) - 4*dx*Ravg(i);
	end
	old(N+1) = w*u_old(N+1) - 4*dx*Ravg(N+1); % Derivative BC
	old(1) = old(1) + vbyn(2)*u_in; % Add BC from left
	
	% Tridiagonal Solver
	u = trid(e,f,g,old);
	u = [u_in u]';
endfunction
