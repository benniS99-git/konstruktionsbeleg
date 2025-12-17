% gegebene Werte
% nach Name
n_ab_nenn = 30; % Abtriebsdrehzahl [1/min]
P_an_nenn = 4000;  % Antriebsleistung [W]
a_v = 130;      % Achsabstand [mm]
i = 3.25; % Übersetzung

% allgemein
sigma_hlim = 1400; % [N/mm^2]
sigma_FE = 700;    % [N/mm^2]
sigma_02 = 590;    % [N/mm^2]

K_Halpha = 1.8;
K_V = K_Halpha;
K_Hbeta = K_Halpha;
K_Falpha = K_Halpha;
K_Fbeta = K_Halpha;

% Zähnezahlen

z1 = 21;
z2 = 69;
i_ist = z2/z1
delta_i = ((i_ist-i)/i)*100
n_an = i*n_ab_nenn
omega_nenn = 2*pi*n_an
Mt_an = P_an_nenn/omega_nenn

% Lastkollektiv
q = 6; % Wöhlerlinienexponent
N_Hlim = 3*10^6;
L_h_nenn = 10000; % Lagerlebensdauer [h]

Mt_i = [2*Mt_an 1.5*Mt_an 0.9*Mt_an]
t_i = [0.005 3.995 296];
n_i = [0.5*n_an 0.7*n_an 1.1*n_an];

t_per = sum(t_i);

delta_N = [0 0 0];
delta_N(1) = n_i(1)*(t_i(1)/t_per)*L_h_nenn;
delta_N(2) = n_i(2)*(t_i(2)/t_per)*L_h_nenn;
delta_N(3) = n_i(3)*(t_i(3)/t_per)*L_h_nenn;

delta_N
N_0 = sum(delta_N)

kb_zwischen = ((Mt_i(1)/Mt_an)^q*(delta_N(1)/N_0)) + ((Mt_i(2)/Mt_an)^q*(delta_N(2)/N_0)) + ((Mt_i(3)/Mt_an)^q*(delta_N(3)/N_0));
K_B = nthroot(kb_zwischen, q)

K_BS = (2*Mt_an)/Mt_an

K_BL = nthroot(kb_zwischen, 3)