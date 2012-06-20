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
g = im2single( imread('Geldstücke-klein.pgm' ) );
fig1 = figure(1); imshow(g);

%--------------------------------------------------------------------------
%% Kantendetektion:
% Wenden Sie auf das Bild geeignete Operationen an, um Bereiche mit 
% Kanten zu detektieren.
% Speichern Sie das Ergebnis ab: 'Ergebnisse/Kantenbild.tif';
%???

%--------------------------------------------------------------------------
%% Kantenmaske:
% Bilden Sie daraus ein Binärbild, welches als Maske für die Kantenbereiche 
% dient (für Kantenbildpunkte eine eins, sonst eine 0):
% Speichern Sie das Ergebnis ab: 'Ergebnisse/Kantenmaske.tif;
%???

%--------------------------------------------------------------------------
%% Parameterraum:
% Bilden Sie ein geeignet dimensioniertes Array zur Aufnahme des
% Parameterraumes für die Hough-Transformation zum Auffinden von Kreisen.
%
% Folgende Vorkenntnissen sind vorhanden:
% - die Objekte sind mindestens 25 Pixel von den Bildrändern entfernt
% - die Kreisradien liegen im Intervall [10,20]
%???

%--------------------------------------------------------------------------
%% Berechnung Hough-Transformation:
% Berechnen Sie die Hough-Transformation.
% Dabei sollen folgende Intervalleinteilungen gelten:
% - Kreismittelpunkte: delta_mx = 3, delta_my = 3
% - Kreisradien: delta_r = 1
% Es genügt, nur jeweils jeden zweiten Pixel in x/y-Richtung zu verwenden.
%???

%--------------------------------------------------------------------------
%% Parameterraum auf erlaubten Bereich einschränken:
% Schränken Sie nun den Parameterraum ein unter Nutzung obiger Vorkenntnisse.
% (dieser Schritt kann zunächst auch übersprungen werden).
%???

%--------------------------------------------------------------------------
%% Ermittlung geeigneter Kreiskandidaten:
% - suchen Sie nun in der Hough-Transformierten die ersten 9 Maxima,
% - merken sich die entsprechenden Parameterwerte
%???

%--------------------------------------------------------------------------
%% Kreisdarstellungen:
% Zeichnen Sie die Mittelpunkte und Kreise der gefundenen Objekte grün in
% das Originalbild ein und speichern es ab: 'Ergebnisse/Hough-Kreise.tif';
%???

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

