%% Skript for plotting av feil i ulike estimat av integral
% Dette skriptet plotter feilen for ulike estimat av integralet
% \int_0^\sqrt{2} \sqrt{4-x^2} dx
%
% Feilen blir plottet mot antall del-intervall, N,
% med logaritmiske akser.
%
% Skriptet kaller funksjonsfiler som regner ut
% estimatene. Disse er RiemannFunkV.m, RiemannFunkM.m, 
% TrapesFunk.m og SimpsonsFunk.m.

%% Initialisering
% Definerer funksjonen som skal integreres, grenser og fasit

% Funksjonen som skal integreres
f = @(x) sqrt(4 - x^2);

% Grenser
a = 0; 
b = sqrt(2);

% Fasit - det eksakte integralet
Fasit = pi / 2 + 1;

% Maksimal oppdeling som p der N = 2^p
Pmax = 15;  % Maksimal N: 2^Pmax

%% Beregning av feil for ulike metoder
% Lager vektorer med feilene

Nvektor = zeros(1, Pmax);
Vvektor = zeros(1, Pmax);
Mvektor = zeros(1, Pmax);
Tvektor = zeros(1, Pmax);
Svektor = zeros(1, Pmax);

for p = 1:Pmax
    N = 2^p;  % Oppdaterer N
    Nvektor(p) = N;  % Vektor med N-verdier
    
    % Beregner feilen for ulike metoder
    Vvektor(p) = abs(RiemannFunkV(f, a, b, N) - Fasit);  % Venstre Riemann-sum
    Mvektor(p) = abs(RiemannFunkM(f, a, b, N) - Fasit);  % Riemann-sum med midtpunkt
    Tvektor(p) = abs(TrapesFunk(f, a, b, N) - Fasit);    % Trapesmetoden
    Svektor(p) = abs(SimpsonsFunk(f, a, b, N) - Fasit);  % Simpsons metode
end

%% Plotting av feil
% Plotter feilene logaritmisk

figure;
loglog(Nvektor, Vvektor, 'bx-', 'LineWidth', 2, 'DisplayName', 'Venstre Riemann-sum')
hold on
loglog(Nvektor, Mvektor, 'mx-', 'LineWidth', 2, 'DisplayName', 'Riemann-sum med midtpunkt')
loglog(Nvektor, Tvektor, 'gx-', 'LineWidth', 2, 'DisplayName', 'Trapesmetoden')
loglog(Nvektor, Svektor, 'rx-', 'LineWidth', 2, 'DisplayName', 'Simpsons metode')
grid on

% Tekst på aksene
ylabel('Feil')
xlabel('N')
legend('Location', 'southwest')

pause  % Tar pause før vi plotter resten

%% Plotting av Delta x^n
% Plotter også \Delta x^n for å sammenligne

DxVektor = (b - a) ./ Nvektor;  % Vektor med Delta x:
loglog(Nvektor, DxVektor, 'b:', 'LineWidth', 2, 'DisplayName', '\Delta x^1')         % \Delta x^1
loglog(Nvektor, DxVektor .^ 2, 'm:', 'LineWidth', 2, 'DisplayName', '\Delta x^2')    % \Delta x^2
loglog(Nvektor, DxVektor .^ 4, 'r:', 'LineWidth', 2, 'DisplayName', '\Delta x^4')    % \Delta x^4
legend('Location', 'southwest')
hold off

%% Kommentar seksjon
% Dette plottet viser hvordan feilen i estimering av integralet endres med antall delintervall (N).
% Plottet bruker log-log skala for å illustrere dette.
%
% Man kan tolke ut ifra dette plottet at:
% 1. Feilen i estimatet reduseres generelt når antall delintervall (N) øker.
% 2. Metoder som Simpsons metode har vanligvis lavere feil sammenlignet med enklere metoder som Venstre Riemann-sum.
% 3. Plottet viser også hvordan feilen reduseres i henhold til Δx, der Δx = (b - a) / N.
% 4. Linjene for Δx^1, Δx^2, og Δx^4 hjelper å illustrere hvordan feilen endres med forskjellige potenser av Δx.
% 5. Sammenligning av feillinjer med Δx-linjer kan gi innsikt i hvilken metode som er mest effektiv for å redusere feilen.
%
% En fri variabel i integrasjonsmetoder refererer til variabelen som vi deler opp integralet i.
% For eksempel, når vi bruker Venstre Riemann-sum, deler vi opp integralet i N delintervall.
% Økningen i antall delintervall (N) fører til at Δx (bredden på hvert delintervall) blir mindre, noe som generelt reduserer feilen i estimatet.
%
% I dette skriptet representerer Δx lengden av hvert delintervall når vi deler opp integralet.
% Jo mindre Δx er, jo mer presist vil integralet bli estimert. Feilen reduseres typisk med en bestemt rate
% som kan ses ved å sammenligne feillinjer med linjene for Δx^1, Δx^2, og Δx^4.
%
% Venstre Riemann-sum og Midtpunkt Riemann-sum har vanligvis større feil sammenlignet med Trapesmetoden og Simpsons metode.
% Simpsons metode, som bruker en parabolsk tilnærming, har generelt den minste feilen og konvergerer raskere.
