function V = RLRandomWalk(options)
% RLRandomWalk: implements the random-walk problem through the reinforcement
% learning methods (namely the TD(0) method)

% You can pass the parameters of the problem, through the options
% structure, otherwise a default settings is used for running the program.

% written by: Sina Iravanian - June 2009
% sina@sinairv.com
% Please send your comments or bug reports to the above email address.

if(nargin < 1),
    nStates = 7;
    gamma = 1;
    alpha = 0.01;
    nEpisodes = 5000;
    selectedEpisodes = [1 20 200 1000 5000];
    showTitle = 1;
else
    nStates = options.nStates;
    gamma = options.gamma;
    alpha = options.alpha;
    nEpisodes = options.nEpisodes;
    selectedEpisodes = options.selectedEpisodes;
    showTitle = options.showTitle;
end

selectedEpIndex = 1;
Graphs = (1:nStates - 2)/(nStates - 1);
Legends = {'Ideal'};


V = ones(1,nStates) * 0.5; V(1) = 0; V(end) = 0;
for ei = 1:nEpisodes,
   % find the initial state
   if(mod(nStates, 2) == 0)
        s = nStates / 2;
   else
        s = (nStates + 1) / 2; % the initial state
   end
    
   while s ~= 1 && s ~= nStates,
       % take action according to the policy (random walk)
       if(rand > 0.5)
           s_next = s + 1;
       else
           s_next = s - 1;
       end
       
       % set reward
       if(s_next == nStates)
           r = 1;
       else
           r = 0;
       end
       
       % update Value Table (V)
       V(s) = V(s) + alpha * ( r + gamma * V(s_next) - V(s));
       
       s = s_next;
   end
   if(selectedEpIndex <= length(selectedEpisodes) && ei == selectedEpisodes(selectedEpIndex))
       Graphs = [Graphs; V(2:nStates - 1)];
       Legends{end + 1} = sprintf('%d', ei);
       selectedEpIndex = selectedEpIndex + 1;
   end
end

V = V(2:nStates - 1);
figure;
plot(1:nStates - 2, Graphs', '.-');
legend(Legends,'Location', 'NorthEastOutside');
if(showTitle == 1),
    title(sprintf('Random Walk for %d nodes, (\\alpha = %3.4f), (\\gamma = %1.1f)', nStates - 2, alpha, gamma));
end
axis([0, nStates-1, 0,1]);