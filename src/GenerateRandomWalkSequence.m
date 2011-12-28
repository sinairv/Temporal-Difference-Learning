function [r, z] = GenerateRandomWalkSequence(NodesCount)
% GenerateRandomWalkSequence: Generates a random walk sequence 
% for the number of nodes specified, starting from the middle node. 
% return values:
%   r: the sequence of nodes visited
%   z: the outcome of the sequence; the value is 1 if the sequence ends in
%      the rightmost node, and 0 if the sequence ends in the leftmost node

% written by: Sina Iravanian - June 2009
% sina@sinairv.com
% Please send your comments or bug reports to the above email address.

pos = (NodesCount - 1) / 2; % the initial state
r = [pos];
while(1)
    if(rand > 0.5)
        nextwalk = 1;
    else
        nextwalk = -1;
    end

    pos = pos + nextwalk;
    if(pos == NodesCount - 1)
        z = 1;
        break;
    elseif(pos == 0)
        z = 0;
        break;
    else
        r = [r pos];
    end
end
