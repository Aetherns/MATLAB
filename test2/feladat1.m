clear

axis equal; hold on;
%Az implicit megadási módhoz is szükség lesz syms változókra
syms x y z 
%Majd be kell írnunk a függvényt. Úgy, hogy a változó neve
%legyen a nulla helyén.
e = x^2 + y^2 + z^2 - 1;
%1. paraméter a függvény, 2. a tartomány ahol kiértékeljük a
%függvényt.
fimplicit3(e, [-1 1 -1 1 -1 0])


