function [u,v,k,p,n,R] = fixedpoint (u_old,R_old,n_old,v_old,t)
  global N;
  u = u_old;
  maxit = 50;
  es = 0.00001;
  iter = 0;
  l = 1; % underrelaxation
  while(1)
    R = reaction(u,t);
    Ravg = 0.5*(R_old + R);
    n = porosity(n_old,R_old, R);
    k = permeability(n);
    p = pressure(k,n,R);
    v = velocity(k,p);
    un = concentration(v,v_old,n,n_old,u_old,Ravg);
    % calculate the %errors for nonzeros
    for i=1:N+1
      if un(i) ~= 0
        ea(i) = abs((un(i)-u(i))/u(i))*100;
      end
    end
    u = l*un + (1-l)*u;
    iter = iter+1;
    % check convergence
    if max(ea) <es || iter >= maxit
      iter
      break
    end
  end
endfunction
