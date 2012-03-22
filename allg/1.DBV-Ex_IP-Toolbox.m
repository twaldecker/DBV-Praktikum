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
% Führen Sie die Arbeitsschritte aus, an denen ??? als Platzhalter steht
% und speichern Sie das Notebook am Ende ab (zwischendurch auch
% Sicherungskopien).
% 
% Die Aufgabenstellung sowie Hinweise finden Sie im 
%    1.DBV-Ex_Matlab+IPTB.pdf
%

% ------------------------------------------------------------------------
%% Initialisierung:
coder = 'Cinepak';    %'None', 'Cinepak', 'Indeo3'
root = 'Y:/';
addpath( [root, 'cls_praktika/Packages_Matlab'] );
%% Wechseln Sie in Ihr Unterverzeichnis
cd( [root, 'cls_praktika/DBV_Praktikum/gruppe???'] );
allg_path = [root, 'cls_praktika/DBV_Praktikum/allg'];

%--------------------------------------------------------------------------
%% Lesen Sie das Bild 'peppers.png' ein und stellen Sie es dar:
bild = ???
???

%--------------------------------------------------------------------------
%% Ermitteln Sie folgende Bildinformationen:
% Zahl der Dimensionen:
???
% Bildgröße in den einzelnen Dimensionen:
???
% Datentyp des Bildes:
???

%--------------------------------------------------------------------------
%% Speichern Sie das Bild als JPEG-Datei in Ergebnisse/ ab
???

%--------------------------------------------------------------------------
%% Trennen sie das Bild in die einzelnen Farbkanäle (rot, grün, blau).
%  Stellen Sie diese dar und speichern Sie diese ebenfalls ab
bild_r = ???
bild_g = ???
bild_b = ???

???

%% Was fällt Ihnen auf bzgl. des Rot- und Blauanteils in den
%  verschiedenen Bildern?
%A: ???
%A: ???

%--------------------------------------------------------------------------
%% Greifen Sie aus dem roten Teilbild die 100-te Zeile heraus und
%  stellen Sie sie als Funktion über der x-Koordinate dar;
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
