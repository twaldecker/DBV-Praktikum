%
% 6. Praktikum - Hough-Transformation
% -----------------------------------
% Legen Sie in Ihrem Arbeitsverzeichnis ein Unterverzeichnis an:
%    6.Hough-Transformation
%
% Kopieren Sie das Notebook aus ../allg dorthin und benennen Sie es um in
%    6.Hough-Transformation_Gruppe-XY.m
% Legen Sie dort ein Unterverzeichnis 'Ergebnisse/' an.
%
% Führen Sie die Arbeitsschritte aus, an denen ??? als Platzhalter steht
% und speichern Sie das Notebook am Ende ab (zwischendurch auch
% Sicherungskopien).
% 
% Die Aufgabenstellung sowie Hinweise finden Sie im 
%    6.DBV-Ex_Hough-Transformation.pdf

% ------------------------------------------------------------------------
%% Initialisierung:
coder = 'Cinepak';    %'None', 'Cinepak', 'Indeo3'
addpath('../Packages_Matlab');
addpath('../allg/');
addpath('../allg/Bilder');

%--------------------------------------------------------------------------
%% Bild einlesen:
g = im2single( imread( 'Geldstücke-klein.pgm' ) );
fig1 = figure( 1 ); imshow( g );

%--------------------------------------------------------------------------
%% Kantendetektion:
% Wenden Sie auf das Bild geeignete Operationen an, um Bereiche mit 
% Kanten zu detektieren.
% Speichern Sie das Ergebnis ab: 'Ergebnisse/Kantenbild.tif';

% Canny-"Operator" liefert sehr gute Ergebnisse
gk = edge( g, 'canny', 0.6, 2 );
fig2 = figure( 2 ); imshow( gk );
hold on;
imwrite( gk, 'Ergebnisse/Kantenbild.tif' );

%--------------------------------------------------------------------------
%% Kantenmaske:
% Bilden Sie daraus ein Binärbild, welches als Maske für die Kantenbereiche 
% dient (für Kantenbildpunkte eine eins, sonst eine 0):
% Speichern Sie das Ergebnis ab: 'Ergebnisse/Kantenmaske.tif;

% Canny-Methode liefert bereits ein Binärbild !
imwrite( gk, 'Ergebnisse/Kantenmaske.tif' );

%--------------------------------------------------------------------------
%% Parameterraum:
% Bilden Sie ein geeignet dimensioniertes Array zur Aufnahme des
% Parameterraumes für die Hough-Transformation zum Auffinden von Kreisen.
%
% Folgende Vorkenntnissen sind vorhanden:
% - die Objekte sind mindestens 25 Pixel von den Bildrändern entfernt
% - die Kreisradien liegen im Intervall [10,20]

A = zeros( [size( g ), 11] );

%--------------------------------------------------------------------------
%% Berechnung Hough-Transformation:
% Berechnen Sie die Hough-Transformation.
% Dabei sollen folgende Intervalleinteilungen gelten:
% - Kreismittelpunkte: delta_mx = 3, delta_my = 3
% - Kreisradien: delta_r = 1
% Es genügt, nur jeweils jeden zweiten Pixel in x/y-Richtung zu verwenden.

% Finde alle Pixel mit dem Wert 1 im Binärbild
ind = find( gk );
% Für alle Pixel mit Wert 1
for i = 1:size( ind )
    [y,x] = ind2sub( size( gk ), ind( i ) );
    % Für alle möglichen Mittelpunkte
    for j = 1:3:size( g, 1 )
        for k = 1:3:293 %size( g, 2 )
            % Radien berechnen und ggf. speichern
            r = round( norm( [y,x] - [j,k], 2 ) );
            if( r >= 10 && r <= 20 )
                A(j,k,r-9) = A(j,k,r-9) + 1;
            end
        end
    end
end



%--------------------------------------------------------------------------
%% Parameterraum auf erlaubten Bereich einschränken:
% Schränken Sie nun den Parameterraum ein unter Nutzung obiger Vorkenntnisse.
% (dieser Schritt kann zunächst auch übersprungen werden).
%???

%--------------------------------------------------------------------------
%% Ermittlung geeigneter Kreiskandidaten:
% - suchen Sie nun in der Hough-Transformierten die ersten 9 Maxima,
% - merken sich die entsprechenden Parameterwerte

ind = find( A == max( A(:) ) );
[y,x,r] = ind2sub( size( A ), ind( 1 ) );
P( 1, : ) = [y,x,r+9];
A( y, x, r ) = 0;
for i = 1:8
    ind = find( A == max( A(:) ) );
    [y,x,r] = ind2sub( size( A ), ind( 1 ) );
    P = vertcat( P , [y,x,r+9] );
    A( y, x, r ) = 0;
end

%--------------------------------------------------------------------------
%% Kreisdarstellungen:
% Zeichnen Sie die Mittelpunkte und Kreise der gefundenen Objekte grün in
% das Originalbild ein und speichern es ab: 'Ergebnisse/Hough-Kreise.tif';

phi = 0:0.05:2*pi;

for i = 1:9
    xk = ( P( i, 3 ) * cos( phi ) ) + P( i, 2 );
    yk = ( P( i, 3 ) * sin( phi ) ) + P( i, 1 );
    plot(xk,yk);
end
%--------------------------------------------------------------------------
%% Fragen: 
% Angenommen, alle Punkte einer Kante werden in der Kantenmaske erfaßt.
% Werden große Kreise gegenüber kleinen bevorzugt gefunden (bzgl. der
% Reihenfolge gefundener Maxima in der Hough-Transformierten)?
% A: ???

% Warum ist das so bzw. warum nicht?
% A: ???

% Wie könnte man die Bevorzugung großer Kreise vermeiden bzw.
% wie könnte man große Kreise bevorzugt erkennen (Vorschlag)?
% A: ???

% Ist sonst noch etwas aufgefallen?
% A: ???

% Nennen Sie Maßnahmen zur Beschleunigung des Verfahrens:
% A: ???

%% 
'fertig'

