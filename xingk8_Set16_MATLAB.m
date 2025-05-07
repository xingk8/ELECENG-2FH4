clc;
clear;

N = 200;
r1 = 0.015;
r2 = 0.025;
I0 = 5;

xMin = -0.04;
xMax = 0.04;
yMin = -0.04;
yMax = 0.04;
xPoints = 41;
yPoints = 41;

dx = (xMax - xMin) / (xPoints - 1);
dy = (yMax - yMin) / (yPoints - 1);

[xGrid, yGrid] = meshgrid(xMin:dx:xMax, yMin:dy:yMax);

z0 = 0;

Bx = zeros(xPoints, yPoints);
By = zeros(xPoints, yPoints);

for i = 1:xPoints
    for j = 1:yPoints
        x0 = xGrid(i, j);
        y0 = yGrid(i, j);
        R = [x0, y0, z0];
        Rmag = norm(R);
        if Rmag <= r2 && Rmag >= r1
            Bphi = (N * I0) / (2 * pi * Rmag);
            Bx(i, j) = -Bphi * (y0 / Rmag);
            By(i, j) = Bphi * (x0 / Rmag);
        end
    end
end

quiver(xGrid, yGrid, Bx, By);
xlabel('x (m)');
ylabel('y (m)');
clc;
clear;

N = 200;
r1 = 0.015;
r2 = 0.025;
I0 = 5;

xMin = -0.04;
xMax = 0.04;
yMin = -0.04;
yMax = 0.04;
xPoints = 41;
yPoints = 41;

dx = (xMax - xMin) / (xPoints - 1);
dy = (yMax - yMin) / (yPoints - 1);

[xGrid, yGrid] = meshgrid(xMin:dx:xMax, yMin:dy:yMax);

z0 = 0;

Bx = zeros(xPoints, yPoints);
By = zeros(xPoints, yPoints);

for i = 1:xPoints
    for j = 1:yPoints
        x0 = xGrid(i, j);
        y0 = yGrid(i, j);
        R = [x0, y0, z0];
        Rmag = norm(R);
        if Rmag <= r2 && Rmag >= r1
            Bphi = (N * I0) / (2 * pi * Rmag);
            Bx(i, j) = -Bphi * (y0 / Rmag);
            By(i, j) = Bphi * (x0 / Rmag);
        end
    end
end

quiver(xGrid, yGrid, Bx, By);
xlabel('x (m)');
ylabel('y (m)');
clc;
clear;

N = 200;
r1 = 0.015;
r2 = 0.025;
I0 = 5;

xMin = -0.04;
xMax = 0.04;
yMin = -0.04;
yMax = 0.04;
xPoints = 41;
yPoints = 41;

dx = (xMax - xMin) / (xPoints - 1);
dy = (yMax - yMin) / (yPoints - 1);

[xGrid, yGrid] = meshgrid(xMin:dx:xMax, yMin:dy:yMax);

z0 = 0;

Bx = zeros(xPoints, yPoints);
By = zeros(xPoints, yPoints);

for i = 1:xPoints
    for j = 1:yPoints
        x0 = xGrid(i, j);
        y0 = yGrid(i, j);
        R = [x0, y0, z0];
        Rmag = norm(R);
        if Rmag <= r2 && Rmag >= r1
            Bphi = (N * I0) / (2 * pi * Rmag);
            Bx(i, j) = -Bphi * (y0 / Rmag);
            By(i, j) = Bphi * (x0 / Rmag);
        end
    end
end

quiver(xGrid, yGrid, Bx, By);
xlabel('x (m)');
ylabel('y (m)');
