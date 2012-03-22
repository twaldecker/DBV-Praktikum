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
root = 'Y:/';
addpath( [root, 'cls_praktika/Packages_Matlab'] );
% Wechseln Sie in Ihr Unterverzeichnis
cd( [root, 'cls_praktika/DBV_Praktikum/gruppe???'] );
allg_path = [root, 'cls_praktika/DBV_Praktikum/allg'];

%--------------------------------------------------------------------------
%% Bild einlesen:
g = imread( [allg_path, 'Bilder/Tile-gray.pgm'] );
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
???

%--------------------------------------------------------------------------
%% Anwendung:
% - Testen Sie Ihre Funktion mit dem Bild g für verschiedene Winkel und
%   Rotationszentren aus.
% - Speichern Sie repräsentative Ergebnisse mit beschreibendem Namen 
%   in Ergebnisse/ ab.
???

%--------------------------------------------------------------------------
%% Fragen:
% Beschreiben Sie hier Aspekte, die Ihnen bei der Umsetzung oder der
% Anwendung beachtenswert oder auffällig erscheinen:
% A: ???



%% 
'fertig'
