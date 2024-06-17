%% Skript for plott av feil i grenseestimering
% Dette skriptet plotter forskjellen mellom f(a+h) og grenseverdien
% av f(x) når x går mot a. Funksjonsuttrykket f, verdien x skal
% gå mot a, og grenseverdien L er hardkodet i starten av skriptet.
% Skriptet plotter forskjellen mellom f(a+h) og den eksakte
% grenseverdien L for h-verdier stadig nærmere null.
% Denne feilen i estimatet blir plottet både for negative og
% positive verdier av h.

%% Initialisering
% Initialiserer funksjon, grenseverdi, kjent eksakt grenseverdi og steglengde `h`

% Verdien x skal gå mot
a = pi/3;  % Grenseverdien

% Definerer funksjonsuttrykket `f`
f = @(x) (cos(x) - 0.5) / (x - pi/3);  % Funksjonen vi skal finne grensen til

% Kjent eksakt grenseverdi
L = -sqrt(3) / 2;  % Den eksakte grenseverdien

% Initialiserer steglengden `h`
h = 1;  % Startverdi for steglengden

%% Beregning av feil i grenseestimering
% Beregner forskjellen mellom f(a+h) og den eksakte grenseverdien L
% for ulike verdier av `h` både fra positiv og negativ retning.

% Initialiserer vektorer for å lagre resultater
Hvektor = zeros(1, 40);        % Vektor for h-verdiene
FeilPluss = zeros(1, 40);      % Vektor for feil når x går mot a fra høyre
FeilMinus = zeros(1, 40);      % Vektor for feil når x går mot a fra venstre

% Løkke der h blir halvert for hver iterasjon
for n = 1:40
    % Beregner feilen når x går mot a fra høyre (positiv h)
    x = a + h;  % Oppdaterer x
    Hvektor(n) = h;  % Lagrer h-verdien
    FeilPluss(n) = abs(f(x) - L);  % Beregner feilen fra høyre
    
    % Beregner feilen når x går mot a fra venstre (negativ h)
    x = a - h;  % Oppdaterer x
    FeilMinus(n) = abs(f(x) - L);  % Beregner feilen fra venstre
    
    % Halverer h for neste iterasjon
    h = h / 2;
end

%% Plotting
% Plotter feilen i grenseestimering med logaritmisk x-akse for h

% Plotter feil når x går mot a fra høyre (positiv h)
loglog(Hvektor, FeilPluss, 'bx-', 'DisplayName', 'x \rightarrow a^+')

% Holder plottet aktivt for å legge til flere kurver
hold on

% Plotter feil når x går mot a fra venstre (negativ h)
loglog(Hvektor, FeilMinus, 'rx--', 'DisplayName', 'x \rightarrow a^-')

% Avslutter hold på plottet
hold off

% Aktiverer rutenett på plottet for bedre lesbarhet
grid on

% Legger til tekstboks med forklaring og tekst på aksene
xlabel('h', 'FontSize', 12)
ylabel('|f(a \pm h) - L|', 'FontSize', 12)
legend('show', 'Location', 'southeast')

% Legger til tittel for plottet
title('Feil i grenseestimering med varierende h', 'FontSize', 14)
