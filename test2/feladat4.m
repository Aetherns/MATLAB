clear
hold on; axis equal;

px = [19, 21, 30, 40, 43]
py = [3,  2,  0, 10, -10]
plot(px, py, ".--", "LineWidth", 2)

syms t
t0 = 0; t1 = 1;
x(t) = t*0;
y(t) = t*0;
n = 4;
for i = 0:n
    bint = nchoosek(n,i)* t^i * (1-t)^(n-i);
    x(t) = x(t) + px(i+1) * bint;
    y(t) = y(t) + py(i+1) * bint;
end

fplot(x, y, [t0, t1],"--", "LineWidth", 2)

hold off