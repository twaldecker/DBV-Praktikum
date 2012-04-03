%
% 2. Praktikum - Unterabtastung + Spektrum
% ----------------------------------------
% Legen Sie in Ihrem Arbeitsverzeichnis ein Unterverzeichnis an:
%    2.Unterabtastung+Spektrum
%
% Kopieren Sie das Notebook aus ../allg dorthin und benennen Sie es um in
%    2.Unterabtastung+Spektrum_Gruppe-XY.m
% Legen Sie dort ein Unterverzeichnis 'Ergebnisse/' an.
%
% Führen Sie die Arbeitsschritte aus, an denen ??? als Platzhalter steht
% und speichern Sie das Notebook am Ende ab (zwischendurch auch
% Sicherungskopien).
% 
% Die Aufgabenstellung sowie Hinweise finden Sie im 
%    2.DBV-Ex_Unterabtastung+Spektrum.pdf

% ------------------------------------------------------------------------
%% Initialisierung:
coder = 'Cinepak';    %'None', 'Cinepak', 'Indeo3'
root = 'Y:/';
addpath( [root, 'cls_praktika/Packages_Matlab'] );
%% Wechseln Sie in Ihr Unterverzeichnis
cd( [root, 'cls_praktika/DBV_Praktikum/gruppe???'] );
allg_path = [root, 'cls_praktika/DBV_Praktikum/allg'];

%--------------------------------------------------------------------------
%% Stellen Sie das Bild 'Linien-10Grad-800.pgm' dar:
???

%--------------------------------------------------------------------------
%% Unterabtastung: Verkleinern Sie das Bild jeweils um den Faktor 2:
% Greifen Sie dazu jede 2te Zeile und Spalte heraus, um die folgenden
% Auflösungen zu erhalten. Stellen Sie die Bilder jeweils dar:

%% Auflösung: 400x400 Bildpunkte:
???

%% Auflösung: 200x200 Bildpunkte:
???

%% Auflösung: 100x100 Bildpunkte:
???

% Kommentieren Sie die Ergebnisse:
% A: ???

%% Speichern Sie die Bilder in Ergebnisse/ ab:
???

%--------------------------------------------------------------------------
%% Fourier-Transformation:
%  Erzeugen Sie ein 400x400-Bild vom Typ 'single' 
%  mit einem weißen 200x200-Rechteck in der Mitte:
???

% Erzeugen Sie ein 400x400-Bild vom Typ 'single'
% mit einem weißen 20x200-Recheck in der Mitte:
???

%% Berechnen Sie die Betragsspektren der beiden Bilder:
???

%% Stellen Sie die Betragsspektren dar, indem Sie die Spektren auf den 
%  Maximalwert normieren und ggf. etwas aufhellen:
???

%% Kommentieren Sie das Ergebnis:
%A: ???

%% Speichern Sie die Rechtecke sowie deren Spektren in Ergebnisse/:
???

%--------------------------------------------------------------------------
%% Fourier-Transformation / Orientierung:
%  Rotieren Sie das schmale Rechteck um 60 Grad:
???

%% Berechnen Sie das Betragsspektrum des rotierten Bildes:
???

%% Stellen Sie die Betragsspektren des ursprünglichen und des rotierten
%  Bildes dar, indem Sie die Spektren auf den Maximalwert normieren 
%  und ggf. etwas aufhellen:
???

%% Kommentieren Sie das Ergebnis:
%A: ???

%% Speichern Sie das rotierte Rechteck sowie dessen Spektrum in Ergebnisse/:
???

%%
'fertig'
