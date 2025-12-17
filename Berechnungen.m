% gegebene Werte
% nach Name
n_ab_nenn = 30/60; % Abtriebsdrehzahl [1/s]
P_an_nenn = 4000;  % Antriebsleistung [W]
a_v = 130;      % Achsabstand [mm]
i = 3.25; % Übersetzung

% allgemein
sigma_hlim = 1400; % [N/mm^2]
sigma_FE = 700;    % [N/mm^2]
sigma_02 = 590;    % [N/mm^2]

n_an = i*n_ab_nenn
omega_nenn = 2*pi*n_an
Mt_an = P_an_nenn/omega_nenn

% Lastkollektiv
q = 6; % Wöhlerlinienexponent
N_Hlim = 3*10^6;
L_h_nenn = 10000*3600; % Lagerlebensdauer [s]

Mt_i = [2*Mt_an 1.5*Mt_an 0.9*Mt_an]
t_i = [0.005 3.995 296];
n_i = [0.5*n_an 0.7*n_an 1.1*n_an];

t_per = sum(t_i);

delta_N = [0 0 0];
delta_N(1) = n_i(1)*(t_i(1)/t_per)*L_h_nenn
delta_N(2) = n_i(2)*(t_i(2)/t_per)*L_h_nenn
delta_N(3) = n_i(3)*(t_i(3)/t_per)*L_h_nenn

delta_N;
delta_NE = [0 0 0];
delta_NE(1) = delta_N(1);
delta_NE(2) = delta_N(2);
delta_NE(3) = N_Hlim-delta_NE(1)-delta_NE(2);

delta_NE

N_0 = N_Hlim

kb_zwischen = ((Mt_i(1)/Mt_an)^q*(delta_NE(1)/N_0)) + ((Mt_i(2)/Mt_an)^q*(delta_NE(2)/N_0)) + ((Mt_i(3)/Mt_an)^q*(delta_NE(3)/N_0));
K_B = nthroot(kb_zwischen, q)

K_BS = (2*Mt_an)/Mt_an

p = 3; % Wälzlager
N_0L = L_h_nenn;
kbl_zwischen = ((Mt_i(1)/Mt_an)^p*(delta_N(1)/N_0L)) + ((Mt_i(2)/Mt_an)^p*(delta_N(2)/N_0L)) + ((Mt_i(3)/Mt_an)^p*(delta_N(3)/N_0L));
K_BL = nthroot(kbl_zwischen, p)

% Zähnezahlen

z1 = 27;
z2 = 88;
i_ist = z2/z1
delta_i = ((i_ist-i)/i)*100

M_t1_eq = Mt_an*K_B

K_ABF = 1; % aus Aufgabenstellung
K_Fbeta = 1.5; % aus Aufgabenstellung
Y_FS = 0; % aus Aufgabenstellung
