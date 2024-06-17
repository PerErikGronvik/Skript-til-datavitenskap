%% Skript for bestemmelse av nullpunkt for en funksjon
% Dette skriptet bestemmer et nullpunkt for en funksjon f(x) i intervallet [a, b] med en gitt presisjon.
% Implementeringen forutsetter at funksjonen er kontinuerlig og at f(a) og f(b) har motsatt fortegn.
% Dette blir ikke sjekket.

%% Initialisering
% Definerer endepunkter, funksjon og presisjon

% Endepunkter
a = 0;  % Nedre grense for intervallet
b = 3;  % Øvre grense for intervallet

% Definerer funksjonen `funk` som skal ha nullpunkt
funk = @(x) exp(x) + x - 5;  % Funksjonen vi skal finne nullpunktet til

% Definerer presisjonen `P`
P = 1e-8;  % Ønsket presisjon for nullpunktet

%% Beregning av nullpunkt
% Initialiserer funksjonsverdiene i endepunktene
fa = funk(a);  % Funksjonsverdi i nedre grense
fb = funk(b);  % Funksjonsverdi i øvre grense

% Beregner antall iterasjoner nødvendig for å oppnå ønsket presisjon
N = ceil(log((b - a) / P) / log(2));

% Løkke for å iterere og finne nullpunktet med ønsket presisjon
for n = 1:N
    c = (a + b) / 2;  % Beregner midtpunktet i intervallet
    fc = funk(c);     % Beregner funksjonsverdi i midtpunktet

    % Oppdaterer høyre eller venstre kant basert på funksjonsverdiens fortegn
    if fa * fc < 0
        b = c;
        fb = fc;  % Oppdaterer funksjonsverdi i øvre grense
    else
        a = c;
        fa = fc;  % Oppdaterer funksjonsverdi i nedre grense
    end
end

% Beregner og skriver ut midtpunktet til slutt
c = (a + b) / 2  % Nullpunktet
