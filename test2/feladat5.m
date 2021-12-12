clear
hold on; axis equal
syms t u v
u0 = 0; u1 = 1; v0 = 0; v1 = 1;

px = [0, 0, 1, 1];
py = [0, 1, 0, 1];
pz = [0, 1, 1, 0];
t0 = 0; t1 = 1;

cx(t) = (1-t)*px(1) + t*px(2);
cy(t) = (1-t)*py(1) + t*py(2);
cz(t) = (1-t)*pz(1) + t*pz(2);

fplot3(cx, cy, cz, [0 1])

dx(t) = (1-t)*px(3) + t*px(4);
dy(t) = (1-t)*py(3) + t*py(4);
dz(t) = (1-t)*pz(3) + t*pz(4);

fplot3(dx, dy, dz, [0 1])

x(u,v) = (1-v)* cx(u) +v*dx(u)
y(u,v) = (1-v)* cy(u) +v*dy(u)
z(u,v) = (1-v)* cz(u) +v*dz(u)

fsurf(x, y, z, [0 1 0 1])

xv(u) = (1-0.3)* cx(u) +0.3*dx(u)
yv(u) = (1-0.3)* cy(u) +0.3*dy(u)
zv(u) = (1-0.3)* cz(u) +0.3*dz(u)


fplot3(xv,yv,zv, [0 1], "Linewidth", 5)

hold off;

