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

% Canny-"Operator" liefert sehr gute Ergebnisse bei der
% Kantendetektion/-bildung
gk = edge( g, 'canny', 0.6, 2 );
fig2 = figure( 2 ); imshow( gk );
imwrite( gk, 'Ergebnisse/Kantenbild.tif' );

%--------------------------------------------------------------------------
%% Kantenmaske:
% Bilden Sie daraus ein Binärbild, welches als Maske für die Kantenbereiche 
% dient (für Kantenbildpunkte eine eins, sonst eine 0):
% Speichern Sie das Ergebnis ab: 'Ergebnisse/Kantenmaske.tif;

% Canny-"Operator" liefert bereits ein Binärbild
imwrite( gk, 'Ergebnisse/Kantenmaske.tif' );

%--------------------------------------------------------------------------
%% Parameterraum:
% Bilden Sie ein geeignet dimensioniertes Array zur Aufnahme des
% Parameterraumes für die Hough-Transformation zum Auffinden von Kreisen.
%
% Folgende Vorkenntnissen sind vorhanden:
% - die Objekte sind mindestens 25 Pixel von den Bildrändern entfernt
% - die Kreisradien liegen im Intervall [10,20]

% Intervall für Kreisradien wurde auf [10,25] vergrößert
A = zeros( [size( g ), 16] );

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
    % Berechne Pixelkoordinaten
    [y,x] = ind2sub( size( gk ), ind( i ) );
    % Für alle möglichen Kreismittelpunkte
    for j = 1:3:size( A, 1 )
        for k = 1:3:size( A, 2 )
            % Radien berechnen und akkumulieren falls im Intervall
            r = round( norm( [y,x] - [j,k], 2 ) );
            if( r >= 10 && r <= 25 )
                A(j,k,r-9) = A(j,k,r-9) + 1;
            end
        end
    end
end

%--------------------------------------------------------------------------
%% Parameterraum auf erlaubten Bereich einschränken:
% Schränken Sie nun den Parameterraum ein unter Nutzung obiger Vorkenntnisse.
% (dieser Schritt kann zunächst auch übersprungen werden).

% Bildränder werden nicht beachtet
A( 1:25, 1:25, : ) = 0;
A( size( A, 1 ) - 25:end, size( A, 2 ) - 25:end, : ) = 0;

%--------------------------------------------------------------------------
%% Ermittlung geeigneter Kreiskandidaten:
% - suchen Sie nun in der Hough-Transformierten die ersten 9 Maxima,
% - merken sich die entsprechenden Parameterwerte

% Matrix P enthält Koordinaten der Kreismittelpunkte und Kreisradien
ind = find( A == max( A(:) ) );
[y,x,r] = ind2sub( size( A ), ind( 1 ) );
clear P;
P( 1, : ) = [y,x,r+9];
A( y, x, r ) = 0;
for i = 1:8
    ind = find( A == max( A(:) ) );
    [y,x,r] = ind2sub( size( A ), ind( 1 ) );
    P = vertcat( P , [y,x,r+9] );
    % Variante A Maxima werden streng lokal auf Null gesetzt
    % A( y, x, r+9 ) = 0;
    % Variante B Maxima werden großflächig auf Null gesetzt
    A( y-10:y+10, x-10:x+10, : ) = 0;
end

%--------------------------------------------------------------------------
%% Kreisdarstellungen:
% Zeichnen Sie die Mittelpunkte und Kreise der gefundenen Objekte grün in
% das Originalbild ein und speichern es ab: 'Ergebnisse/Hough-Kreise.tif';

fig3 = figure( 3 ); imshow( g );
hold on;

% Quantisierung 360°
phi = 0:0.05:2*pi;

for i = 1:9
    % Kreise zeichenen
    xk = ( P( i, 3 ) * cos( phi ) ) + P( i, 2 );
    yk = ( P( i, 3 ) * sin( phi ) ) + P( i, 1 );
    plot( xk, yk, 'g' );
    % Mittelpunkt zeichnen
    plot( P( i, 2 ), P( i, 1 ), 'gx' );
end

saveas( fig3, 'Ergebnisse/Hough-Kreise.tif' );

%--------------------------------------------------------------------------
%% Fragen: 
% Angenommen, alle Punkte einer Kante werden in der Kantenmaske erfaßt.
% Werden große Kreise gegenüber kleinen bevorzugt gefunden (bzgl. der
% Reihenfolge gefundener Maxima in der Hough-Transformierten)?
% A: Für den Fall, dass alle Punkte einer Kante erfasst werden, werden
% große Kreise bzgl. der Maxima in der Hough-Transformation bevorzugt.

% Warum ist das so bzw. warum nicht?
% A: Da die Kanten größerer Kreise aus einer größeren Anzahl von Pixel
% bestehen, steigt mit zunehmendem Radius auch die Anzahl der
% Akkumulierungen im Parameterraum. Das Ergebnis sind größere lokale Maxima
% an Stellen mit größeren Radien im Parameterraum.

% Wie könnte man die Bevorzugung großer Kreise vermeiden bzw.
% wie könnte man große Kreise bevorzugt erkennen (Vorschlag)?
% A: Akkumulation des Parameterraums nicht mit konstantem Wert 1 sondern
% 1 / (Radius * f).

% Ist sonst noch etwas aufgefallen?
% A: - ovale nicht optimale Kreise werden nicht mehr erkannt
%    - Maxima lokal Nullen -> manche Münzen werden mehrfach erkannt,
%                             andere gar nicht
%    - Pixel des Kugelschreiber werden als Kreispunkte interpretiert
%    - Schatten werden bei der Kantenbildung als Objektrand interpretiert

% Nennen Sie Maßnahmen zur Beschleunigung des Verfahrens:
% A: - Parallelisierung der Iteration über den Parameterraum
%    - For-Schleifen in MATLAB durch Matrizenopteration ersetzten
%    - Parameterraum weiter einschränken
%    - "coarse-to-fine" Strategie mittels Laplace-/Gausspyramiden

%% 
'fertig'
