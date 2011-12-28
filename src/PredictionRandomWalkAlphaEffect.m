function PredictionRandomWalkAlphaEffect(options)
% PredictionRandomWalkAlphaEffect: analyzes the effect of the learning rate
% (alpha) together with the discount factor (gamma) in the prediction error 
% of the random walk problem

% You can pass the parameters of the problem, through the options
% structure, otherwise a default settings is used for running the program.

% written by: Sina Iravanian - June 2009
% sina@sinairv.com
% Please send your comments or bug reports to the above email address.

if(nargin < 1)
    nStates = 7;
    nTrainingSets = 500;
    nSequences = 20;
    alphas = [0.0 0.1 0.2 0.3 0.4];
    lambdas = [0 0.3 0.8 1];
    showTitle = 1;
else
    nStates = options.nStates; %7;
    nTrainingSets = options.nTrainingSets; % 100;
    nSequences = options.nSequences; % 10;
    alphas = options.alphas; %[0.0 0.1 0.2 0.3 0.4];
    lambdas = options.lambdas;
    showTitle = options.showTitle;
end

loptions.nStates = nStates;
loptions.nSequences = nSequences;
loptions.nTrainingSets = nTrainingSets;
loptions.doPlot = 0;
loptions.alpha = -1;
loptions.lambdas = lambdas; %[0 0.3 0.8 1];
loptions.showTitle = showTitle;

Graphs = [];
Legends = {};
for li = 1:length(loptions.lambdas),
    Legends{end + 1} = sprintf('%1.1f', loptions.lambdas(li));
end

for ai = 1:length(alphas),
    loptions.alpha = alphas(ai);
    rmsErr = PredictionRandomWalk(loptions);
    Graphs = [Graphs; rmsErr];
end

figure;
plot(alphas, Graphs', '.-');
legend(Legends,'Location', 'NorthEastOutside');
xlabel('\alpha');
ylabel('RMS Error');
if(showTitle == 1),
    title(sprintf('Effect of \\alpha in Random Walk for %d nodes for %d training sets of %d sequences for different \\lambda s', nStates - 2, nTrainingSets, nSequences));
end
