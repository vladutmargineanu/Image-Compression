function A_k = cerinta1 (image, k)
  
  % image reprezinta calea catre imagine
  % k numarul de valori singulare
  A = imread(image);
  [m n] = size(A);
  [U, S, V] = svd(double(A));
  V_k = V';
  A_k = U([1:m], [1:k]) * S([1:k], [1:k]) * V_k([1:k], [1:n]);
 
  endfunction