function WindyGridWorldQLearning(options)
% WindyGridWorldQLearning: implements the windy grid world problem using the
% Q-Learning method

% You can pass the parameters of the problem, through the options
% structure, otherwise a default settings is used for running the program.

% written by: Sina Iravanian - June 2009
% sina@sinairv.com
% Please send your comments or bug reports to the above email address.

if(nargin < 1),
    gamma = 0.9;
    alpha = 0.1;
    epsilon = 0.1;

    gridcols = 10; 
    gridrows = 7;
    windpowers = [0 0 0 1 1 1 2 2 1 0];
    fontsize = 16;
    showTitle = 1;

    episodeCount = 1000;
    selectedEpisodes = [20 200 700 1000];

    isKing = 0; 
    canHold = 0;

    start.row = 4;
    start.col = 1;
    goal.row = 4;
    goal.col = 8;
else
    gamma = options.gamma;
    alpha = options.alpha;
    epsilon = options.epsilon;

    gridcols = options.gridcols; 
    gridrows = options.gridrows;
    windpowers = options.windpowers;
    fontsize = options.fontsize;
    showTitle = options.showTitle;

    episodeCount = options.episodeCount;
    selectedEpisodes = options.selectedEpisodes;

    isKing = options.isKing; canHold = options.canHold;

    start = options.start;
    goal = options.goal;
end

selectedEpIndex = 1;
if(isKing ~= 0),  actionCount = 8; else actionCount = 4; end
if(canHold ~= 0 && isKing ~= 0), actionCount = actionCount + 1; end


% initialize Q with zeros
Q = zeros(gridrows, gridcols, actionCount);

a = 0; % an invalid action
% loop through episodes
for ei = 1:episodeCount,
    %disp(sprintf('Running episode %d', ei));
    curpos = start;
    nextpos = start;
    
    %epsilon or greedy
    if(rand > epsilon) % greedy
        [qmax, a] = max(Q(curpos.row,curpos.col,:));
    else
        a = IntRand(1, actionCount);
    end

    while(PosCmp(curpos, goal) ~= 0)
        % take action a, observe r, and nextpos
        nextpos = GiveNextPos(curpos, a, windpowers, gridcols, gridrows);
        if(PosCmp(nextpos, goal) ~= 0), r = -1; else r = 0; end

        % choose a_next from nextpos
        [qmax, a_next] = max(Q(nextpos.row,nextpos.col,:));
        if(rand <= epsilon) % explore
            a_next = IntRand(1, actionCount);
        end
        
        % update Q: Sarsa
        curQ = Q(curpos.row, curpos.col, a);
        nextQ = qmax; %Q(nextpos.row, nextpos.col, a_next);
        Q(curpos.row, curpos.col, a) = curQ + alpha*(r + gamma*nextQ - curQ);
    
        curpos = nextpos; a = a_next;
    end % states in each episode
    
    % if the current state of the world is going to be drawn ...
    if(selectedEpIndex <= length(selectedEpisodes) && ei == selectedEpisodes(selectedEpIndex))
        curpos = start;
        rows = []; cols = []; acts = [];
        for i = 1:(gridrows + gridcols) * 10,
            [qmax, a] = max(Q(curpos.row,curpos.col,:));
            nextpos = GiveNextPos(curpos, a, windpowers, gridcols, gridrows);
            rows = [rows curpos.row];
            cols = [cols curpos.col];
            acts = [acts a];

            if(PosCmp(nextpos, goal) == 0), break; end
            curpos = nextpos;
        end % states in each episode
        
        %figure;
        figure('Name',sprintf('Episode: %d', ei), 'NumberTitle','off');
        DrawWindyEpisodeState(rows, cols, acts, start.row, start.col, goal.row, goal.col, windpowers, gridrows, gridcols, fontsize);
        if(showTitle == 1),
            title(sprintf('Windy grid-world SARSA - episode %d - (\\epsilon: %3.3f), (\\alpha = %3.4f), (\\gamma = %1.1f)', ei, epsilon, alpha, gamma));
        end
        
        selectedEpIndex = selectedEpIndex + 1;
    end

end % episodes loop

function c = PosCmp(pos1, pos2)
c = pos1.row - pos2.row;
if(c == 0)
    c = c + pos1.col - pos2.col;
end

function nextPos = GiveNextPos(curPos, actionIndex, windpowers, gridCols, gridRows)
nextPos = curPos;
switch actionIndex
   case 1 % east
       nextPos.col = curPos.col + 1;
   case 2 % south
       nextPos.row = curPos.row + 1;
   case 3 % west
       nextPos.col = curPos.col - 1;
   case 4 % north
       nextPos.row = curPos.row - 1;
   case 5 % northeast 
       nextPos.col = curPos.col + 1;
       nextPos.row = curPos.row - 1;
   case 6 % southeast 
       nextPos.col = curPos.col + 1;
       nextPos.row = curPos.row + 1;
   case 7 % southwest
       nextPos.col = curPos.col - 1;
       nextPos.row = curPos.row + 1;
   case 8 % northwest
       nextPos.col = curPos.col - 1;
       nextPos.row = curPos.row - 1;
   case 9 % hold
       nextPos = curPos;
   otherwise
      disp(sprintf('invalid action index: %d', actionIndex))
end
if(nextPos.col <= 0), nextPos.col = 1; end
if(nextPos.col > gridCols), nextPos.col = gridCols; end
nextPos.row = nextPos.row - windpowers(nextPos.col);
if(nextPos.row <= 0), nextPos.row = 1; end
if(nextPos.row > gridRows), nextPos.row = gridRows; end

function n = IntRand(lowerBound, upperBound)
n = floor((upperBound - lowerBound) * rand + lowerBound);
