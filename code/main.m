% ---------------------
% This script calculates the SampEn signatures and metrics for a given
% dataset
%
% [1] Rozendo, G. B., Nascimento, M. Z., Roberto G. F., Faria, P. R., Silva, A. B., Tosta, T. A. A., Neves, L. A. (2022). Classification of Non-Hodgkin Lymphomas Based on Sample Entropy Signatures. Expert Systems with Applications.
% ---------------------

m_to_calculate = 2;

parfor m = 1 : m_to_calculate
   parallel_execution_singleclass(m);
end

