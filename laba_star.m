clear

% ЭДС
Ea = 382;
Eb = 382*exp(-1j*2*pi/3);
Ec = 382*exp(1j*2*pi/3);

% АКТИВНОЕ СОПРОТИВЛЕНИЕ
Ra = 42;
Rb = 59;
Rc = 59;
R_Nn = 0.09;

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

%% ПОДСЧЁТ 
Za = Ra + 1j * Xa;
Zb = Rb + 1j * Xb;
Zc = Rc + 1j * Xc;

% ПРОВОДИМОСТЬ
Ya = 1 / Za;
Yb = 1 / Zb;
Yc = 1 / Zc;
Y_Nn = 1 / R_Nn;

% НАПРЯЖЕНИЕ СМЕЩЕНИЯ НЕЙТРАЛИ 
U_Nn = (Ya*Ea + Yb*Eb + Yc*Ec) / (Ya + Yb + Yc + Y_Nn);

% НАПРЯЖЕНИЯ
Ua = Ea - U_Nn;
Ub = Eb - U_Nn;
Uc = Ec - U_Nn;

% СИЛЫ ТОКА 
Ia = Ua*Ya;
Ib = Ub*Yb;
Ic = Uc*Yc;

% СИЛА ТОКА НУЛЕВОГО ПРОВОДА
I_Nn = Ia + Ib + Ic;

% УГЛЫ
phi_a = atan(Xa/Ra);
phi_b = atan(Xb/Rb);
phi_c = atan(Xc/Rc);

% МОЩНОСТИ
Pa = Ia*Ua*cos(phi_a);
Pb = Ib*Ub*cos(phi_b);
Pc = Ic*Uc*cos(phi_c);

% РЕЗУЛЬТАТЫ В ТАБЛИЦУ 3.1
Ua_abs = abs(Ua)
Ub_abs = abs(Ub)
Uc_abs = abs(Uc)

Ia_abs = abs(Ia)
Ib_abs = abs(Ib)
Ic_abs = abs(Ic)

Pa_abs = abs(Pa)
Pb_abs = abs(Pb)
Pc_abs = abs(Pc)

U_Nn_abs = abs(U_Nn)

I_Nn_abs = abs(I_Nn)

Za_abs = abs(Za)
Zb_abs = abs(Zb)
Zc_abs = abs(Zc)

%% ВЕКТОРНАЯ ДИАГРАММА

I = [Ia; Ib; Ic; I_Nn];
U = [Ua; Ub; Uc; U_Nn];

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
text(real(I(4,1)),imag(I(4,1)),['\bf', 'INn'])

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
text(real(U(1,1)),imag(U(1,1)),['\bf', 'Ua'])
text(real(U(2,1)),imag(U(2,1)),['\bf', 'Ub'])
text(real(U(3,1)),imag(U(3,1)),['\bf', 'Uc'])
text(real(U(4,1)),imag(U(4,1)),['\bf', 'UNn'])