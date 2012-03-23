% Aufgabe 1a

% 1. Dies ist ein Kommentar

%% 2. Unterdrückung der Befehlsausgabe:
a = 1;

%% 3. Alle Variablen des Workspaces:
who

%% 4. Suchpfad:
path

%% 5. Löschen einer Variablen a
clear a

%% 6. Löschen aller Variablen:
clear all

%% 7. 3x4 Matrix mit Nullen:
B = zeros(3,4)

%% 8. 1x3 Zeilenvektor:
a = [1 2 3]

%% 9. 3x1 Spaltenvektor:
a = [1;2;3]

%% 10. 3-te Spalte einer Matrix A
A = magic(4)
A(:,3)

%% 11. zweite Zeile
A(2,:)

%% 12. Transposition
A'

%% 13. vertikale Aneinanderreihung von A und B
A = magic(2)
B = magic(2)

[A,B]

%% 14. horizontale Aneinanderreihung von A und B
[A;B]

%% 15. Größe einer Matrix [1,2,3]
size([1,2,3])

%% 16. Dimensionen einer Matrix [1,2,3]
ndims([1,2,3])
% ndims gibt die Anzahl der Dimensionen zurück
% size die Größe der einzelnen Dimensionen

%% 17. Aneinanderhängen 2er Strings
a='123';
b='456';
strcat(a,b)

%% 18. Setzen aller negativen Elemente einer Matrix auf null:
A = [1, -1, 1; -1, -1, 1; 1, -1, -1]
A(A<0)=0

%% 19. Zahlen mit Abstand 10 von 1 bis 100:
1:10:100

%% 20. Zahl der Übergabeparameter einer Funktion
nargin

%% 21. Beginn eines Abschnitts der im Editor spearat ausgeführt wird.
%-> siehe alle aufgaben vorher...

%% 22. Ort wo eine Funktion ist:
which

%% 23.
path(path,'ttt/');
myAddProd(1);
[a,b] = myAddProd(1,2)
