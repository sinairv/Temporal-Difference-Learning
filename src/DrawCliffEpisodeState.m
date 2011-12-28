function DrawCliffEpisodeState(rows, cols, acts, SRow, SCol, GRow, GCol, gridrows, gridcols, fontsize)
% DrawCliffEpisodeState: draws a snapshot of the cliff walking world,
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

for i=2:gridcols-1,
    DrawTextOnCell('C', 0, gridrows, i, gridrows, gridcols, fontsize);
end
