function [] = plotall(index, M)
  [m,n] = size(M);
  for i=2:m
    plot(sqrt(index), M(i,:));
    %semilogx(index,M(i,:));
    hold on;
  end
  hold off;
endfunction