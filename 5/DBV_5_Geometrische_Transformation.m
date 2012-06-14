%
% 5. Praktikum - Geometrische Transformation
% ------------------------------------------
% Legen Sie in Ihrem Arbeitsverzeichnis ein Unterverzeichnis an:
%    5.Geometrische-Transformation
%
% Kopieren Sie das Notebook aus ../allg dorthin und benennen Sie es um in
%    5.Geometrische-Transformation_Gruppe-XY.m
% Legen Sie dort ein Unterverzeichnis 'Ergebnisse/' an.
%
% Führen Sie die Arbeitsschritte aus, an denen ??? als Platzhalter steht
% und speichern Sie das Notebook am Ende ab (zwischendurch auch
% Sicherungskopien).
% 
% Die Aufgabenstellung sowie Hinweise finden Sie im 
%    5.DBV-Ex_Geometrische-Transformation.pdf

% ------------------------------------------------------------------------
%% Initialisierung:
coder = 'Cinepak';    %'None', 'Cinepak', 'Indeo3'
addpath('../Packages_Matlab');
addpath('../allg/');
addpath('../allg/Bilder');

%--------------------------------------------------------------------------
%% Bild einlesen:
g = imread( 'Tile-gray.pgm' );
figure(1); imshow( g )

%--------------------------------------------------------------------------
%% Funktion:
% Schreiben Sie in einer separaten Datei eine Funktion mit etwa folgender
% Schnittstelle:
% g_rotiert = rotiere( g, alpha, [y0,x0], 'interpolation_option' );
% Darin steht:
%    g:          Eingabebild
%    alpha:      Rotationswinkel
%    [y0,x0]:    Rotationszentrum (Mittelpunkt)
%    'inter...': String für die Auswahl einer Interpolationsmethode

% A: Die Funktion wurde in der Datei myrotate.m implementiert. Als minimale
%    Übergabeparameter müssen das Ausgangsbild und der Rotationswinkel
%    übergeben werden. Als Default-Wert wird das Rotationszentrum in die
%    Mitte des Bildes gelegt und als Interpolationmethode Nearest-Neighbor
%    verwendet.

%--------------------------------------------------------------------------
%% Anwendung:
% - Testen Sie Ihre Funktion mit dem Bild g für verschiedene Winkel und
%   Rotationszentren aus.
% - Speichern Sie repräsentative Ergebnisse mit beschreibendem Namen 
%   in Ergebnisse/ ab.

% Test des Drehwinkels in 45° Schritten
for phi = 45:45:360
    test = zeros( size( g, 1 ) );
    test = myrotate( g, phi );
    figure, imshow( uint8( test ) );
    filename = sprintf( 'Ergebnisse/rotate_%d.jpg', phi );
    imwrite( uint8( test ), filename );
end

% Test der Rotation um das Rotationszentrum [50, 50] in 30° Schritten bis
% max. 90°
for phi = 30:30:90
    test = zeros( size( g, 1 ) );
    test = myrotate( g, phi, [ 50, 50 ] );
    figure, imshow( uint8( test ) );
    filename = sprintf( 'Ergebnisse/50_50_rotate_%d.jpg', phi );
    imwrite( uint8( test ), filename );
end

% Test der Rotation um das Rotationszentrum [500, 500] in 30° Schritten bis
% max. 90°
for phi = 30:30:90
    test = zeros( size( g, 1 ) );
    test = myrotate( g, phi, [ 500, 500 ] );
    figure, imshow( uint8( test ) );
    filename = sprintf( 'Ergebnisse/500_500_rotate_%d.jpg', phi );
    imwrite( uint8( test ), filename );
end

% Test der verschiedenen Interpolationsmethoden bei einem Rotationswinkel
% von 27°
nearest = myrotate( g, 27, [256,256], 'n' );
figure, imshow( uint8( nearest ) );
imwrite( uint8( nearest ), 'Ergebnisse/nearest.jpg' );

bilinear = myrotate( g, 27, [256,256], 'b' );
figure, imshow( uint8( bilinear ) );
imwrite( uint8( bilinear ), 'Ergebnisse/bilinear.jpg' );

%--------------------------------------------------------------------------
%% Fragen:
% Beschreiben Sie hier Aspekte, die Ihnen bei der Umsetzung oder der
% Anwendung beachtenswert oder auffällig erscheinen:

% A: Die im Vorlesungsskript eingeführte Rotationsmatrix besitzt als
%    Rotationszentrum den Ursprung des Koordinatensystems. Um eine Rotation
%    des Bildes, das als MATLAB-Matrix mit positiven Indizes vorliegt, zu
%    ermöglichen, muss die Rotation in jedem Fall mit einer Translation
%    verbunden werden. Dies geschieht durch Multiplikation der beiden
%    Transformationsmatrizen zu einer Kombinierten
%    Rotations-/Translationsmatrix. Diese kombinierte Matrix wurde in der
%    myrotate-Funktion verwendet. Diese implizite Translation muss bei der
%    Indizierung des Ausgangsbildes, zur Brechnung der interpolierten
%    Grauwerte, berücksichtigt werden. Außerdem können bei der Verwendung
%    der Transformationsmatrix die Indexgrenzen des Ausgangsbilds
%    überschritten werden. Dieser fehlerhafte Zugriff muss durch eine
%    Abfrage verhindert werden.

%    Durch die Rotation des Bilds, werden im Ergebnis bestimmte Bildinhalte
%    abgeschitten. Dieser Umstand fällt vor allem bei Rotationen um ein
%    Zentrum am Rand des Bilds auf. Um eine optimale Funktion anzubieten,
%    müsste vor der eigentlichen Rotation eine Berechnung der
%    Ausgangsbildgröße erfolgen, um das Ergebnisbild vollständig darstellen
%    zu können.

%% 
'fertig'
