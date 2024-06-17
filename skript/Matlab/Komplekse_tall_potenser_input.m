%% Komplekse potenser
% Dette programmet bruker De Moivres teorem til å finne alle løsninger 
% for komplekse ligninger av formen z^n = a, 
% hvor 'a' er et komplekst tall gitt ved sin realdel og 
% imaginærdel, og 'n' er potensen.

%% Tar inn input fra bruker
x = str2double(inputdlg('Skriv inn realdelen','Real del'));
y = str2double(inputdlg('Skriv inn imaginærdelen','Imaginær del'));
n = str2double(inputdlg('Skriv inn potensen','Potens'));
% I produksjon ville det vært naturlig å ha inputvalidering

%% Utfører Beregningen
% Kombinerer real- og imaginærdelene for å danne det komplekse tallet 'a'.
a = x + y * 1i;

% Konverterer det komplekse tallet til polarform for å forenkle beregningen. 
% Polarformen består av en lengde 'r', og en vinkel 'theta'.

% r er hypotenusen, beregnet ved Pythagoras.
r = sqrt(x^2 + y^2); 

% Beregner vinkelen theta uten atan2 av pedagogiske hensyn. 
% theta representerer retningen til det komplekse tallet. I produksjon er
% det vanlig å bruke atan2.

theta = 0; % Initialiserer theta
if x == 0 % Håndterer spesialtilfeller hvor tallet ligger på den imaginære aksen.
    if y > 0
        theta = pi/2; % Tallet peker rett opp
    elseif y < 0
        theta = -pi/2; % Tallet peker rett ned
    end
elseif x > 0 && y >= 0 % Tallet er i første kvadrant
    theta = atan(y / x);
elseif x < 0 && y > 0 % Tallet er i andre kvadrant: x < 0, y > 0
    theta = atan(y / x) + pi;
elseif x < 0 && y <= 0 % Tallet er i tredje kvadrant: x < 0, y <= 0
    theta = atan(y / x) - pi;
elseif x > 0 && y < 0 % Tallet er i fjerde kvadrant: x > 0, y < 0
    theta = atan(y / x);
end

%% Beregner alle 'n' røttene til det komplekse tallet ved hjelp av De Moivres teorem.

Z = zeros(1, n); % Initialiserer et array for å lagre røttene.
for k = 0:(n-1) % Iterer for hver rot
    % Beregner
    Z_nrootk = r^(1/n) * (cos((theta + 2*pi*k)/n) + 1i * sin((theta + 2*pi*k)/n)); 
    % Lagrer
    Z(k+1) = Z_nrootk;
end

%% Skriver løsninger til skjerm i kartesisk form
for k = 1:n
    fprintf('Løsning %d: %.4f + %.4fi\n', k, real(Z(k)), imag(Z(k)));
end

%% Plotter løsninger i det komplekse planet
figure; % Initialiserer figuren
plot(real(Z), imag(Z), 'o'); % Plotter hver rot Z_k
axis on;
axis equal;
xlabel('Realdel'); 
ylabel('Imaginaerdel');
title(sprintf('De %d n-te røttene av det komplekse tallet %.2f + %.2fi', n, real(a), imag(a)));

% Formaterer plottet for bedre visuell representasjon.
% Definerer akser
hold on;
akseverdi = max([abs(min(real(Z))), abs(max(real(Z))), abs(min(imag(Z))), abs(max(imag(Z)))]) * 1.2;
xlim([-akseverdi, akseverdi]);
ylim([-akseverdi, akseverdi]);

% Sentrer aksene og farger dem
line([-akseverdi, akseverdi], [0, 0], 'Color', 'r'); % x-aksen i rødt
line([0, 0], [-akseverdi, akseverdi], 'Color', 'r'); % y-aksen i rødt
hold off;