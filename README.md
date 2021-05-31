# Третья лабораторная по электротехнике ИТМО
Данные файлы содержат скрипт на языке Matlab, считающий значения тока, напряжения, мощности и сопротивления для трёхфазных систем нагрузки, подключенных по схеме "Звезда" или "Треугольник" соответстсвенно, а также строящий векторные диаграммы тока и напряжения по тем же схемам 
## Как работать со скриптом
- Выберите необходимый файл
- Поменяйте значения до ПОДСЧЁТА на необходимые вам значения
- В зависимости от нагрузки впоследствии меняйте значения
### Схема "Звезда"
- При обрыве нулевого провода Y_Nn меняется на 0
- При обрыве линейного провода с именем К соответствующая ему Yk меняется на 0
### Схема "Треугольник"
- При обрыве фазы (к примеру ab) соответствующая Yab меняется на 0
- При обрыве линейного провода используется скрипт delta_break.m
