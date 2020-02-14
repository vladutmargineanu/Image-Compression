function [A_k S] = cerinta4(image, k)
  
   A = imread(image);
   A = double(A);
  [m n] = size(A);
  miu = zeros(m, 1);
  % calculam media pentru fiecare vector ai
  for i = 1:m
    sum = 0;
    for j = 1:n 
      sum = sum + A(i,j);
    endfor
    miu(i) = sum / n;
  endfor
  % actualizam vectorii ai
  for i = 1:m
    for j = 1:n
      A(i,j) = A(i,j)  -  miu(i);
    endfor
  endfor
  % Construim matricea de covarianta.
  Z = zeros(m,  m);
  Z = (1/(n-1)) * A * A' ;
  % Aplicam functia eig
  [V S] = eig(Z);
  % Construim matricea W (spatiul componentelor principale)
  W = V([1:m],  [1:k]);
   % calculam proiectia lui A
  Y = W' * A;
  % Se aproximeaza matricea initiala 
  A_k = W * Y + miu;
 
endfunction
  
  