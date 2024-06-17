%% Skript for implementering av Newtons metode
% Dette skriptet finner en tilnærmet løsning av ligningen f(x)=0
% ved hjelp av Newtons metode. I tillegg plottes tangenter og nullpunktet
% for hver iterasjon.

%% Initialisering
% Setter startverdi x0 og antall iterasjoner

% Eksempelverdi for x0
x0 = 1;  % Startverdi for Newtons metode

% Antall iterasjoner
ItMax = 10;  % Maksimalt antall iterasjoner

% Definerer funksjonen f(x) og dens deriverte f'(x)
Funk = @(x) sin(x) - x + 1;  % Funksjon
FunkDeriv = @(x) cos(x) - 1;  % Deriverte av funksjonen

%% Bestemmer intervallet for plotting
% Setter opp intervallet vi skal plotte over

% Definerer x-verdier for plottet
xMin = -1;
xMax = 4;
xVek = xMin:0.01:xMax;  % Vektor med x-verdier for plottet

% Beregner funksjonsverdiene for plottet
fVek = Funk(xVek);

% Setter aksegrenser for plottet
Vaxis = [xMin xMax min(fVek) max(fVek)];

%% Plotting av funksjonen
% Plotter funksjonen f(x)

% Plotter funksjonen
figure;
plot(xVek, fVek, 'LineWidth', 2)
axis(Vaxis)
hold on

% Plotter x-aksen
plot([xMin xMax], [0 0], 'k-')

% Plotter startverdi x0 i rødt
plot(x0, Funk(x0), 'rx', 'LineWidth', 2)
pause(1)

%% Newtons metode
% For-løkke som implementerer Newtons metode og plottar tangenter

% Initialiserer xNy
xNy = x0;

for It = 1:ItMax
    % Beregner neste tilnærming med Newtons metode
    xGml = xNy;
    f_xGml = Funk(xGml);
    df_xGml = FunkDeriv(xGml);
    
    % Unngå deling på null eller svært liten derivert verdi
    if abs(df_xGml) < 1e-6
        disp('Den deriverte er for liten. Kan ikke fortsette.')
        break;
    end
    
    xNy = xGml - f_xGml / df_xGml;
    
    % Plotter tangent
    Tang = f_xGml + df_xGml * (xVek - xGml);
    plot(xVek, Tang, 'k')
    
    % Plotter nåværende punkt
    plot(xNy, 0, 'rx', 'LineWidth', 2)
    plot(xGml, 0, 'kx', 'LineWidth', 2)
    pause(1)
    
    % Sjekk for konvergens (stopp hvis vi er nær nok løsningen)
    if abs(xNy - xGml) < 1e-8
        disp('Løsningen konvergerte.')
        break;
    end
end

% Avslutter hold på plottet
hold off

%% Resultater
% Skriver løsning og usikkerhet til skjerm

disp(['Løsning: ', num2str(xNy), '.'])
disp(['Usikkerhet: ', num2str(abs(xNy - xGml)), '.'])
