clear
% ЭДС
Ea = 382;
Eb = 382*exp(-1j*2*pi/3);
Ec = 382*exp(1j*2*pi/3);

% АКТИВНОЕ СОПРОТИВЛЕНИЕ
Ra = 42;
Rb = 59;
Rc = 59;

% ЁМКОСТЬ
Ca = 220e-6;
Cb = 242e-6;
Cc = 110e-6;

% ЧАСТОТА
f = 36;
w = 2 * pi * f;

% РЕАКТИВНОЕ СОПРОТИВЛЕНИЕ
Xa = - 1 / (w*Ca);
Xb = - 1 / (w*Cb);
Xc = - 1 / (w*Cc);

% ПОЛНОЕ СОПРОТИВЛЕНИЕ
Zab = Ra + 1j * Xa;
Zbc = Rb + 1j * Xb;
Zca = Rc + 1j * Xc;

% ПРОВОДИМОСТЬ
Yab = 1 / Zab;
Ybc = 1 / Zbc;
Yca = 1 / Zca;

% УГЛЫ
phi_a = atan(Xa/Ra);
phi_b = atan(Xb/Rb);
phi_c = atan(Xc/Rc);

%% ПОДСЧЁТ

% НАПРЯЖЕНИЕ
Uab = Ea - Eb;
Ubc = Eb - Ec;
Uca = Ec - Ea;

% ТОК В ФАЗЕ
Iab = Uab*Yab;
Ibc = Ubc*Ybc;
Ica = Uca*Yca;

% ТОК В ТОЧКЕ
Ia = Iab - Ica;
Ib = Ibc - Iab;
Ic = Ica - Ibc;

% МОЩНОСТЬ
Pab = Uab*Iab*cos(phi_a);
Pbc = Ubc*Ibc*cos(phi_b);
Pca = Uca*Ica*cos(phi_c);

% РЕЗУЛЬТАТЫ В ТАБЛИЦУ 3.2
Ia_abs = abs(Ia)
Ib_abs = abs(Ib)
Ic_abs = abs(Ic)

Iab_abs = abs(Iab)
Ibc_abs = abs(Ibc)
Ica_abs = abs(Ica)

Pab_abs = abs(Pab)
Pbc_abs = abs(Pbc)
Pca_abs = abs(Pca)

Zab_abs = abs(Zab)
Zbc_abs = abs(Zbc)
Zca_abs = abs(Zca)

%% ВЕКТОРНАЯ ДИАГРАММА
I = [Ia; Ib; Ic; Iab; Ibc; Ica];
U = [Uab; Ubc; Uca];

% ДИАГРАММА ТОКОВ
figure
quiver(zeros(size(I,1),1),zeros(size(I,1),1),real(I),imag(I), 'b'),
xlabel('Re(I)'), 
ylabel('Im(I)'),
title('Векторная диаграмма токов'),
grid on,
axis equal;
line([0 0], [-1.1 * abs(max(I)), 1.1 * abs(max(I))], 'Color', 'black')
line([-1.1 * abs(max(I)), 1.1 * abs(max(I))], [0 0], 'Color', 'black')
axis equal
text(real(I(1,1)),imag(I(1,1)),['\bf', 'Ia'])
text(real(I(2,1)),imag(I(2,1)),['\bf', 'Ib'])
text(real(I(3,1)),imag(I(3,1)),['\bf', 'Ic'])
text(real(I(4,1)),imag(I(4,1)),['\bf', 'Iab'])
text(real(I(5,1)),imag(I(5,1)),['\bf', 'Ibc'])
text(real(I(6,1)),imag(I(6,1)),['\bf', 'Ica'])

% ДИАГРАММА НАПРЯЖЕНИЙ
figure
quiver(zeros(size(U,1),1),zeros(size(U,1),1),real(U),imag(U), 'r'), 
xlabel('Re(U)'), 
ylabel('Im(U)'),
title('Векторная диаграмма напряжений'),
grid on,
axis equal;
line([0 0], [-1.1 * abs(max(U)), 1.1 * abs(max(U))], 'Color', 'black')
line([-1.1 * abs(max(U)), 1.1 * abs(max(U))], [0 0], 'Color', 'black')
axis equal
text(real(U(1,1)), imag(U(1,1)),['\bf', 'Uab'])
text(real(U(2,1)), imag(U(2,1)),['\bf', 'Ubc'])
text(real(U(3,1)),imag(U(3,1)),['\bf', 'Uca'])