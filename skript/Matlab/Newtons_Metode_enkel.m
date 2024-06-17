%% Skript for estimering av løsning av likningen f(x)=0 ved hjelp av Newtons metode
% Skriptet kjører til det oppnår ønsket presisjon.
% Input er startverdi x0, funksjonsuttrykket f(x), 
% den deriverte av funksjonen, f'(x), og presisjonen

%% Initialisering
% Setter startverdi, funksjon, derivert og ønsket presisjon

% Startverdi
x0 = 1;  % Startverdi for Newtons metode

% Funksjon
funk = @(x) cos(x) - x;  % Funksjonen f(x)

% Derivert av funksjon
funkDeriv = @(x) -sin(x) - 1;  % Den deriverte av funksjonen f'(x)

% Presisjon
Pres = 1e-4;  % Ønsket presisjon

%% Newtons metode
% Initialiserer x - ny og gammel
x = x0;
xGml = x + 10;  % Tilfeldig startverdi for å sikre at while-løkken starter

% Itererer så lenge forskjellen mellom ny og gammel x er større enn presisjonen
while abs(x - xGml) > Pres
    xGml = x;  % Oppdaterer gammel x
    x = x - funk(x) / funkDeriv(x);  % Oppdaterer x med Newtons metode
end

%% Resultater
% Skriver løsning til skjerm
disp(['Løsning: ', num2str(x), '.'])
