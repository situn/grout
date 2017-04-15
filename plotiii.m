function [] = plotiii (M, tot)
  [m,n] = size(M);
  tottime = tot *60;
  step = tottime / (n-1); % 1st col correspond to t = 0 hence excluded
  id = 0:step:tottime;
  id = sqrt(id);
  plot(id,M(ceil(m/3),:),id,M(ceil(2*m/3),:),id,M(m,:));
  legend('x=L/3', 'x=2L/3', 'x=L');
endfunction
