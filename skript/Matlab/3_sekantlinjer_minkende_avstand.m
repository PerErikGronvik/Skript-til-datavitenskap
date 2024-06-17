%% Skript som illustrerer hvordan tre ulike sekantlinjer nærmer seg en tangentlinje
% Dette skriptet viser hvordan sekantlinjer, som er linjer mellom to punkter på en kurve,
% gradvis blir til tangentlinjen, som er linjen som bare berører kurven i ett punkt.

%% Initialiseringer
% Initialiserer funksjon, punkt, derivert og x-verdier

% Definerer punktet `a`, funksjonen `funk` og den deriverte av funksjonen ved punktet `a`.
a = 0.75;
funk = @(x) exp(x) - x;  % Funksjonen vi skal jobbe med: f(x) = e^x - x
derivert = exp(a) - 1;  % Deriverte av funksjonen ved punktet `a`: f'(a)

% Setter opp x-verdier for plottet
x = -2:0.01:3;

%% Plotting
% Plotter funksjonen `funk`, markerer punktet `a`, og tegner tangentlinjen ved punktet `a`.

% Plotter funksjonen
figure;  % Åpner en ny figur
plot(x, funk(x), 'k-', 'LineWidth', 2)
hold on

% Plotter punktet `a`
plot(a, funk(a), 'kx', 'LineWidth', 2)

% Plotter tangentlinjen
% Tangentlinjen er en rett linje som bare berører kurven ved punktet `a`, og har stigningstall lik den deriverte ved `a`.
yTang = derivert * (x - a) + funk(a);
plot(x, yTang, 'k--')

% Setter grenser for aksene
V = [-2 3 -4 15];
axis(V);
grid on

% Initialiserer steglengden `h`
h = 2;

%% Plotting av sekantlinjer framover, bakover og midt
% Plotter sekantlinjer som skjærer funksjonen foran, bak og midt i forhold til punktet `a`.

% Plotter sekantlinjen framover
plPktFram = plot(a + h, funk(a + h), 'bx', 'LineWidth', 2);
StigningFram = (funk(a + h) - funk(a)) / h;  % Beregner stigningstallet for sekantlinjen framover
yFram = StigningFram * (x - a) + funk(a);
plSekFram = plot(x, yFram, 'b-');

% Plotter sekantlinjen bakover
plPktBak = plot(a - h, funk(a - h), 'rx', 'LineWidth', 2);
StigningBak = (funk(a) - funk(a - h)) / h;  % Beregner stigningstallet for sekantlinjen bakover
yBak = StigningBak * (x - a) + funk(a);
plSekBak = plot(x, yBak, 'r-');

% Plotter midt-sekantlinjen
StigningMidt = (funk(a + h) - funk(a - h)) / (2 * h);  % Beregner stigningstallet for midt-sekantlinjen
yMidt = StigningMidt * (x - (a - h)) + funk(a - h);
plMidt = plot(x, yMidt, 'm-', 'LineWidth', 1.5);
hold off

% Legger til forklaring (legend) for plottet
legend('f(x)', 'f(a)', 'Tangent', 'f(a + h)', 'Framover', 'f(a - h)', 'Bakover', 'Midt', 'Location', 'NorthWest')
set(gca, 'FontSize', 12)

%% Plotter og oppdaterer grafen
% I hver iterasjon reduseres steglengden `h`, og sekantlinjene oppdateres for å vise hvordan de nærmer seg tangentlinjen.

for n = 1:10
    % Beregner og oppdaterer sekantlinjen framover
    StigningFram = (funk(a + h) - funk(a)) / h;  % Beregner stigningstallet for sekantlinjen framover
    yFram = StigningFram * (x - a) + funk(a);

    % Beregner og oppdaterer sekantlinjen bakover
    StigningBak = (funk(a) - funk(a - h)) / h;  % Beregner stigningstallet for sekantlinjen bakover
    yBak = StigningBak * (x - a) + funk(a);

    % Beregner og oppdaterer midt-sekantlinjen
    StigningMidt = (funk(a + h) - funk(a - h)) / (2 * h);  % Beregner stigningstallet for midt-sekantlinjen
    yMidt = StigningMidt * (x - (a - h)) + funk(a - h);

    % Oppdaterer plottet med nye sekantpunkter og linjer
    set(plPktFram, 'XData', a + h, 'YData', funk(a + h))
    set(plSekFram, 'YData', yFram)
    set(plPktBak, 'XData', a - h, 'YData', funk(a - h))
    set(plSekBak, 'YData', yBak)
    set(plMidt, 'YData', yMidt)
    
    % Tegner plottet på nytt og oppdaterer aksene
    drawnow
    axis(V)
    pause(0.1)  % Kort pause for å redusere CPU-bruk

    % Reduserer steglengden `h`
    h = h * 0.5;
end
