function [ rotation ] = rotate( i, alpha, x )
%ROTATE Summary of this function goes here
%   Detailed explanation goes here

%check parameters:
if(length(size(i)) ~= 2)
    'i has to be a image';
end
if(length(alpha) ~= 1)
    'provide a integer or float as angle'
end


% Berechnung der Eingangsbilddimensionen
xlen = size( i, 1 );
ylen = size( i, 2 );

% TODO: sinnvolle Berechnung der Ausgangsbilddimensionen
maxdia = round(sqrt( xlen^2 + ylen^2 ));

% Initialisierung Ergebnis
rotation = zeros( maxdia, maxdia );

% Berechnung der Transformationsmatrizen
R = [ cos( ( alpha * 2*pi ) / 360 ), -1* sin( ( alpha * 2*pi ) / 360 ), 0;
      sin( ( alpha * 2*pi ) / 360 ),  cos( ( alpha * 2*pi ) / 360 ), 0;
                                  0,                              0, 1;];
           
T = [ 1, 0, x(1);
      0, 1, x(2);
      0, 0,    1];  
  
  
for u = 1:maxdia
   for v = 1:maxdia
       rotation(u,v) = ([u,v,1]') * R;
   end
end

end

