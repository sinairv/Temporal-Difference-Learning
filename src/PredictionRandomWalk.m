function totalrms = PredictionRandomWalk(options)
% PredictionRandomWalk: analyzes the effect the discount factor (gamma) 
% in the prediction error of the random walk problem with constant learning
% rate (alpha)

% You can pass the parameters of the problem, through the options
% structure, otherwise a default settings is used for running the program.

% written by: Sina Iravanian - June 2009
% sina@sinairv.com
% Please send your comments or bug reports to the above email address.

if(nargin < 1)
    alpha = 0.1;
    nStates = 7;
    nTrainingSets = 100;
    nSequences = 40;
    doPlot = 1;
    showTitle = 1;
    lambdas = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
else
    alpha = options.alpha; % 0.1;
    nStates = options.nStates; % 7;
    nTrainingSets = options.nTrainingSets; % 100;
    nSequences = options.nSequences; % 10;
    doPlot = options.doPlot; % 1
    lambdas = options.lambdas; %[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
    showTitle = options.showTitle;
end


optValues = (1:nStates - 2)/(nStates - 1);
totalrms = zeros(1, length(lambdas));

for ti = 1:nTrainingSets,
    trainingSet = {};
    % build the training sets
    for si = 1:nSequences,
        [r, z] = GenerateRandomWalkSequence(nStates);
        trainingSet{end + 1} = [r, z];
    end
    
    for li = 1:length(lambdas),
        w = 0.5*ones(nStates, 1); w(1) = 0; w(end) = 1; %weights(li,:)';
        for si = 1:nSequences,
            curSeq = trainingSet{si};
            z = curSeq(end);
            curSeq = curSeq(1:end-1);
            %w = PerformTDLambda(nStates, curSeq, z, w, alpha, lambdas(li));
            w = PerformTDLambdaFinalUpdate(nStates, curSeq, z, w, alpha, lambdas(li));
        end
        rmsErr = VectorRMS(w(2:nStates-1)' - optValues);
        totalrms(li) = totalrms(li) + rmsErr;
    end
end

totalrms = totalrms ./ nTrainingSets;

if(doPlot ~= 0),
    figure;
    plot(lambdas, totalrms, '.-');
    xlabel('\lambda');
    ylabel('RMS Error');
    if(showTitle),
        title(sprintf('Effect of \\lambda in Random Walk for %d nodes for %d training sets of %d sequences (\\alpha = %1.2f)', nStates - 2, nTrainingSets, nSequences, alpha));
    end
end

function rms = VectorRMS(x)
rms = norm(x) / sqrt(length(x));

function w = PerformTDLambdaFinalUpdate(NodesCount, seq, z, w0, alpha, lambda) 
w = w0;
w2 = w;
xt = GetObservationVector(NodesCount, seq(1) + 1);
Pt = w' * xt;
S = xt;
for i=2:length(seq),
    xt = GetObservationVector(NodesCount, seq(i) + 1);
    Pt_1 = Pt;
    Pt = w' * xt;
    dw = alpha * (Pt - Pt_1)*S;
    S = xt + (lambda * S);
    w2 = w2 + dw;
end
dw = alpha * (z - Pt)*S;
w2 = w2 + dw;
w = w2;

function w = PerformTDLambda(NodesCount, seq, z, w0, alpha, lambda) 
w = w0;
xt = GetObservationVector(NodesCount, seq(1)+1);
Pt = w' * xt;
S = xt;
for i=2:length(seq),
    xt = GetObservationVector(NodesCount, seq(i)+1);
    Pt_1 = Pt;
    Pt = w' * xt;
    dw = alpha * (Pt - Pt_1)*S;
    S = xt + (lambda * S);
    w = w + dw;
end
dw = alpha * (z - Pt)*S;
w = w + dw;

function xt = GetObservationVector(NodesCount, i)
xt = zeros(NodesCount, 1);
xt(i) = 1;

