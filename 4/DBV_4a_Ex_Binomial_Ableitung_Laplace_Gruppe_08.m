%
% 4a. Praktikum - Binomial_Ableitung+Laplace
% ------------------------------------------
% Legen Sie in Ihrem Arbeitsverzeichnis ein Unterverzeichnis an:
%    4a.Binomial_Ableitung+Laplace
%
% Kopieren Sie das Notebook aus ../allg dorthin und benennen Sie es um in
%    4a.Binomial_Ableitung+Laplace_Gruppe-XY.m
% Legen Sie dort ein Unterverzeichnis 'Ergebnisse/' an.
%
% F�hren Sie die Arbeitsschritte aus, an denen ??? als Platzhalter steht
% und speichern Sie das Notebook am Ende ab (zwischendurch auch
% Sicherungskopien).
% 
% Die Aufgabenstellung sowie Hinweise finden Sie im 
%    DBV-Blatt4_Binomialfilter+Punkttransformationen.pdf

% ------------------------------------------------------------------------
%% Initialisierung:
coder = 'Cinepak';    %'None', 'Cinepak', 'Indeo3'
addpath( '../Packages_Matlab' );
addpath( '../allg/' );
addpath( '../allg/Bilder' );

%--------------------------------------------------------------------------
%% Bild einlesen:
g = imread( 'Tile-gray.pgm' );
figure( 1 ), imshow( g );

%--------------------------------------------------------------------------
%% Ableitung in x-Richtung:
% Leiten Sie das Bild in x-Richtung mit einem 3x3-Binomialfilter ab.
% Dazu steht die Funktion Binomialfilter() bereit.
[hdx, nfactor] = Binomialfilter( [3,0,3,1], 0 );
gdx = nfactor .* imfilter( double( g ), double( hdx ) );

% Stellen Sie das abgeleitete Bild mit dem Nullpunkt beim mittleren
% Grauwert der Grauwertskala dar und speichern es ab:
figure( 2 ), imshow( uint8( gdx + 127 ) );
imwrite( uint8( gdx + 127 ), 'Ergebnisse/Tile-gray_dx.jpg', 'jpg' );

% Frage: Beschreiben Sie das Ergebnis bzgl. Kanten und Fl�chen:
% A: Kanten (Schwarze bzw. Weiße) im Ableitungsbild entsprechen
% Grauwertübergänge von Hell zu Dunkel bzw. Dunkel zu Hell.
% Flächen mit ähnlichem Grauwert im Ableitungsbild bedeuten keine / wenig
% Änderung im Bild.

%--------------------------------------------------------------------------
%% Richtungsableitung:
% Leiten Sie das Bild in Richtung des Vektors n=(x,y)'=(2,1)', also etwa
% in 26-Grad-Richtung ab:
% Verwenden Sie dabei 3x3-Binomialfilter:
phi = atan2( -2,1 );
hdx = Binomialfilter( [3,0,3,1], 0 );
[hdy, nfactor] = Binomialfilter( [3,1,3,0], 0 );
hdn = cos( phi ) .* hdx + sin( phi ) .* hdy;
gdn = nfactor .* imfilter( double( g ), double( hdn ) );

% Stellen Sie das abgeleitete Bild mit dem Nullpunkt beim mittleren
% Grauwert der Grauwertskala dar und speichern es ab:
figure( 3 ), imshow( uint8( gdn + 127 ) );
imwrite( uint8( gdn + 127 ), 'Ergebnisse/Tile-gray_dn.jpg', 'jpg' );

% Frage: Beschreiben Sie den Unterschied im Ergebnis zur Ableitung 
%        in x-Richtung:
% A: Die schrägen Kanten werden sehr viel deutlicher gezeigt als die
% die aus den Senkrechten Linien resultierenden.
% Frage: Warum ist das so?
% A: Weil für den gerichteten Ableitungsfilter die Kanten stärker sind, d.h. die
% übergänge schneller sind.

%--------------------------------------------------------------------------
%% Laplace mit Binomialfilter:
% Erzeugen Sie den 7x7-Binomial-Laplace-Filter. Wie lautet der Operator?
% Filtern Sie das Bild damit:
hblabx = Binomialfilter( [7,2,7,0], 0 );
[hblaby, nfactor] = Binomialfilter( [7,0,7,2], 0 );
hblap = 0.5 .* ( hblabx + hblaby );
gblap = nfactor .* imfilter( double( g ), double( hblap ) );

% Stellen Sie das abgeleitete Bild mit dem Nullpunkt beim mittleren
% Grauwert der Grauwertskala dar und speichern es ab:
figure( 4 ), imshow( uint8( gblap + 127 ) );
imwrite( uint8( gblap + 127 ), 'Ergebnisse/Tile-gray_binlaplace.jpg', 'jpg' );

% Frage: Beschreiben Sie den Unterschied im Ergebnis zur Ableitung 
%        in x-Richtung:
% A: Die Grauwertübergänge des Originalbilds werden nur dunkler
% dargestellt. Die Flächen sind nicht mehr einheitlich grau. die engeren
% Bereiche sind heller als die großen Bereiche.
% Frage: Warum ist das so?
% A: ???

%--------------------------------------------------------------------------
%% Frequenzgang von Binomialfiltern:
% Bestimmen Sie die Maskenbreite eines eindimensional Binomialfilters,
% bei der dieser als Tiefpa� nur noch "das halbe" Spektrum durchl��t.
% Hinweise:
% - Berechnung des Betragsspektrums
% - Beurteilung und Begr�ndung mittels "Anschauen".
fg = fftshift( fft2( g ) );
afg = abs( fg );
afg = afg / max( max ( afg ) ) * 255;
figure( 5 ), imshow( afg );

% Werte für xmax/ymax aus Spektrum ablesen:

xmax = 430;
ymax = 95;

du = 1/512; % ???
sizex = round( 1 / ( ( xmax - 256 ) * du ) )
sizey = round( 1 / ( ( 256 - ymax ) * du ) )

[h, nfactor] = Binomialfilter( [sizex,0,sizey,0], 0 );
gsam = nfactor .* imfilter( double( g ), double( h ) );
figure( 6 ), imshow( uint8( gsam ) );

%%
%'fertig'
