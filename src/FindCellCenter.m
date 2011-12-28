function [x,y] = FindCellCenter(row, col, gridrows, gridcols)
% FindCellCenter: finds the coordination of the center of the cell
% specified in a grid with the dimensions specified

% written by: Sina Iravanian - June 2009
% sina@sinairv.com
% Please send your comments or bug reports to the above email address.

xsp = 1 / (gridcols + 2);
ysp = 1 / (gridrows + 2);
x = ((2*col + 1) / 2) * xsp;
y = 1 - (((2*row + 1) / 2) * ysp);
x = x - xsp/5;
