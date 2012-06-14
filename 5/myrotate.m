function [ rotation ] = myrotate( varargin )
%Rotate image
%   MYROTATE(I, angle) rotates the image with angle.
%     origin is in the middle of the image.
%     interpolation_method is bilinear.
%
%   MYROTATE(I, angle, [X, Y]) specify [X, Y] as origin for the rotation
%
%   MYROTATE(I, angle, [X, Y], interpolation_method)
%   interpolation_method: n - Nearest-Neighbor
%                         b - Bilinear

% Parameter prüfen und ggf. setzen (siehe Funktion unten)
[ I, alpha, x, method ] = check_param( varargin{:} );

% Berechnung der Eingangsbilddimensionen
xdim = size( I, 1 );
ydim = size( I, 2 );

% Berechnung des Default-Rotationszentrums
if( x == 'd' )
    x = [ round( xdim/2 ), round( ydim/2 ) ];
end

% Initialisierung Ergebnisbild
rotation = zeros( ydim, xdim );

% Rotationsmatrix mit Winkel alpha und Zentrum x
R = [ cos( ( alpha * 2*pi ) / 360 ), -sin( ( alpha * 2*pi ) / 360 ), x(1);
      sin( ( alpha * 2*pi ) / 360 ),  cos( ( alpha * 2*pi ) / 360 ), x(2);
                                  0,                              0, 1];

% Berechnung der kombinierten Rotation/Translation
% Iteration über alle Pixel des Ergebnisbilds
for i = 1:ydim
    for j = 1:xdim
        % Berechnung des Index im Ausgangsbild
        index = R \ [ i; j; 1];
        % Korrektur des Index um das Rotationszentrum
        index = index + [ x( 1 ); x( 2 ); 1 ];
        % Index kann über Bildgrenzen hinauslaufen -> Abfrage
        if( index( 1 ) >= 1 && index( 1 ) <= xdim && index( 2 ) >= 1 && index( 2 ) <= ydim ) 
            % Berechnung der Grauwerte im Ausgangsbild mit der entsprechender Methode
            if(method == 'n')
                rotation( i, j ) = I( round( index( 1 ) ), round( index( 2 ) ) );
            else
                xs = index(1) - floor(index(1));
                ys = index(2) - floor(index(2));
                rotation( i, j ) = I( floor( index(1)), floor( index(2) ) ) * (1 - xs) * (1 - ys) + I( ceil( index(1)), floor( index(2))) * xs * (1 - ys) + I( floor(index(1)), ceil(index(2))) * ys * (1 - xs) + I( ceil(index(1)), ceil(index(2))) * xs * ys;
            end
        end
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
      if(method ~= 'b' && method ~= 'n')
        disp('method muss n oder b sein.');
      end
    otherwise,
      disp( 'Fehler, ungültige Parameter!' )
    end
end
