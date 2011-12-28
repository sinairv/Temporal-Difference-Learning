function [x,y] = FindColBaseCenter(col, gridrows, gridcols)
% FindColBaseCenter: finds the coordination of the center of the column
% base point specified in a grid with the dimensions specified. This is the
% point where the wind powers are written.

% written by: Sina Iravanian - June 2009
% sina@sinairv.com
% Please send your comments or bug reports to the above email address.

row = gridrows + 1;
xsp = 1 / (gridcols + 2);
ysp = 1 / (gridrows + 2);
x = ((2*col + 1) / 2) * xsp;
y = 1 - (((2*row + 1) / 2) * ysp);
x = x - xsp/5;
