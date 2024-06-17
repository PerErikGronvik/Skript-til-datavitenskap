%% Skript for plotting av tre plan basert p� ulike tilfeller
% Dette skriptet plotter tre plan i et 3D-rom, hvor planene kan ha enten en l�sning, ingen l�sning eller uendelig mange l�sninger.

%% Initialisering
% Velger omr�de og oppdeling for x- og y-verdiene
x = -10:5e-2:10;
y = x;

% Bestemmer transparens
t = 0.6;

% Lager matriser med x- og y-verdier
[X, Y] = meshgrid(x, y);

%% Case 1: Entydig l�sning
% I dette tilfellet har de tre planene ett unikt skj�ringspunkt. 
% Det betyr at systemet av line�re ligninger har en entydig l�sning.

% Definerer planene - z som funksjoner av x og y
Z1 = -X + 2*Y + 1;
Z2 = 2*X + Y - 2;
Z3 = 0.1*X + 4*Y + 3;

% Plotting av planene
figure(1)
% Plotter det f�rste planet i r�dt
h1 = surf(X, Y, Z1);
shading interp
set(h1, 'FaceColor', [1 0 0], 'FaceAlpha', t);
xlabel('x'); ylabel('y'); zlabel('z')
axis([-10 10 -10 10 -40 60])
title('Entydig l�sning')
hold on

% Plotter det andre planet i gr�nt
h2 = surf(X, Y, Z2);
shading interp
set(h2, 'FaceColor', [0 1 0], 'FaceAlpha', t);

% Plotter det tredje planet i bl�tt
h3 = surf(X, Y, Z3);
shading interp
set(h3, 'FaceColor', [0 0 1], 'FaceAlpha', t);

hold off

%% Case 2: Ingen l�sning
% I dette tilfellet er de tre planene parallelle eller de skj�rer hverandre
% p� en slik m�te at de aldri m�tes i et felles punkt. Dette betyr at
% systemet av line�re ligninger har ingen l�sning.

% Definerer planene - z som funksjoner av x og y
Z1 = -X + 2*Y + 1;
Z2 = 2*X + Y - 2;
% Her er planene parallelle
Z3 = 0.5*X + 1.5*Y + 3;

% Plotting av planene
figure(2)
% Plotter det f�rste planet i r�dt
h1 = surf(X, Y, Z1);
shading interp
set(h1, 'FaceColor', [1 0 0], 'FaceAlpha', t);
xlabel('x'); ylabel('y'); zlabel('z')
axis([-10 10 -10 10 -40 60])
title('Ingen l�sning')
hold on

% Plotter det andre planet i gr�nt
h2 = surf(X, Y, Z2);
shading interp
set(h2, 'FaceColor', [0 1 0], 'FaceAlpha', t);

% Plotter det tredje planet i bl�tt
h3 = surf(X, Y, Z3);
shading interp
set(h3, 'FaceColor', [0 0 1], 'FaceAlpha', t);

hold off

%% Case 3: Uendelig mange l�sninger
% I dette tilfellet skj�rer de tre planene hverandre langs en linje,
% noe som betyr at systemet av line�re ligninger har uendelig mange l�sninger.
% Dette skjer fordi noen av ligningene er line�rt avhengige.

% Definerer planene - z som funksjoner av x og y
Z1 = -X + 2*Y + 1;
Z2 = 0.5*X + 1.5*Y - 0.5;
Z3 = 2*X + Y - 2;

% Plotting av planene
figure(3)
% Plotter det f�rste planet i r�dt
h1 = surf(X, Y, Z1);
shading interp
set(h1, 'FaceColor', [1 0 0], 'FaceAlpha', t);
xlabel('x'); ylabel('y'); zlabel('z')
axis([-10 10 -10 10 -40 60])
title('Uendelig mange l�sninger')
hold on

% Plotter det andre planet i gr�nt
h2 = surf(X, Y, Z2);
shading interp
set(h2, 'FaceColor', [0 1 0], 'FaceAlpha', t);

% Plotter det tredje planet i bl�tt
h3 = surf(X, Y, Z3);
shading interp
set(h3, 'FaceColor', [0 0 1], 'FaceAlpha', t);

hold off

%% Forklaring av fri variabel
% En fri variabel oppst�r i et system av line�re ligninger n�r vi har
% flere ukjente enn uavhengige ligninger. Dette f�rer til uendelig mange l�sninger.
% I slike tilfeller kan vi velge en eller flere av de ukjente som frie variabler,
% og uttrykke de andre variablene som funksjoner av disse frie variablene.

% Eksempel:
% La oss si vi har systemet:
% x + y + z = 1
% x - y + 2z = 3
% 2x + 3y - z = -1
%
% Dette systemet kan l�ses ved � bruke Gauss-eliminasjon, noe som kan f�re til
% at en av variablene (f.eks. z) blir fri. Vi kan da uttrykke x og y som funksjoner av z.
% Hvis z er den frie variabelen, kan vi skrive l�sningen som:
% x = f1(z)
% y = f2(z)
% z = z (fri variabel)
%
% Dette betyr at for enhver verdi av z, vil vi ha en tilsvarende verdi for x og y,
% og dermed uendelig mange l�sninger.
