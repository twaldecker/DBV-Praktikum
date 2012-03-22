%
% 4b. Praktikum - Punkttransformation + Histogramm
% ------------------------------------------------
% Legen Sie in Ihrem Arbeitsverzeichnis ein Unterverzeichnis an:
%    4b.Punkttransf+Histogramm
%
% Kopieren Sie das Notebook aus ../allg dorthin und benennen Sie es um in
%    4b.Punkttransf+Histogramm_Gruppe-XY.m
% Legen Sie dort ein Unterverzeichnis 'Ergebnisse/' an.
%
% Führen Sie die Arbeitsschritte aus, an denen ??? als Platzhalter steht
% und speichern Sie das Notebook am Ende ab (zwischendurch auch
% Sicherungskopien).
% 
% Die Aufgabenstellung sowie Hinweise finden Sie im 
%    DBV-Blatt4_Binomialfilter_und_Punkttransformationen.pdf

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
g1 = imread( [allg_path, 'Bilder/forest_gray_reduced.pgm'] );

%--------------------------------------------------------------------------
%% Histogramm:
% Erzeugen Sie das Histogramm des Bildes und stellen Sie es 
% zusammen mit dem Bild dar:
fig1 = figure(1); imshow( g1 );
fig2 = figure(2); ???

saveas( fig2, 'Ergebnisse/g1_histo.jpg' );

%--------------------------------------------------------------------------
%% Aufhellung:
% Hellen Sie das Bild g1 deutlich auf.
% Stellen Sie es wieder mit dem Histogramm dar.
g2 = ???

figure(1); imshow( g2 );
figure(2); ???

imwrite( g2, 'Ergebnisse/g2-aufgehellt.jpg' );
saveas( fig2, 'Ergebnisse/g2-aufgehellt_histo.jpg' );

% Frage: Was bedeutet die Aufhellung für das Histogramm des 
% aufgehellten Bildes?
% A: ???
%

%--------------------------------------------------------------------------
%% lineare Grauwertnormierung:
% Heben Sie den Kontrast des Bildes !optimal! durch eine 
% lineare Kennlinie an:
???

figure(1); imshow( g3 );
figure(2); ???

imwrite( g3, 'Ergebnisse/g3-normiert.jpg' );
saveas( fig2, 'Ergebnisse/g3-normiert_histo.jpg' );

%--------------------------------------------------------------------------
%% Histogrammäquivalisierung bzw. -egalisierung:
% Führen Sie eine Histogrammäquivalisierung für das ursprüngliche 
% Bild g1 aus:
g4 = ???

figure(1); imshow( g4 );
figure(2); ???

imwrite( g4, 'Ergebnisse/g4-egalisiert.jpg' );
saveas( fig2, 'Ergebnisse/g4-egalisiert_histo.jpg' );

% Fragen: 
% 1) Was fällt Ihnen auf?
% A: ???
% 
%
% 2) Nennen Sie Gründe für diese Auffälligkeiten
% A: ???
% 

%--------------------------------------------------------------------------
%% Quantisierung:
% Bilden Sie die oberste (Bit 7) und die vierte (Bit 3) Bitebene 
% des Bildes g3, für das Sie den Kontrast angehoben haben:
% Stellen Sie diese geeignet dar:
g5a = ???
g5b = ???

figure(1); imshow( g5a );
figure(2); imshow( g5b );

imwrite( g5a, 'Ergebnisse/g5a-obersteBitebene.jpg' );
imwrite( g5a, 'Ergebnisse/g5a-vierteBitebene.jpg' );

% Frage: Wieviele verschiedene Grauwerte enthält g5a ?
% A: ???

%--------------------------------------------------------------------------
%% Grauwertschwelle:
% Frage: Durch welche Schwellwertbildung läßt sich die oberste Bitebene
% aus dem Quantisierungsbeispiel auch erzeugen?
% A: ???
%
% Nehmen Sie die Schwellwertbildung am Bild g3 vor:
g6 = ???

figure(2); imshow( g6 );

%% 
'fertig'
