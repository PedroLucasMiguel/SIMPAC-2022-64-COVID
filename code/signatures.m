function [ sig ] = signatures(img, m, image_name)
    
  % ---------------------
  % This function calculates the SampEn signatures for a given image (Section 3.2.1 in [1])
  %
  % [1] Rozendo, G. B., Nascimento, M. Z., Roberto G. F., Faria, P. R., Silva, A. B., Tosta, T. A. A., Neves, L. A. (2022). Classification of Non-Hodgkin Lymphomas Based on Sample Entropy Signatures. Expert Systems with Applications.
  % ---------------------
  
  v = 180; % number of sub-images 180
  n = 40; % subimage size
  
  sig = zeros(1, 72);
  
  i = 1;
   for r = 0.06 : 0.02 : 0.4
     fprintf("Calculating SampEn for (%s) m = %d and r = %f ...\n", image_name, m, r);
     sig(1, i) = avr_SampEn(img, m, r, v, n); % Equation 9 in [1]
     i = i + 1;
   end

end