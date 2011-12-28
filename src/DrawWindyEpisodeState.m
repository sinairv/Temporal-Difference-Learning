function DrawWindyEpisodeState(rows, cols, acts, SRow, SCol, GRow, GCol, windpowers, gridrows, gridcols, fontsize)
% DrawWindyEpisodeState: draws a snapshot of the windy grid world,
% specifying the sequence of actions on the world.

% written by: Sina Iravanian - June 2009
% sina@sinairv.com
% Please send your comments or bug reports to the above email address.

DrawGrid(gridrows, gridcols);
DrawTextOnCell('S', 0, SRow, SCol, gridrows, gridcols, fontsize);
DrawTextOnCell('G', 0, GRow, GCol, gridrows, gridcols, fontsize);

for i=1:length(rows),
    DrawActionOnCell(acts(i), rows(i), cols(i), gridrows, gridcols, fontsize);
end

for i=1:gridcols,
    [xc, yc] = FindColBaseCenter(i, gridrows, gridcols);
    text(xc, yc, sprintf('%d',windpowers(i)), 'FontSize', fontsize, 'Rotation', 0);
end
