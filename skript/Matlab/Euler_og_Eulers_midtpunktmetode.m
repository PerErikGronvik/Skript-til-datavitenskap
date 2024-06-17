%% Skript som demonstrerer Eulers metode og Eulers midpunktmetode
% Dette skriptet viser implementasjonen av Eulers metode og Eulers midpunktmetode
% for å løse en førsteordens ordinær differensialligning.

%% Eulers metode
% Definerer differensialligningen
differensialLigning = @(x, y) sin(y) - x;

% Start- og sluttverdier for x
x_start = 0;
y_start = 1;
x_slutt = 5;

% Oppdeling av intervallet
antall_intervaller = 500;           % Antall delintervaller
steglengde = (x_slutt - x_start) / antall_intervaller;  % Steglengde h

% Initialisering av vektorer for x og y
x = x_start;
y = y_start;
for n = 1:(antall_intervaller + 1)
    x_verdier(n) = x;
    y_verdier(n) = y;
    y = y + differensialLigning(x, y) * steglengde;  % Oppdaterer y med Eulers metode
    x = x + steglengde;  % Oppdaterer x
end

% Plotter resultatet av Eulers metode
figure;
plot(x_verdier, y_verdier, 'b-', 'LineWidth', 2)
grid on
xlabel('x')
ylabel('y')
title('Eulers metode')
disp('Eulers metode: Løsning plottet.')

%% Eulers midpunktmetode
% Initialisering av vektorer for x og y
x = x_start;
y = y_start;
for n = 1:(antall_intervaller + 1)
    x_verdierMidt(n) = x;
    y_verdierMidt(n) = y;
    k1 = differensialLigning(x, y);  % Beregner k1
    k2 = differensialLigning(x + steglengde / 2, y + k1 * steglengde / 2);  % Beregner k2
    y = y + k2 * steglengde;  % Oppdaterer y med Eulers midpunktmetode
    x = x + steglengde;  % Oppdaterer x
end

% Plotter resultatet av Eulers midpunktmetode
figure;
plot(x_verdierMidt, y_verdierMidt, 'r-', 'LineWidth', 2)
grid on
xlabel('x')
ylabel('y')
title('Eulers midpunktmetode')
disp('Eulers midpunktmetode: Løsning plottet.')

%% Kommentar seksjon
% Eulers metode brukes til å løse differensialligningen dy/dx = sin(y) - x fra x = 0 til x = 5.
% Den oppdaterer y-verdiene ved å bruke formelen y_ny = y_gammel + f(x, y) * h,
% hvor h er steglengden.
%
% Eulers midpunktmetode brukes til å løse samme differensialligning med en forbedret nøyaktighet
% ved å bruke midtpunktet. Den oppdaterer y-verdiene ved å bruke formelen y_ny = y_gammel + k2 * h,
% hvor k1 = f(x, y) og k2 = f(x + h/2, y + k1 * h/2).
%
% Resultatene fra Eulers metode og Eulers midpunktmetode er plottet for å vise løsningene over intervallet [0, 5].
