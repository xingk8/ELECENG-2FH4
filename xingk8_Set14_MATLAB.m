clc;
clear;

V_ext = 0;
V_core = 100.0;
V_top = 50;

xNodes = 50;
yNodes = xNodes;
totalNodes = xNodes * yNodes;

M = zeros(totalNodes, totalNodes);
rhs = zeros(totalNodes, 1);

topRight = xNodes;
topLeft = 0;
centerBottom = yNodes / 2;
centerTop = yNodes;
centerCol = xNodes / 2;

eqIdx = 1;

for x = 1:xNodes
    for y = 1:yNodes
        if (y > centerBottom && y <= centerTop && x == centerCol)
            M(eqIdx, eqIdx) = 1;
            rhs(eqIdx) = V_core;
        elseif (y == yNodes && x >= topLeft && x <= topRight)
            M(eqIdx, eqIdx) = 1;
            rhs(eqIdx) = V_top;
        else
            M(eqIdx, eqIdx) = -4;

            if y == 1
                rhs(eqIdx) = rhs(eqIdx) - V_ext;
            else
                M(eqIdx, eqIdx - 1) = 1;
            end

            if y == yNodes
                rhs(eqIdx) = rhs(eqIdx) - V_ext;
            else
                M(eqIdx, eqIdx + 1) = 1;
            end

            if x == 1
                rhs(eqIdx) = rhs(eqIdx) - V_ext;
            else
                M(eqIdx, eqIdx - xNodes) = 1;
            end

            if x == xNodes
                rhs(eqIdx) = rhs(eqIdx) - V_ext;
            else
                M(eqIdx, eqIdx + xNodes) = 1;
            end
        end
        eqIdx = eqIdx + 1;
    end
end

sol = M \ rhs;
gridVolt = reshape(sol, xNodes, yNodes);

surf(gridVolt);

figure;
[cont, hndl] = contour(gridVolt);
set(hndl, 'ShowText', 'on', 'TextStep', get(hndl, 'LevelStep') * 2)
colormap jet;

figure;
contour(gridVolt);
[ex, ey] = gradient(gridVolt);
hold on;
quiver(-ex, -ey);
hold off;
