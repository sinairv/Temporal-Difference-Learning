function DrawGrid(gridrows, gridcols)
% DrawGrid: draws a grid with the dimensions specified

% written by: Sina Iravanian - June 2009
% sina@sinairv.com
% Please send your comments or bug reports to the above email address.

xsp = 1 / (gridcols + 2);
ysp = 1 / (gridrows + 2);

x = zeros(1, 2*(gridcols + 1));
y = zeros(1, 2*(gridcols + 1));
i = 1;
for xi = xsp:xsp:1 - xsp,
    x(2*i - 1) = xi; x(2*i) = xi;
    if(mod(i , 2) == 0)
        y(2*i - 1) = ysp;y(2*i) = 1-ysp;
    else
        y(2*i - 1) = 1 - ysp;y(2*i) = ysp;
    end
    i = i + 1;
end

x2 = zeros(1, 2*(gridrows + 1));
y2 = zeros(1, 2*(gridrows + 1));
i = 1;
for yi = ysp:ysp:1 - ysp,
    y2(2*i - 1) = yi; y2(2*i) = yi;
    if(mod(i , 2) == 0)
        x2(2*i - 1) = xsp;x2(2*i) = 1-xsp;
    else
        x2(2*i - 1) = 1 - xsp;x2(2*i) = xsp;
    end
    i = i + 1;
end

plot(x, y, '-');
hold on
plot(x2, y2, '-');
axis([0 1 0 1]);
axis off
set(gcf, 'color', 'white');
