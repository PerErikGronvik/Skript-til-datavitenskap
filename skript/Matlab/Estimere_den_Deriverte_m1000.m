%% Skript for estimering av en derivert
% Dette skriptet estimerer derivatet av en funksjon ved hjelp av både
% framoverformelen og midtpunktsformelen. Funksjonsuttrykket og den aktuelle
% x-verdien er hardkodet i starten.

%% Initialisering
% Initialiserer funksjon, punkt og steglengde `h`

% Definerer funksjonen `funk`
funk = @(x) sqrt(x);  % Funksjonen vi skal derivere: f(x) = sqrt(x)

% Definerer den aktuelle x-verdien `a`
a = 1;  % Punktet der vi estimerer derivatet

% Initialiserer steglengden `h`
h = 1;  % Startverdi for steglengden

%% Estimering av derivat
% Estimerer derivatet ved hjelp av framoverformelen og midtpunktsformelen
% for ulike verdier av `h`.

% Initialiserer vektorer for å lagre resultater
DerivFram = zeros(1, 15);  % Vektor for framoverformelens estimater
DerivMidt = zeros(1, 15);  % Vektor for midtpunktsformelens estimater
Hvektor = zeros(1, 15);    % Vektor for `h`-verdiene

% Løkke for å beregne derivatene med avtagende `h`
for n = 1:15
    % Beregner derivatet med framoverformelen
    % Framoverformelen: f'(a) ≈ (f(a+h) - f(a)) / h
    DerivFram(n) = (funk(a + h) - funk(a)) / h;
    
    % Beregner derivatet med midtpunktsformelen
    % Midtpunktsformelen: f'(a) ≈ (f(a+h) - f(a-h)) / (2*h)
    DerivMidt(n) = (funk(a + h) - funk(a - h)) / (2 * h);
    
    % Lagrer h-verdien
    Hvektor(n) = h;
    
    % Halverer h for neste iterasjon
    h = h / 2;
end

%% Plotting
% Plotter de estimerte derivatene ved hjelp av loglog-plott

% Plotter framoverformelens estimater
loglog(Hvektor, DerivFram, 'x-', 'DisplayName', 'Framover')

% Holder plottet aktivt for å legge til flere kurver
hold on

% Plotter midtpunktsformelens estimater
loglog(Hvektor, DerivMidt, 'o-.', 'DisplayName', 'Midtpunkt')

% Avslutter hold på plottet
hold off

% Aktiverer rutenett på plottet for bedre lesbarhet
grid on

% Legger til en forklaring (legend) for plottet
legend('show')

% Legger til tittel og akseetiketter for plottet
title('Estimering av derivat med framover- og midtpunktsformelen')
xlabel('h-verdi')
ylabel('Estimert derivat')

% Setter skrifttypestørrelsen for aksene
set(gca, 'FontSize', 12)
