function [ rotation ] = myrotate( varargin )
%ROTATE Summary of this function goes here
%   Detailed explanation goes here

% Parameter prüfen und ggf. setzen
[ I, alpha, x, method ] = check_param( varargin{:} );

% Berechnung der Eingangsbilddimensionen
xdim = size( I, 1 );
ydim = size( I, 2 );

% Berechnung des Default-Rotationszentrums
if( x == 'd' )
    x = [ round( xdim/2 ), round( ydim/2 ) ];
end

% TODO: sinnvolle Berechnung der Ausgangsbilddimensionen
xmaxdim = xdim;
ymaxdim = ydim;

% Initialisierung Ergebnisbild
rotation = zeros( ymaxdim, xmaxdim );

% Rotationsmatrix mit Winkel alpha und Zentrum x
R = [ cos( ( alpha * 2*pi ) / 360 ), -sin( ( alpha * 2*pi ) / 360 ), x(1);
      sin( ( alpha * 2*pi ) / 360 ),  cos( ( alpha * 2*pi ) / 360 ), x(2);
                                  0,                              0, 1];

% Translationsmatrix
T = [ 1, 0, x(1);
      0, 1, x(2);
      0, 0,    1];
  
% Berechnung der Ausgangsbildwerte
for i = 1:maxdia
   for j = 1:maxdia

   end
end
    
end

function [ I, alpha, x, method ] = check_param( varargin )
    % I         Eingangsbild
    % alpha     Rotationswinkel
    % x         Rotationszentrum
    % method    Interpolationsmethode
    
    % Default-Methode:
    x = 'd';
    method = 'n';

    narginchk( 2, 4 )
    
    switch nargin
    case 2,             % rotate( I, alpha )        
      I = varargin{ 1 };
      alpha = varargin{ 2 };
    case 3,             % rotate( I, alpha, x )
      I = varargin{ 1 };
      alpha = varargin{ 2 };
      x = varargin{ 3 };
    case 4,             % rotate( I, alpha, x, method) 
      I = varargin{ 1 };
      alpha = varargin{ 2 };
      x = varargin{ 3 };
      method = varargin{ 4 };
    otherwise,
      disp( 'Fehler, ungültige Parameter!' )
    end
end
