function varargout = DemoGUI(varargin)
% DEMOGUI M-file for DemoGUI.fig, the main GUI to the TD Demo
%      DEMOGUI, by itself, creates a new DEMOGUI or raises the existing
%      singleton*.
%
%      H = DEMOGUI returns the handle to a new DEMOGUI or the handle to
%      the existing singleton*.
%
%      DEMOGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMOGUI.M with the given input arguments.
%
%      DEMOGUI('Property','Value',...) creates a new DEMOGUI or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DemoGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DemoGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% written by: Sina Iravanian - June 2009
% sina@sinairv.com
% Please send your comments or bug reports to the above email address.

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DemoGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DemoGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before DemoGUI is made visible.
function DemoGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DemoGUI (see VARARGIN)

% Choose default command line output for DemoGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);

% UIWAIT makes DemoGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DemoGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

set(handles.panelPredRandomWalk, 'Visible', 'on');
set(handles.panelRLRandomWalk, 'Visible', 'off');
set(handles.panelGridWorlds, 'Visible', 'off');

pos = get(handles.panelGridWorlds, 'Position');
set(handles.panelPredRandomWalk, 'Position', pos);
set(handles.panelRLRandomWalk, 'Position', pos);


% Update handles structure
guidata(handles.figure1, handles);

% --- Executes during object creation, after setting all properties.
function gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function alpha_Callback(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of alpha as text
%        str2double(get(hObject,'String')) returns contents of alpha as a double

% --- Executes during object creation, after setting all properties.
function alpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nStates_Callback(hObject, eventdata, handles)
% hObject    handle to nStates (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of nStates as text
%        str2double(get(hObject,'String')) returns contents of nStates as a double

% --- Executes during object creation, after setting all properties.
function nStates_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nStates (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nEpisodes_Callback(hObject, eventdata, handles)
% hObject    handle to nEpisodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of nEpisodes as text
%        str2double(get(hObject,'String')) returns contents of nEpisodes as a double

% --- Executes during object creation, after setting all properties.
function nEpisodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nEpisodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function selectedEpisodes_Callback(hObject, eventdata, handles)
% hObject    handle to selectedEpisodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of selectedEpisodes as text
%        str2double(get(hObject,'String')) returns contents of selectedEpisodes as a double

% --- Executes during object creation, after setting all properties.
function selectedEpisodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selectedEpisodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in btnGo.
function btnGo_Callback(hObject, eventdata, handles)
% hObject    handle to btnGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

showTitle = get(handles.cbShowPlotTitle, 'Value');
options.showTitle = showTitle;

demoType = get(handles.cmbDemoType,'Value');
if(demoType == 1), % Prediction Random Walk
    predType = get(handles.cmbPredType ,'Value');
    
    options.nStates = str2num(get(handles.prdNStates, 'String'));
    options.nTrainingSets = str2num(get(handles.prdNTSets, 'String'));
    options.nSequences = str2num(get(handles.prdNEpisodes, 'String'));
    options.lambdas = str2num(get(handles.prdLambdas, 'String')); 

    if(predType == 1), % Effect of lambda
        options.alpha = str2num(get(handles.prdAlpha, 'String'));
        options.doPlot = 1;
        PredictionRandomWalk(options);
    elseif(predType == 2), % Effect of alpha and lambda
        options.alphas = str2num(get(handles.prdAlphas, 'String'));
        PredictionRandomWalkAlphaEffect(options);
    end
elseif(demoType == 2), % RL Random Walk
    options.gamma = str2num(get(handles.gamma, 'String'));
    options.alpha = str2num(get(handles.alpha, 'String'));
    options.nStates = str2num(get(handles.nStates, 'String'));
    options.nEpisodes = str2num(get(handles.nEpisodes, 'String'));
    options.selectedEpisodes = str2num(get(handles.selectedEpisodes, 'String'));

    RLRandomWalk(options);
elseif(demoType == 3), % Grid Worlds
    gridType = get(handles.cmbGridType,'Value');
    agentMoves = get(handles.cmbAgentMoves,'Value');
    algorithmType = get(handles.cmbAlgorithm,'Value');

    if(agentMoves == 1),
        options.isKing = 0; 
        options.canHold = 0;
    elseif(agentMoves == 2),
        options.isKing = 1; 
        options.canHold = 0;
    elseif(agentMoves == 3)
        options.isKing = 1; 
        options.canHold = 1;
    end

    options.gamma = str2num(get(handles.gwGamma, 'String'));
    options.alpha = str2num(get(handles.gwAlpha, 'String'));
    options.epsilon = str2num(get(handles.gwEpsilon, 'String'));
    options.episodeCount = str2num(get(handles.gwNEpisodes, 'String'));
    options.selectedEpisodes = str2num(get(handles.gwSelectedEpisodes, 'String'));
    
    griddims = str2num(get(handles.gwGridDims, 'String'));
    options.gridcols = griddims(2);
    options.gridrows = griddims(1);
    
    startPt = str2num(get(handles.gwStart, 'String'));
    start.row = startPt(1);
    start.col = startPt(2);
    options.start = start;

    goalPt = str2num(get(handles.gwGoal, 'String'));
    goal.row = goalPt(1);
    goal.col = goalPt(2);
    options.goal = goal;

    options.fontsize = str2num(get(handles.fontSize, 'String'));

    if(gridType == 1),
        if(algorithmType == 1),
            GridWorldSARSA(options);
        elseif(algorithmType == 2),
            GridWorldQLearning(options);
        end
    elseif(gridType == 2),
        options.windpowers = str2num(get(handles.gwWindPowers, 'String'));
        if(algorithmType == 1),
            WindyGridWorldSARSA(options);
        elseif(algorithmType == 2),
            WindyGridWorldQLearning(options);
        end
    elseif(gridType == 3),
        if(algorithmType == 1),
            CliffWalkingSARSA(options);
        elseif(algorithmType == 2),
            CliffWalkingQLearning(options);
        end
    end
end

% --- Executes on selection change in cmbPredefinedDemos.
function cmbPredefinedDemos_Callback(hObject, eventdata, handles)
% hObject    handle to cmbPredefinedDemos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns cmbPredefinedDemos contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cmbPredefinedDemos
sel = get(hObject,'Value');
if(sel == 1), % Pred RW Lambda
    set(handles.cmbDemoType, 'Value', 1);
    set(handles.cmbPredType, 'Value', 1);
    set(handles.prdAlpha, 'String', 0.1);
    set(handles.prdNStates, 'String', 7);
    set(handles.prdNTSets, 'String', 100);
    set(handles.prdNEpisodes, 'String', 40);
    set(handles.prdLambdas, 'String', '[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]');
elseif(sel == 2),
    set(handles.cmbDemoType, 'Value', 1);
    set(handles.cmbPredType, 'Value', 2);
    set(handles.prdNStates, 'String', 7);
    set(handles.prdNTSets, 'String', 500);
    set(handles.prdNEpisodes, 'String', 20);
    set(handles.prdLambdas, 'String', '[0 0.3 0.8 1]');
    set(handles.prdAlphas, 'String', '[0.0 0.1 0.2 0.3 0.4]');
elseif(sel == 3),
    set(handles.cmbDemoType, 'Value', 2);
    set(handles.gamma, 'String', 1);
    set(handles.alpha, 'String', 0.01);
    set(handles.nStates, 'String', 7);
    set(handles.nEpisodes, 'String', 5000);
    set(handles.selectedEpisodes, 'String','[1 20 200 1000 5000]');
elseif(sel == 4),
    set(handles.cmbDemoType, 'Value', 2);
    set(handles.gamma, 'String', 1);
    set(handles.alpha, 'String', 0.01);
    set(handles.nStates, 'String', 51);
    set(handles.nEpisodes, 'String', 5000);
    set(handles.selectedEpisodes, 'String','[1 20 200 1000 5000]');
elseif(sel == 5),
    set(handles.cmbDemoType, 'Value', 3);
    set(handles.cmbGridType, 'Value', 1);
    set(handles.cmbAlgorithm, 'Value', 1);
    set(handles.cmbAgentMoves, 'Value', 1);
    set(handles.gwGamma, 'String', 0.9);
    set(handles.gwAlpha, 'String', 0.1);
    set(handles.gwEpsilon, 'String', 0.1);
    set(handles.gwNEpisodes, 'String', 1000);
    set(handles.gwSelectedEpisodes, 'String', '[20 200 700 1000]');
    set(handles.gwGridDims, 'String', '[7 10]');
    set(handles.gwStart, 'String', '[4 1]');
    set(handles.gwGoal, 'String', '[4 8]');
elseif(sel == 6),
    set(handles.cmbDemoType, 'Value', 3);
    set(handles.cmbGridType, 'Value', 1);
    set(handles.cmbAlgorithm, 'Value', 1);
    set(handles.cmbAgentMoves, 'Value', 1);
    set(handles.gwGamma, 'String', 0.9);
    set(handles.gwAlpha, 'String', 0.3);
    set(handles.gwEpsilon, 'String', 0.1);
    set(handles.gwNEpisodes, 'String', 4000);
    set(handles.gwSelectedEpisodes, 'String', '[1000 2000 3000 4000]');
    set(handles.gwGridDims, 'String', '[20 20]');
    set(handles.gwStart, 'String', '[2 2]');
    set(handles.gwGoal, 'String', '[19 19]');
elseif(sel == 7),
    set(handles.cmbDemoType, 'Value', 3);
    set(handles.cmbGridType, 'Value', 1);
    set(handles.cmbAlgorithm, 'Value', 1);
    set(handles.cmbAgentMoves, 'Value', 2);
    set(handles.gwGamma, 'String', 0.9);
    set(handles.gwAlpha, 'String', 0.1);
    set(handles.gwEpsilon, 'String', 0.1);
    set(handles.gwNEpisodes, 'String', 4000);
    set(handles.gwSelectedEpisodes, 'String', '[1000 2000 3000 4000]');
    set(handles.gwGridDims, 'String', '[20 20]');
    set(handles.gwStart, 'String', '[2 2]');
    set(handles.gwGoal, 'String', '[19 19]');
elseif(sel == 8),
    set(handles.cmbDemoType, 'Value', 3);
    set(handles.cmbGridType, 'Value', 2);
    set(handles.cmbAlgorithm, 'Value', 1);
    set(handles.cmbAgentMoves, 'Value', 1);
    set(handles.gwGamma, 'String', 0.9);
    set(handles.gwAlpha, 'String', 0.1);
    set(handles.gwEpsilon, 'String', 0.1);
    set(handles.gwNEpisodes, 'String', 1000);
    set(handles.gwSelectedEpisodes, 'String', '[20 200 700 1000]');
    set(handles.gwGridDims, 'String', '[7 10]');
    set(handles.gwStart, 'String', '[4 1]');
    set(handles.gwGoal, 'String', '[4 8]');
    set(handles.gwWindPowers, 'String', '[0 0 0 1 1 1 2 2 1 0]');
elseif(sel == 9),
    set(handles.cmbDemoType, 'Value', 3);
    set(handles.cmbGridType, 'Value', 2);
    set(handles.cmbAlgorithm, 'Value', 1);
    set(handles.cmbAgentMoves, 'Value', 2);
    set(handles.gwGamma, 'String', 0.9);
    set(handles.gwAlpha, 'String', 0.1);
    set(handles.gwEpsilon, 'String', 0.1);
    set(handles.gwNEpisodes, 'String', 1000);
    set(handles.gwSelectedEpisodes, 'String', '[20 200 700 1000]');
    set(handles.gwGridDims, 'String', '[7 10]');
    set(handles.gwStart, 'String', '[4 1]');
    set(handles.gwGoal, 'String', '[4 8]');
    set(handles.gwWindPowers, 'String', '[0 0 0 1 1 1 2 2 1 0]');
elseif(sel == 10),
    set(handles.cmbDemoType, 'Value', 3);
    set(handles.cmbGridType, 'Value', 3);
    set(handles.cmbAlgorithm, 'Value', 1);
    set(handles.cmbAgentMoves, 'Value', 1);
    set(handles.gwGamma, 'String', 0.9);
    set(handles.gwAlpha, 'String', 0.05);
    set(handles.gwEpsilon, 'String', 0.1);
    set(handles.gwNEpisodes, 'String', 5000);
    set(handles.gwSelectedEpisodes, 'String', '[20 200 700 1000 2000 5000]');
    set(handles.gwGridDims, 'String', '[7 10]');
    set(handles.gwStart, 'String', '[7 1]');
    set(handles.gwGoal, 'String', '[7 10]');
elseif(sel == 11),
    set(handles.cmbDemoType, 'Value', 3);
    set(handles.cmbGridType, 'Value', 3);
    set(handles.cmbAlgorithm, 'Value', 2);
    set(handles.cmbAgentMoves, 'Value', 1);
    set(handles.gwGamma, 'String', 0.9);
    set(handles.gwAlpha, 'String', 0.05);
    set(handles.gwEpsilon, 'String', 0.1);
    set(handles.gwNEpisodes, 'String', 5000);
    set(handles.gwSelectedEpisodes, 'String', '[20 200 700 1000 2000 5000]');
    set(handles.gwGridDims, 'String', '[7 10]');
    set(handles.gwStart, 'String', '[7 1]');
    set(handles.gwGoal, 'String', '[7 10]');
elseif(sel == 12),
    set(handles.cmbDemoType, 'Value', 3);
    set(handles.cmbGridType, 'Value', 3);
    set(handles.cmbAlgorithm, 'Value', 1);
    set(handles.cmbAgentMoves, 'Value', 2);
    set(handles.gwGamma, 'String', 0.9);
    set(handles.gwAlpha, 'String', 0.05);
    set(handles.gwEpsilon, 'String', 0.1);
    set(handles.gwNEpisodes, 'String', 5000);
    set(handles.gwSelectedEpisodes, 'String', '[20 200 700 1000 2000 5000]');
    set(handles.gwGridDims, 'String', '[7 10]');
    set(handles.gwStart, 'String', '[7 1]');
    set(handles.gwGoal, 'String', '[7 10]');
elseif(sel == 13),
    set(handles.cmbDemoType, 'Value', 3);
    set(handles.cmbGridType, 'Value', 3);
    set(handles.cmbAlgorithm, 'Value', 2);
    set(handles.cmbAgentMoves, 'Value', 2);
    set(handles.gwGamma, 'String', 0.9);
    set(handles.gwAlpha, 'String', 0.05);
    set(handles.gwEpsilon, 'String', 0.1);
    set(handles.gwNEpisodes, 'String', 5000);
    set(handles.gwSelectedEpisodes, 'String', '[20 200 700 1000 2000 5000]');
    set(handles.gwGridDims, 'String', '[7 10]');
    set(handles.gwStart, 'String', '[7 1]');
    set(handles.gwGoal, 'String', '[7 10]');
end


RunAllComboCallBacks(hObject, eventdata, handles);

function RunAllComboCallBacks(hObject, eventdata, handles)
cmbGridType_Callback(hObject, eventdata, handles);
cmbPredType_Callback(hObject, eventdata, handles);
cmbDemoType_Callback(hObject, eventdata, handles);


% --- Executes on selection change in cmbDemoType.
function cmbDemoType_Callback(hObject, eventdata, handles)
% hObject    handle to cmbDemoType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

sel = get(handles.cmbDemoType, 'Value');
if(sel == 1), % Prediction Random Walk
    set(handles.panelPredRandomWalk, 'Visible', 'on');
    set(handles.panelRLRandomWalk, 'Visible', 'off');
    set(handles.panelGridWorlds, 'Visible', 'off');
elseif(sel == 2), % RL Random Walk
    set(handles.panelPredRandomWalk, 'Visible', 'off');
    set(handles.panelRLRandomWalk, 'Visible', 'on');
    set(handles.panelGridWorlds, 'Visible', 'off');
elseif(sel == 3), % Grid Worlds 
    set(handles.panelPredRandomWalk, 'Visible', 'off');
    set(handles.panelRLRandomWalk, 'Visible', 'off');
    set(handles.panelGridWorlds, 'Visible', 'on');
end

% --- Executes during object creation, after setting all properties.
function cmbDemoType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmbDemoType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in cmbPredType.
function cmbPredType_Callback(hObject, eventdata, handles)
% hObject    handle to cmbPredType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

sel = get(handles.cmbPredType,'Value');
if(sel == 1), % Effect of lambda
    set(handles.prdAlpha, 'Enable', 'on');
    set(handles.prdAlphas, 'Enable', 'off');
elseif(sel == 2), % Effect of alpha and lambda
    set(handles.prdAlpha, 'Enable', 'off');
    set(handles.prdAlphas, 'Enable', 'on');
end

% --- Executes during object creation, after setting all properties.
function cmbPredType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmbPredType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function prdNStates_Callback(hObject, eventdata, handles)
% hObject    handle to prdNStates (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of prdNStates as text
%        str2double(get(hObject,'String')) returns contents of prdNStates as a double

% --- Executes during object creation, after setting all properties.
function prdNStates_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prdNStates (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function prdAlpha_Callback(hObject, eventdata, handles)
% hObject    handle to prdAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of prdAlpha as text
%        str2double(get(hObject,'String')) returns contents of prdAlpha as a double

% --- Executes during object creation, after setting all properties.
function prdAlpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prdAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function prdNTSets_Callback(hObject, eventdata, handles)
% hObject    handle to prdNTSets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of prdNTSets as text
%        str2double(get(hObject,'String')) returns contents of prdNTSets as a double

% --- Executes during object creation, after setting all properties.
function prdNTSets_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prdNTSets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function prdNEpisodes_Callback(hObject, eventdata, handles)
% hObject    handle to prdNEpisodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of prdNEpisodes as text
%        str2double(get(hObject,'String')) returns contents of prdNEpisodes as a double

% --- Executes during object creation, after setting all properties.
function prdNEpisodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prdNEpisodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function prdAlphas_Callback(hObject, eventdata, handles)
% hObject    handle to prdAlphas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of prdAlphas as text
%        str2double(get(hObject,'String')) returns contents of prdAlphas as a double

% --- Executes during object creation, after setting all properties.
function prdAlphas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prdAlphas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function prdLambdas_Callback(hObject, eventdata, handles)
% hObject    handle to prdLambdas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of prdLambdas as text
%        str2double(get(hObject,'String')) returns contents of prdLambdas as a double

% --- Executes during object creation, after setting all properties.
function prdLambdas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prdLambdas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in cmbGridType.
function cmbGridType_Callback(hObject, eventdata, handles)
% hObject    handle to cmbGridType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns cmbGridType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cmbGridType
sel = get(handles.cmbGridType,'Value');
if(sel == 2),
    set(handles.gwWindPowers, 'Enable', 'on');
else
    set(handles.gwWindPowers, 'Enable', 'off');
end

% --- Executes during object creation, after setting all properties.
function cmbGridType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmbGridType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in cmbAlgorithm.
function cmbAlgorithm_Callback(hObject, eventdata, handles)
% hObject    handle to cmbAlgorithm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns cmbAlgorithm contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cmbAlgorithm

% --- Executes during object creation, after setting all properties.
function cmbAlgorithm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmbAlgorithm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in cmbAgentMoves.
function cmbAgentMoves_Callback(hObject, eventdata, handles)
% hObject    handle to cmbAgentMoves (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns cmbAgentMoves contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cmbAgentMoves

% --- Executes during object creation, after setting all properties.
function cmbAgentMoves_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmbAgentMoves (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function gwGamma_Callback(hObject, eventdata, handles)
% hObject    handle to gwGamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of gwGamma as text
%        str2double(get(hObject,'String')) returns contents of gwGamma as a double
% --- Executes during object creation, after setting all properties.

function gwGamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gwGamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function gwAlpha_Callback(hObject, eventdata, handles)
% hObject    handle to gwAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of gwAlpha as text
%        str2double(get(hObject,'String')) returns contents of gwAlpha as a double

% --- Executes during object creation, after setting all properties.
function gwAlpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gwAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function gwNEpisodes_Callback(hObject, eventdata, handles)
% hObject    handle to gwNEpisodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of gwNEpisodes as text
%        str2double(get(hObject,'String')) returns contents of gwNEpisodes as a double

% --- Executes during object creation, after setting all properties.
function gwNEpisodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gwNEpisodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function gwSelectedEpisodes_Callback(hObject, eventdata, handles)
% hObject    handle to gwSelectedEpisodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of gwSelectedEpisodes as text
%        str2double(get(hObject,'String')) returns contents of gwSelectedEpisodes as a double

% --- Executes during object creation, after setting all properties.
function gwSelectedEpisodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gwSelectedEpisodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function gwEpsilon_Callback(hObject, eventdata, handles)
% hObject    handle to gwEpsilon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of gwEpsilon as text
%        str2double(get(hObject,'String')) returns contents of gwEpsilon as a double

% --- Executes during object creation, after setting all properties.
function gwEpsilon_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gwEpsilon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function gwGridDims_Callback(hObject, eventdata, handles)
% hObject    handle to gwGridDims (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of gwGridDims as text
%        str2double(get(hObject,'String')) returns contents of gwGridDims as a double

% --- Executes during object creation, after setting all properties.
function gwGridDims_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gwGridDims (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function gwStart_Callback(hObject, eventdata, handles)
% hObject    handle to gwStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of gwStart as text
%        str2double(get(hObject,'String')) returns contents of gwStart as a double

% --- Executes during object creation, after setting all properties.
function gwStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gwStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function gwGoal_Callback(hObject, eventdata, handles)
% hObject    handle to gwGoal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of gwGoal as text
%        str2double(get(hObject,'String')) returns contents of gwGoal as a double

% --- Executes during object creation, after setting all properties.
function gwGoal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gwGoal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function gwWindPowers_Callback(hObject, eventdata, handles)
% hObject    handle to gwWindPowers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of gwWindPowers as text
%        str2double(get(hObject,'String')) returns contents of gwWindPowers as a double

% --- Executes during object creation, after setting all properties.
function gwWindPowers_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gwWindPowers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function cmbPredefinedDemos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmbPredefinedDemos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in cbShowPlotTitle.
function cbShowPlotTitle_Callback(hObject, eventdata, handles)
% hObject    handle to cbShowPlotTitle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of cbShowPlotTitle

function fontSize_Callback(hObject, eventdata, handles)
% hObject    handle to fontSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of fontSize as text
%        str2double(get(hObject,'String')) returns contents of fontSize as a double

% --- Executes during object creation, after setting all properties.
function fontSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fontSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

