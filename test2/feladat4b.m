%boiler plate
clear
hold on; axis equal;
%pontok felvétele
px = [ 2, 5, 8, 12, 19];
py = [-2, 6, 1,  7, 3 ];
%pontok ábrázolása
plot(px, py, '*')
%paraméterek és konstansok
syms t
t0 = 0; t1 = 1; l = (3/4)
syms a0 a1 a2 a3
syms b0 b1 b2 b3
%vektorok kiszámítása
vx = [l*(px(2)-px(1))]; vy = [l*(py(2)-py(1))];
for i=2:length(px)-1
    vx = [vx, l*(px(i+1)-px(i-1))];
    vy = [vy, l*(py(i+1)-py(i-1))];
end
vx = [vx, l*(px(5)-px(4))];
vy = [vy, l*(py(5)-py(4))];
%vektorok felrajzolása
quiver(px,py,vx,vy)

%egyenletek a hermite-ívhez
x(t) = a3*t^3 + a2*t^2 + a1*t + a0;
y(t) = b3*t^3 + b2*t^2 + b1*t + b0;
%érintővektor kiszámítása
xd(t)= diff(x,t);
yd(t)= diff(y,t);
%egyenletrendszerek
erx =   [x(t0) == px(1),...
         x(t1) == px(2),...
         xd(t0) == vx(1),...
         xd(t1) == vx(2)];
ery =   [y(t0) == py(1),...
         y(t1) == py(2),...
         yd(t0) == vy(1),...
         yd(t1) == vy(2)];
emx = solve(erx, [a0 a1 a2 a3])
emy = solve(ery, [b0 b1 b2 b3])
cx(t) = subs(x, [a0 a1 a2 a3], [emx.a0 emx.a1 emx.a2 emx.a3])
cy(t) = subs(y, [b0 b1 b2 b3], [emy.b0 emy.b1 emy.b2 emy.b3])
%ív ábrázolása
fplot(cx, cy, [t0 t1])

%2. hermite ív csatolása

erx =   [x(t0) == px(2),...
         x(t1) == px(3),...
         xd(t0) == vx(2),...
         xd(t1) == vx(3)]
ery =   [y(t0) == py(2),...
         y(t1) == py(3),...
         yd(t0) == vy(2),...
         yd(t1) == vy(3)]
emx = solve(erx, [a0 a1 a2 a3])
emy = solve(ery, [b0 b1 b2 b3])
cx(t) = subs(x, [a0 a1 a2 a3], [emx.a0 emx.a1 emx.a2 emx.a3])
cy(t) = subs(y, [b0 b1 b2 b3], [emy.b0 emy.b1 emy.b2 emy.b3])
fplot(cx, cy, [t0 t1])

%3. hermite ív

erx =   [x(t0) == px(3),...
         x(t1) == px(4),...
         xd(t0) == vx(3),...
         xd(t1) == vx(4)]
ery =   [y(t0) == py(3),...
         y(t1) == py(4),...
         yd(t0) == vy(3),...
         yd(t1) == vy(4)]
emx = solve(erx, [a0 a1 a2 a3])
emy = solve(ery, [b0 b1 b2 b3])
cx(t) = subs(x, [a0 a1 a2 a3], [emx.a0 emx.a1 emx.a2 emx.a3])
cy(t) = subs(y, [b0 b1 b2 b3], [emy.b0 emy.b1 emy.b2 emy.b3])
fplot(cx, cy, [t0 t1])

%4. hermite ív

erx =   [x(t0) == px(4),...
         x(t1) == px(5),...
         xd(t0) == vx(4),...
         xd(t1) == vx(5)]
ery =   [y(t0) == py(4),...
         y(t1) == py(5),...
         yd(t0) == vy(4),...
         yd(t1) == vy(5)]
emx = solve(erx, [a0 a1 a2 a3])
emy = solve(ery, [b0 b1 b2 b3])
cx(t) = subs(x, [a0 a1 a2 a3], [emx.a0 emx.a1 emx.a2 emx.a3])
cy(t) = subs(y, [b0 b1 b2 b3], [emy.b0 emy.b1 emy.b2 emy.b3])
fplot(cx, cy, [t0 t1])


%bezier görbe
bpx = [19, 21, 30, 40, 43]
bpy = [3,  2,  0, 10, -10]
plot(bpx, bpy, ".--", "LineWidth", 2)


t0 = 0; t1 = 1;
u(t) = t*0;
v(t) = t*0;
n = 4;
for i = 0:n
    bint = nchoosek(n,i)* t^i * (1-t)^(n-i);
    u(t) = u(t) + bpx(i+1) * bint;
    v(t) = v(t) + bpy(i+1) * bint;
end

fplot(u, v, [t0, t1],"--", "LineWidth", 2)

hold off





