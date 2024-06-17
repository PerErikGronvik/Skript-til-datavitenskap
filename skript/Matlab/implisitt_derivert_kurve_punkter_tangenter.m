%% Skript for plotting av en implisitt kurve med punkter og tangenter
% Dette skriptet plotter ei bestemt kurve gitt implisitt
% sammen med tre punkter på kurven. I tillegg plotter skriptet
% tangentene i disse tre punktene.

%% Initialisering
% Definerer funksjonen, punktene og deres deriverte

% Funksjonen som gir kurven
FunkImplisitt = @(x, y) 0.125 * x.^3 + y.^2 + x .* y;  % Implisitt funksjon

% Vektor med x-verdier
X = [-2, -2, 2];  % x-verdier for punktene på kurven

% Vektor med y-verdier
Y = [-sqrt(2) + 1, sqrt(2) + 1, -1];  % y-verdier for punktene på kurven

% Vektor med deriverte (bare to veldefinerte)
Deriverte = (-3/8 * X(1:2).^2 - Y(1:2)) ./ (X(1:2) + 2 * Y(1:2));  % Deriverte i de veldefinerte punktene

%% Plotting av kurva
% Plotter den implisitte kurven

% Plotter kurven definert av FunkImplisitt
fimplicit(FunkImplisitt, [-4 4 -3 3])
grid on
hold on

%% Plotting av punktene
% Plotter de tre punktene på kurven

for n = 1:3
    plot(X(n), Y(n), 'rx', 'LineWidth', 2)  % Plotter punktene
end

%% Plotting av tangentene
% Plotter tangentene i de tre punktene

% Definerer x-verdier for plotting av tangentene
xVektor = -5:0.01:5;

for n = 1:3
    if n == 3
        % Spesiell behandling for vertikal tangent
        xline(X(n), 'k-')  % Vertikal linje for den tredje tangenten
    else
        % Plotter tangenten
        yTangent = Y(n) + Deriverte(n) * (xVektor - X(n));  % Beregner y-verdiene for tangenten
        plot(xVektor, yTangent, 'k-')  % Plotter tangenten
    end
end

hold off
