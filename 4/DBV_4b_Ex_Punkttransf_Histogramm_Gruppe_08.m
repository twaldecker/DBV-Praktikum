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

%Aufhellung: lineare dehnung mit maximalem grauwert auf 255.
g2 = cast(g1, 'double')./cast(max(max(g1)), 'double').*255;
g2 = round(g2);
g2 = cast(g2, 'uint8');

figure(1); imshow( g2 );
figure(2); imhist( g2 );

imwrite( g2, 'Ergebnisse/g2-aufgehellt.jpg' );
saveas( fig2, 'Ergebnisse/g2-aufgehellt_histo.jpg' );

% Frage: Was bedeutet die Aufhellung f�r das Histogramm des 
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
%% Histogramm�quivalisierung bzw. -egalisierung:
% F�hren Sie eine Histogramm�quivalisierung f�r das urspr�ngliche 
% Bild g1 aus:
g4 = ???

figure(1); imshow( g4 );
figure(2); ???

imwrite( g4, 'Ergebnisse/g4-egalisiert.jpg' );
saveas( fig2, 'Ergebnisse/g4-egalisiert_histo.jpg' );

% Fragen: 
% 1) Was f�llt Ihnen auf?
% A: ???
% 
%
% 2) Nennen Sie Gr�nde f�r diese Auff�lligkeiten
% A: ???
% 

%--------------------------------------------------------------------------
%% Quantisierung:
% Bilden Sie die oberste (Bit 7) und die vierte (Bit 3) Bitebene 
% des Bildes g3, f�r das Sie den Kontrast angehoben haben:
% Stellen Sie diese geeignet dar:
g5a = ???
g5b = ???

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
