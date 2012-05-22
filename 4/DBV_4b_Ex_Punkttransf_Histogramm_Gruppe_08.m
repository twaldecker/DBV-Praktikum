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
% F�hren Sie die Arbeitsschritte aus, an denen ??? als Platzhalter steht
% und speichern Sie das Notebook am Ende ab (zwischendurch auch
% Sicherungskopien).
% 
% Die Aufgabenstellung sowie Hinweise finden Sie im 
%    DBV-Blatt4_Binomialfilter_und_Punkttransformationen.pdf

% ------------------------------------------------------------------------
%% Initialisierung:
coder = 'Cinepak';    %'None', 'Cinepak', 'Indeo3'
addpath('../Packages_Matlab');
addpath('../allg/');
addpath('../allg/Bilder');

%--------------------------------------------------------------------------
%% Bild einlesen:
g1 = imread( 'Bilder/forest_gray_reduced.pgm' );

%--------------------------------------------------------------------------
%% Histogramm:
% Erzeugen Sie das Histogramm des Bildes und stellen Sie es 
% zusammen mit dem Bild dar:
fig1 = figure(1); imshow( g1 );
fig2 = figure(2); imhist(g1);

saveas( fig2, 'Ergebnisse/g1_histo.jpg' );

%--------------------------------------------------------------------------
%% Aufhellung:
% Hellen Sie das Bild g1 deutlich auf.
% Stellen Sie es wieder mit dem Histogramm dar.

g2 = g1 + (255-max(max(g1)));

figure(1); imshow( g2 );
figure(2); imhist( g2 );

imwrite( g2, 'Ergebnisse/g2-aufgehellt.jpg' );
saveas( fig2, 'Ergebnisse/g2-aufgehellt_histo.jpg' );

% Frage: Was bedeutet die Aufhellung für das Histogramm des 
% aufgehellten Bildes?
% A: Aufhellen bedeutet verschieben der Grauwerte im Histogramm.

%--------------------------------------------------------------------------
%% lineare Grauwertnormierung:
% Heben Sie den Kontrast des Bildes !optimal! durch eine 
% lineare Kennlinie an:

g3 = 255 / (max(max(g1)) - min(min(g1))) * (g1 - min(min(g1)));

figure(5); imshow( g3 );
figure(6); imhist( g3 );

imwrite( g3, 'Ergebnisse/g3-normiert.jpg' );
saveas( fig2, 'Ergebnisse/g3-normiert_histo.jpg' );

%--------------------------------------------------------------------------
%% Histogrammequivalisierung bzw. -egalisierung:
% Führen Sie eine Histogrammequivalisierung für das ursprüngliche 
% Bild g1 aus:
g4 = histeq(g1);

figure(7); imshow( g4 );
figure(8); imhist( g4 );

imwrite( g4, 'Ergebnisse/g4-egalisiert.jpg' );
saveas( fig2, 'Ergebnisse/g4-egalisiert_histo.jpg' );

% Fragen: 
% 1) Was fällt Ihnen auf?
% A: Es rauscht voll. ???
% 
%
% 2) Nennen Sie Gründe für diese Auffälligkeiten
% A: ???
% 

%--------------------------------------------------------------------------
%% Quantisierung:
% Bilden Sie die oberste (Bit 7) und die vierte (Bit 3) Bitebene 
% des Bildes g3, f�r das Sie den Kontrast angehoben haben:
% Stellen Sie diese geeignet dar:
g5a = bitand( g3, 2^7 );
g5a(g5a > 0) = 255;
g5b = bitand( g3, 2^3 );
g5b(g5b > 0) = 255;

figure(1); imshow( g5a );
figure(2); imshow( g5b );

imwrite( g5a, 'Ergebnisse/g5a-obersteBitebene.jpg' );
imwrite( g5a, 'Ergebnisse/g5a-vierteBitebene.jpg' );

% Frage: Wieviele verschiedene Grauwerte enth�lt g5a ?
% A: ???

%--------------------------------------------------------------------------
%% Grauwertschwelle:
% Frage: Durch welche Schwellwertbildung l��t sich die oberste Bitebene
% aus dem Quantisierungsbeispiel auch erzeugen?
% A: ???
%
% Nehmen Sie die Schwellwertbildung am Bild g3 vor:
g6 = ???

figure(2); imshow( g6 );

%% 
'fertig'
