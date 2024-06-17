%% Skript for estimering av en grense
% Dette skriptet estimerer grensen til et uttrykk n�r x n�rmer seg en gitt verdi a.
% Funksjonsuttrykket f og verdien x skal g� mot a.
% Skriptet plotter f(a+h) for h-verdier stadig n�rmere null med logaritmisk x-akse.
% Den plotter estimatet for b�de negative og positive verdier av h.

%% Initialisering
% Initialiserer funksjon, grenseverdi og steglengde `h`

% Definerer funksjonen `funk`
funk = @(x) (cos(x) - 1/2) / (x - pi/3);  % Funksjonen vi skal finne grensen til

% Definerer verdien `a` som x skal g� mot
a = pi/3;  % Grenseverdien

% Initialiserer steglengden `h`
h = 1;  % Startverdi for steglengden

%% Beregning av grenseverdier
% Beregner funksjonsverdiene f(a+h) for h-verdier som n�rmer seg null
% b�de fra positiv og negativ retning.

% Initialiserer vektorer for � lagre resultater
Hvektor = zeros(1, 15);             % Vektor for h-verdiene
GrenseVektorPluss = zeros(1, 15);   % Vektor for grenseverdier n�r x g�r mot a fra h�yre
GrenseVektorMinus = zeros(1, 15);   % Vektor for grenseverdier n�r x g�r mot a fra venstre

% L�kke der h blir halvert for hver iterasjon
for n = 1:15
    % Beregner funksjonsverdien n�r x g�r mot a fra h�yre (positiv h)
    x = a + h;  % Oppdaterer x
    Hvektor(n) = h;  % Lagrer h-verdien
    GrenseVektorPluss(n) = funk(x);  % Beregner grenseverdien fra h�yre

    % Beregner funksjonsverdien n�r x g�r mot a fra venstre (negativ h)
    x = a - h;  % Oppdaterer x
    GrenseVektorMinus(n) = funk(x);  % Beregner grenseverdien fra venstre

    % Halverer h for neste iterasjon
    h = h / 2;
end

%% Plotting
% Plotter grenseverdiene med logaritmisk x-akse for h

% Plotter grenseverdier n�r x g�r mot a fra h�yre (positiv h)
semilogx(Hvektor, GrenseVektorPluss, 'bx-', 'DisplayName', 'x \rightarrow a^+')

% Holder plottet aktivt for � legge til flere kurver
hold on

% Plotter grenseverdier n�r x g�r mot a fra venstre (negativ h)
semilogx(Hvektor, GrenseVektorMinus, 'rx-', 'DisplayName', 'x \rightarrow a^-')

% Avslutter hold p� plottet
hold off

% Aktiverer rutenett p� plottet for bedre lesbarhet
grid on

% Legger til tekstboks med forklaring og tekst p� aksene
xlabel('h', 'FontSize', 12)
ylabel('f(a \pm h)', 'FontSize', 12)
legend('show')

% Legger til tittel for plottet
title('Estimering av grenseverdi med varierende h', 'FontSize', 14)