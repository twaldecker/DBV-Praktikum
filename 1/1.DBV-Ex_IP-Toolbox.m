%
% 1b. Praktikum - Image Processing Toolbox
% ---------------------------------------
% Legen Sie in Ihrem Arbeitsverzeichnis ein Unterverzeichnis an:
%    1b.IP-Toolbox
%
% Kopieren Sie das Notebook aus ../allg dorthin und benennen Sie es um in
%    1b.IP-Toolbox_Gruppe-XY.m
% Legen Sie dort ein Unterverzeichnis 'Ergebnisse/' an.
%
% F�hren Sie die Arbeitsschritte aus, an denen ??? als Platzhalter steht
% und speichern Sie das Notebook am Ende ab (zwischendurch auch
% Sicherungskopien).
% 
% Die Aufgabenstellung sowie Hinweise finden Sie im 
%    1.DBV-Ex_Matlab+IPTB.pdf
%

% ------------------------------------------------------------------------
%% Initialisierung:
coder = 'Cinepak';    %'None', 'Cinepak', 'Indeo3'
addpath('../allg/');
addpath('../allg/Bilder/');
addpath('../Packages_Matlab/');

%--------------------------------------------------------------------------
%% Lesen Sie das Bild 'peppers.png' ein und stellen Sie es dar:
bild = imread('peppers.png');
figure, imshow(bild);

%--------------------------------------------------------------------------
%% Ermitteln Sie folgende Bildinformationen:
% Zahl der Dimensionen:
dim = ndims(bild);
% Bildgr��e in den einzelnen Dimensionen:
[y,x,d] = size(bild);
% Datentyp des Bildes:
???

%--------------------------------------------------------------------------
%% Speichern Sie das Bild als JPEG-Datei in Ergebnisse/ ab
???

%--------------------------------------------------------------------------
%% Trennen sie das Bild in die einzelnen Farbkan�le (rot, gr�n, blau).
%  Stellen Sie diese dar und speichern Sie diese ebenfalls ab
bild_r = ???
bild_g = ???
bild_b = ???

???

%% Was f�llt Ihnen auf bzgl. des Rot- und Blauanteils in den
%  verschiedenen Bildern?
%A: ???
%A: ???

%--------------------------------------------------------------------------
%% Greifen Sie aus dem roten Teilbild die 100-te Zeile heraus und
%  stellen Sie sie als Funktion �ber der x-Koordinate dar;
%  Markieren Sie diese Zeile geeignet im Rotkanalbild und stellen 
%  Sie dieses ebenfalls dar:
zeile_r = ???
???
bild_r2 = ???
???

%% Speichern Sie die Ergebnisse ab:
???

%%
'fertig'
