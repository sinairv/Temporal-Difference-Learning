function DrawActionOnCell(actionIndex, row, col, gridrows, gridcols, fontsize)
% DrawActionOnCell: draws the symbol of different grid-world actions on the
% cell specified

% written by: Sina Iravanian - June 2009
% sina@sinairv.com
% Please send your comments or bug reports to the above email address.

rotation = 0;
textToDraw = 'o';

switch actionIndex
   case 1 % east
       textToDraw = '\rightarrow';
       rotation = 0;
   case 2 % south
       textToDraw = '\downarrow';
       rotation = 0;
   case 3 % west
       textToDraw = '\leftarrow';
       rotation = 0;
   case 4 % north
       textToDraw = '\uparrow';
       rotation = 0;
   case 5 % northeast 
       textToDraw = '\rightarrow';
       rotation = 45;
   case 6 % southeast 
       textToDraw = '\downarrow';
       rotation = 45;
   case 7 % southwest
       textToDraw = '\leftarrow';
       rotation = 45;
   case 8 % northwest
       textToDraw = '\uparrow';
       rotation = 45;
   case 9 % hold
       textToDraw = 'o';
       rotation = 0;
   otherwise
      disp(sprintf('invalid action index: %d', actionIndex))
end

DrawTextOnCell(textToDraw, rotation,  row, col, gridrows, gridcols, fontsize);
