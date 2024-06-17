%% Skript for estimering av grenseverdi
% Dette skriptet estimerer grenseverdien av en funksjon
% n�r argumentet x g�r mot uendelig.
% Funksjonsuttrykket defineres i starten av skriptet.
% Skriptet plotter f(x) for stadig h�yere x-verdier.

%% Initialisering
% Definerer funksjonsuttrykket og startverdi for x

% Definerer funksjonsuttrykket `f`
f = @(x) (x.^2 - 8 .* x + 15) ./ (2 .* x.^2 - 50);  % Funksjonen vi skal finne grensen til

% Initialiserer startverdien for x
x = 1;  % Startverdi for x

%% Beregning av grenseverdi
% Beregner funksjonsverdiene f(x) for stadig h�yere x-verdier

% Initialiserer vektorer for � lagre resultater
Xvektor = zeros(1, 20);        % Vektor for x-verdiene
GrenseVektor = zeros(1, 20);   % Vektor for grenseverdiene

% L�kke der x blir dobla for hver iterasjon
for n = 1:20
    Xvektor(n) = x;               % Lagrer x-verdien
    GrenseVektor(n) = f(x);       % Beregner og lagrer estimatet for grenseverdien
    x = x * 2;                    % Dobler x for neste iterasjon
end

%% Plotting
% Plotter estimerte grenseverdier med logaritmisk x-akse for x

% Plotter grenseverdier
semilogx(Xvektor, GrenseVektor, 'bx-')

% Aktiverer rutenett p� plottet for bedre lesbarhet
grid on

% Legger til tittel og tekst p� aksene
xlabel('x', 'FontSize', 12)
ylabel('f(x)', 'FontSize', 12)
title('Estimert grenseverdi for f(x) n�r x g�r mot uendelig', 'FontSize', 14)

% Legger til aksegrenser for � bedre visualisere resultatene
xlim([min(Xvektor) max(Xvektor)])
ylim([min(GrenseVektor) max(GrenseVektor)])
