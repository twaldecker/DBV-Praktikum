function [ summe, produkt ] = myAddProd( arg1, arg2 )
%MYADDPROD Summary of this function goes here
%   Detailed explanation goes here
  if(nargin ~= 2)
    disp('Fehler, es müssen unbedingt zwei Parameter übergeben werden!')
    %summe = produkt = 0;
  else
    summe = arg1 + arg2;
    produkt = arg1 * arg2;
  end
  
end

