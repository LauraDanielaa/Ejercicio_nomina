% Declaración de predicados dinámicos
:- dynamic docente/2.



% Datos de ejemplo
docente(juan_perez, auxiliar).
docente(maria_rodriguez, asociado).
docente(carlos_gomez, titular).

% Definicion SalarioMinimo
salarioMinimo(1300000).

% Calculo SalarioBase
salario(auxiliar,SalarioBase) :-
    salarioMinimo(SM), SalarioBase is SM * 1.5.

salario(asociado,SalarioBase) :-
    salarioMinimo(SM), SalarioBase is SM * 2.5.

salario(titular,SalarioBase) :-
    salarioMinimo(SM), SalarioBase is SM * 3.


% Deducciones
deduccion_salud(SalarioBase, DeduccionSalud) :-
    DeduccionSalud is SalarioBase * 0.04.

deduccion_pension(SalarioBase, DeduccionPension) :-
    DeduccionPension is SalarioBase * 0.04.

% Bonificaciones
bonificacion(auxiliar, SalarioBase, Bonificacion) :-
    Bonificacion is SalarioBase * 0.05.
bonificacion(asociado, SalarioBase, Bonificacion) :-
    Bonificacion is SalarioBase * 0.1.
bonificacion(titular, SalarioBase, Bonificacion) :-
    Bonificacion is SalarioBase * 0.15.

% Cálculo del salario neto
salario_neto(NombreDocente, SalarioNeto) :-
    docente(NombreDocente, Categoria),
    salario(Categoria,SalarioBase),
    deduccion_salud(SalarioBase, DeduccionSalud),
    deduccion_pension(SalarioBase, DeduccionPension),
    bonificacion(Categoria, SalarioBase, Bonificacion),
    SalarioNeto is SalarioBase - DeduccionSalud - DeduccionPension + Bonificacion.