%
% 4a. Praktikum - Binomial_Ableitung+Laplace
% ------------------------------------------
% Legen Sie in Ihrem Arbeitsverzeichnis ein Unterverzeichnis an:
%    4a.Binomial_Ableitung+Laplace
%
% Kopieren Sie das Notebook aus ../allg dorthin und benennen Sie es um in
%    4a.Binomial_Ableitung+Laplace_Gruppe-XY.m
% Legen Sie dort ein Unterverzeichnis 'Ergebnisse/' an.
%
% Führen Sie die Arbeitsschritte aus, an denen ??? als Platzhalter steht
% und speichern Sie das Notebook am Ende ab (zwischendurch auch
% Sicherungskopien).
% 
% Die Aufgabenstellung sowie Hinweise finden Sie im 
%    DBV-Blatt4_Binomialfilter+Punkttransformationen.pdf

% ------------------------------------------------------------------------
%% Initialisierung:
coder = 'Cinepak';    %'None', 'Cinepak', 'Indeo3'
root = 'Y:/';
addpath( [root, 'cls_praktika/Packages_Matlab'] );
%% Wechseln Sie in Ihr Unterverzeichnis
cd( [root, 'cls_praktika/DBV_Praktikum/gruppe???'] );
allg_path = [root, 'cls_praktika/DBV_Praktikum/allg'];

%--------------------------------------------------------------------------
%% Bild einlesen:
g = imread( [allg_path, 'Bilder/Tile-gray.pgm'] );
figure(1); imshow( g )

%--------------------------------------------------------------------------
%% Ableitung in x-Richtung:
% Leiten Sie das Bild in x-Richtung mit einem 3x3-Binomialfilter ab.
% Dazu steht die Funktion Binomialfilter() bereit.
hdx = ???
gdx = ???

% Stellen Sie das abgeleitete Bild mit dem Nullpunkt beim mittleren
% Grauwert der Grauwertskala dar und speichern es ab:
figure(2); imshow(???);
imwrite( ???, 'Ergebnisse/Tile-gray_dx.jpg', 'jpg' );

% Frage: Beschreiben Sie das Ergebnis bzgl. Kanten und Flächen:
% A: ???

%--------------------------------------------------------------------------
%% Richtungsableitung:
% Leiten Sie das Bild in Richtung des Vektors n=(x,y)'=(2,1)', also etwa
% in 26-Grad-Richtung ab:
% Verwenden Sie dabei 3x3-Binomialfilter:
???

% Stellen Sie das abgeleitete Bild mit dem Nullpunkt beim mittleren
% Grauwert der Grauwertskala dar und speichern es ab:
figure(3); imshow(???);
imwrite( ???, 'Ergebnisse/Tile-gray_dn.jpg', 'jpg' );

% Frage: Beschreiben Sie den Unterschied im Ergebnis zur Ableitung 
%        in x-Richtung:
% A: ???
% Frage: Warum ist das so?
% A: ???

%--------------------------------------------------------------------------
%% Laplace mit Binomialfilter:
% Erzeugen Sie den 7x7-Binomial-Laplace-Filter. Wie lautet der Operator?
% Filtern Sie das Bild damit:
hblap = ???
gblap = ???

% Stellen Sie das abgeleitete Bild mit dem Nullpunkt beim mittleren
% Grauwert der Grauwertskala dar und speichern es ab:
figure(5); imshow(???);
imwrite( ???, 'Ergebnisse/Tile-gray_binlaplace.jpg', 'jpg' );

% Frage: Beschreiben Sie den Unterschied im Ergebnis zur Ableitung 
%        in x-Richtung:
% A: ???
% Frage: Warum ist das so?
% A: ???

%--------------------------------------------------------------------------
%% Frequenzgang von Binomialfiltern:
% Bestimmen Sie die Maskenbreite eines eindimensional Binomialfilters,
% bei der dieser als Tiefpaß nur noch "das halbe" Spektrum durchläßt.
% Hinweise:
% - Berechnung des Betragsspektrums
% - Beurteilung und Begründung mittels "Anschauen".

???


%%
'fertig'
