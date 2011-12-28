function DrawTextOnCell(theText, rotation, row, col, gridrows, gridcols, fontsize)
% DrawTextOnCell: draws the specified text in a specific cell of
% a grid with specified dimensions, using the rotation and fontsize
% parameters given

% written by: Sina Iravanian - June 2009
% sina@sinairv.com
% Please send your comments or bug reports to the above email address.

[xc, yc] = FindCellCenter(row, col, gridrows, gridcols);
text(xc, yc, theText,  'FontSize', fontsize, 'Rotation', rotation);
