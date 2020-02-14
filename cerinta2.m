function cerinta2()

  %subpunctul 1: folosond descompunerea valorilor singulare
  A = imread('image2.gif');
  A=double(A);
  [U, S, V] = svd(double(A));
  v = diag(S);  
  sort(v,  'descend');
  subplot(2, 2, 1);
  plot(v), title('Figure 1');
  %subpunctul 2: folosind descompunerea redusa a valorilor singulare
  [m n] = size(A);
  info = zeros(20, 1);
  for k = 1:20
     s1 = 0;
     s2 = 0;
    for i = 1:k
      s1 = s1 + S(i, i);
    endfor
    for i = 1:min([m n])
      s2 = s2 + S(i, i);
  endfor
  info(k) = s1 / s2;
endfor

  subplot(2, 2, 2);
  plot(info), title('Figure 2');
  
  %subpunctul 3: eroarea aproximarii
  
  eroare = zeros(20, 1);
  for k = 1:20
  A_k = cerinta1('image2.gif', k);
   A_k = double(A_k);
  s3 = 0;
    for i = 1:m
      for j = 1:n
        s3 = s3 + (A(i, j) - A_k(i, j)) ^ 2;
      endfor
    endfor
  eroare(k) = s3 / (m * n);
  endfor

  subplot(2, 2, 3);
  plot(eroare), title('Figure 3');

  %subpunctul 4: rata de compresie
  for k = 1:20
  rc(k) = (m*k + n*k + k) / (m*n);
  endfor
  subplot(2, 2, 4);
  plot(rc), title('Figure 4');
      
  endfunction                           