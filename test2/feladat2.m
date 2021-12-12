%még hiányzik a c feladat
clear
hold on; axis equal;
syms u v t
%egyenes
px = [1, 6]; py = [1, 5];     
cx(t) = (1-t)*px(1) + t*px(2);
cy(t) = (1-t)*py(1) + t*py(2);
fplot(cx, cy, [-1 2])
%kör
kp = [7, 3];
r = 3.6;
kx(t) = kp(1) + r*cos(t);
ky(t) = kp(2) + r*sin(t);
fplot(kx(t), ky(t), [0 2*pi])
%metszespontok
er = [cx(u) == kx(v),...
      cy(u) == ky(v)]
em = solve(er, [u v])

 for i=1:length(em.u)
     plot(cx(em.u(i)),cy(em.u(i)),'r.','MarkerSize',20);
 end
hold off;