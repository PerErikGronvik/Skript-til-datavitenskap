%% Skript for beregning av volum og overflateareal
% Dette skriptet beregner volum og overflateareal av en flaske gitt ved profilfunksjonen
% p(x) fra x=a til x=b. Input er p(x), p'(x), a og b.
% I tillegg blir oppdelingen n spesifisert som en eksempelverdi.
% Selve integralestimatet blir gjort med Trapesmetoden.

%% Initialisering
% Definerer grenser, funksjon, derivert og antall delintervaller

% Grenser
a = -5;  % Nedre grense for integrasjon
b = 5;   % Øvre grense for integrasjon

% Definerer profilfunksjonen `p` og dens derivert `pd`
p = @(x) 0.7 * atan(4 - 3 * x) + 2;  % Profilfunksjonen til flasken
pd = @(x) -2.1 / ((4 - 3 * x)^2 + 1);  % Den deriverte av profilfunksjonen

% Antall delintervaller (eksempelverdi)
n = 100;  % Eksempelverdi for antall delintervaller

% Beregner steglengden `dx`
dx = (b - a) / n;  % Steglengde for delintervallene

%% Beregning av volum og overflateareal
% Initialiserer volum `V` og overflateareal `A` og tar med endepunktene

% Beregner bidrag fra endepunktene til volumet
V = (p(a)^2 + p(b)^2) / 2;

% Beregner bidrag fra endepunktene til overflatearealet
A = p(a) * sqrt(1 + pd(a)^2) / 2;
A = A + p(b) * sqrt(1 + pd(b)^2) / 2;

% Summerer over alle indre punkt
for k = 1:(n-1)
    x = a + k * dx;  % Beregner posisjonen til det indre punktet
    V = V + p(x)^2;  % Legger til bidraget fra det indre punktet til volumet
    A = A + p(x) * sqrt(1 + pd(x)^2);  % Legger til bidraget fra det indre punktet til overflatearealet
end

% Oppdaterer med de rette faktorene og skriver resultatene til skjerm
V = pi * dx * V;  % Volumet av flasken
A = 2 * pi * dx * A;  % Overflatearealet av flasken

% Skriver resultatene til skjermen
fprintf('Volumet av flasken er %.4f\n', V)
fprintf('Overflatearealet av flasken er %.4f\n', A)
