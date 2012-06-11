function [ rotation ] = rotate( i, alpha, x )
%ROTATE Summary of this function goes here
%   Detailed explanation goes here

% Berechnung der Eingangsbilddimensionen
xlen = size( i, 1 );
ylen = size( i, 2 );

% TODO: sinnvolle Berechnung der Ausgangsbilddimensionen
maxdia = sqrt( xlen^2 + ylen^2 );

% Initialisierung Ergebnis
rotation = zeros( maxdia, maxdia );

% Berechnung der Transformationsmatrizen
R = [ cos( ( alpha * 2*pi ) / 360 ), -sin( ( alpha * 2*pi ) / 360 ), 0;
      sin( ( alpha * 2*pi ) / 360 ),  cos( ( alpha * 2*pi ) / 360 ), 0;
                                  0,                              0, 1];
           
T = [ 1, 0, x(1);
      0, 1, x(2);
      0, 0,    1];
  
for i = 1:maxdia
   for j = 1:maxdia
       
   end
end

end

